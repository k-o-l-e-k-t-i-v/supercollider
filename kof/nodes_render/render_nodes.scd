// render_nodes.scd — batch renderer for all kof Ndef library entries.
//
// Renders every entry as 26-second stereo .flac to this directory.
// Filenames: <source_file>_<ndef_name>.flac
//   e.g. bug_hunt_a.flac, 1542592881_Nov19_Mon_kof18_aa.flac
//
// Resumable: existing files are skipped.
// Report: render_report.tsv
//
// Usage:
//   sclang render_nodes.scd
//   sclang render_nodes.scd [outdir]
//   sclang render_nodes.scd [outdir] [name1,name2,...]

var outdir, onlyNames, report, skipped, doneCount, fails, renderOne;
var ndefLib, probeArgs, p, recBuf, defName, b, ok, dur, buildFunc, testR, entryBody;
var monoBuf, consecBuf, numFrames, oscDone, oscDoneFlag;

outdir = thisProcess.nowExecutingPath.dirname;
dur = 26;
onlyNames = nil;
probeArgs = thisProcess.argv;
("argv: " ++ probeArgs).postln;
if(probeArgs.size > 0) { outdir = probeArgs[0] };
if(probeArgs.size > 1) { onlyNames = probeArgs[1].split($,).asSet };

if(File.exists(outdir).not) { File.mkdir(outdir) };
report = File(outdir ++ "/render_report.tsv", "a");
report.write("name\tstatus\tbpm\tfile\n");
skipped = 0;
doneCount = 0;
fails = 0;

load("/home/kof/src/sc/kof/ndef_library.scd");
ndefLib = ~ndefLib;
("Library entries: " ++ ndefLib.size).postln;

s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;
s.options.memSize = 65536 * 4;
s.options.threads = 4;
s.options.numWireBufs = 256;
s.options.blockSize = 128;
s.options.hardwareBufferSize = 512 * 4;

s.waitForBoot({
    p = ProxySpace.push(s);
    p.makeTempoClock(120 / 60);
    p.quant = 0;

    ~tick.kr(1);
    ~counter.kr(1);
    ~tempo.kr(120 / 60);
    ~tick = { Impulse.kr(~tempo.kr * 4) };
    ~counter = { PulseCount.kr(~tick.kr) };

    16.do { |i| currentEnvironment.put(("n" ++ (i + 1)).asSymbol, 0) };
    ~tick.play;
    ~counter.play;
    s.sync;

    monoBuf = Buffer.alloc(s, 4096, 1);
    consecBuf = Buffer.allocConsecutive(8, s, 4096, 1);
    s.sync;

    oscDone = OSCFunc({ |msg| oscDoneFlag = true }, \tr, s.addr);
    renderOne = { |entry|
        var name = entry.name.asSymbol;
        var bpm = entry.bpm ? 120;
        var sourceFile = entry.file ? "unknown";
        var stem = sourceFile.splitext[0] ? sourceFile;
        var filename = stem ++ "_" ++ name;
        var path = outdir ++ "/" ++ filename ++ ".flac";
        var bufMode = entry.buf ? 1;
        var seedSynth, recSyn, numBlocks, n, written, freedFlag;
        var rendered = false;

        if(onlyNames.notNil and: { onlyNames.includes(name.asString).not }) {
            // not in filter list
            false
        } {
            if(File.exists(path)) {
                report.write(filename ++ "\tSKIP\t" ++ bpm ++ "\t" ++ filename ++ ".flac\n");
                report.flush;
                skipped = skipped + 1;
                true
            } {
                entryBody = entry.body[1..entry.body.size - 2];
                buildFunc = ("{ |b| " ++ entryBody ++ " }").interpret;

                ("RENDER " ++ filename ++ "  bpm=" ++ bpm ++ "  seed=" ++ entry.seed).postln;

                try {
                    "  [1] rand/seed/env setup".postln;
                    thisThread.randSeed = entry.seed;
                    seedSynth = { RandSeed.kr(Done.kr(Line.kr(0, 1, 0.001)), entry.seed) }.play;
                    ~tempo.set(\tempo, bpm / 60);
                    p.clock.tempo_(bpm / 60);
                    s.sync;
                    "  [2] buffers".postln;

                    b = if(bufMode == 8, consecBuf, monoBuf);

                    numFrames = (s.sampleRate * dur).round;
                    numBlocks = (numFrames / s.options.blockSize).round;
                    recBuf = Buffer.alloc(s, numFrames, 2);
                    s.sync;
                    "  [3] SynthDef add".postln;

                    defName = ("ndef_" ++ filename).asSymbol;
                    testR = try { buildFunc.value(999999).value; "OK" } { |err| "FAIL: " ++ err.errorString };
                    ("  [2c] " ++ testR).postln;
                    SynthDef(defName, {
                        var sig = buildFunc.value.(b);
                        var pos, posKR, trig;
                        sig = sig.asArray;
                        if(sig.size == 1, { sig = sig ++ sig });
                        sig = sig[0..1];
                        pos = Phasor.ar(0, 1, 0, numFrames);
                        posKR = Phasor.kr(0, 1, 0, numBlocks);
                        trig = posKR >= (numBlocks - 1);
                        FreeSelf.kr(trig);
                        SendTrig.kr(trig, 0, 1);
                        DiskOut.ar(recBuf, sig * (pos < numFrames));
                    }).add;
                    s.sync;
                    "  [4] synth start".postln;

                    oscDoneFlag = false;
                    freedFlag = false;
                    recSyn = Synth(defName);
                    recSyn.onFree({ freedFlag = true });
                    s.sync;
                    ("  [5] synth started isPlaying=" ++ recSyn.isPlaying ++ ", polling").postln;
                    n = 0;
                    while({ oscDoneFlag.not and: { n < (dur * 6) } }, { 0.25.wait; n = n + 0.25 });
                    ("  [6] poll exited flag=" ++ oscDoneFlag ++ " after " ++ n ++ "s").postln;
                    if(oscDoneFlag.not) {
                        ("  STOP-TIMEOUT " ++ filename).postln;
                        recSyn.free;
                    };
                    n = 0;
                    while({ freedFlag.not and: { n < 10 } }, { 0.1.wait; n = n + 0.1 });
                    if(freedFlag.not) { recSyn.free; 0.5.wait };
                    ("  [7] synth freed").postln;
                    seedSynth.free;

                    if(oscDoneFlag) {
                        written = false;
                        recBuf.write(path, "flac", "int24");
                        ("  [8] wrote " ++ path ++ " bufFrames=" ++ recBuf.numFrames).postln;
                        n = 0;
                        while({ n < 20 }, { 0.1.wait; n = n + 0.1 });
                        recBuf.free;
                        try {
                            var metaPath = "/tmp/ndef_meta_" ++ name ++ ".txt";
                            var mf = File(metaPath, "w");
                            mf.write(entryBody);
                            mf.close;
                            ("metaflac --set-tag-from-file=\"COMMENT=" ++ metaPath ++ "\" \"" ++ path ++ "\"").systemCmd;
                            ("metaflac --set-tag=\"TITLE=" ++ name ++ "\" \"" ++ path ++ "\"").systemCmd;
                            ("metaflac --set-tag=\"BPM=" ++ bpm ++ "\" \"" ++ path ++ "\"").systemCmd;
                            ("metaflac --set-tag=\"SEED=" ++ entry.seed ++ "\" \"" ++ path ++ "\"").systemCmd;
                            ("metaflac --set-tag=\"ARTIST=kof\" \"" ++ path ++ "\"").systemCmd;
                            ("metaflac --set-tag=\"SOURCE=" ++ (entry[\source] ? "unknown") ++ "\" \"" ++ path ++ "\"").systemCmd;
                            ("metaflac --set-tag=\"TAGS=" ++ (entry.tags ? []).join(",") ++ "\" \"" ++ path ++ "\"").systemCmd;
                            File.delete(metaPath);
                            ("  [9] metadata embedded").postln;
                        } { |err| ("  METAFAIL " ++ name ++ ": " ++ err.errorString).postln };
                        rendered = true;
                    } {
                        ("  TIMEOUT-SKIP " ++ filename).postln;
                        recBuf.free;
                        File.delete(path);
                    };
                } { |err|
                    ("  FAIL " ++ filename ++ " : " ++ err.errorString).postln;
                    err.reportError;
                    recSyn !? { recSyn.free };
                    seedSynth !? { seedSynth.free };
                    recBuf !? { recBuf.free };
                    File.delete(path);
                };

                if(rendered) {
                    report.write(filename ++ "\tOK\t" ++ bpm ++ "\t" ++ filename ++ ".flac\n");
                    report.flush;
                    ("  DONE " ++ filename).postln;
                    true
                } {
                    report.write(filename ++ "\tFAIL\t" ++ bpm ++ "\t-\n");
                    report.flush;
                    false
                };
            };
        };
    };

    ndefLib.do { |entry, i|
        if(onlyNames.isNil or: { onlyNames.includes(entry.name.asString) }) {
            ("  pre-render " ++ i ++ " " ++ entry.name).postln;
            if(renderOne.value(entry)) { ("  post-render ok " ++ i).postln; doneCount = doneCount + 1 } { ("  post-render fail " ++ i).postln; fails = fails + 1 };
            ("  post-render done " ++ i).postln;
        };
    };

    ("\n==== RENDER COMPLETE: " ++ doneCount ++ " done, " ++ fails ++ " failed, " ++
     skipped ++ " skipped (existing) of " ++ ndefLib.size ++ " ====").postln;
    report.close;
    0.exit;
});
