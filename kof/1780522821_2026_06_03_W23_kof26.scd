
p.push();
// DEBUG
s.dumpOSC(1);

(
~grid={
        var dev = In.kr(0).lag(3);
        var fund = 50.0 + dev;
        var sig = Array.fill(6, { |i|
            var freq = fund * (i * (dev+1) );
            SinOsc.ar(freq, 0, 1 / (i + 1 + (i*dev))) + LFSaw.ar(freq,dev)
        }).sum;
        LPF.ar(sig, 400 + (dev * 1000)) ! 2 * 0.1;
};
~grid.play;
)
