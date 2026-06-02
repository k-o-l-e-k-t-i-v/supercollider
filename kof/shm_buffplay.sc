(
// 1. Setup the physical buffer for one horizontal line
b = Buffer.alloc(s, 720, 1);
r = Int8Array.newClear(720);

// 2. The Bridge: Pulling the Y-axis slice from SHM
~updater.stop;
~updater = {
    var file;
    loop {
        if(File.exists("/dev/shm/sc_diff_buffer")) {
            file = File("/dev/shm/sc_diff_buffer", "rb");
            if(file.isOpen) {
                // Grab the first 720 bytes (Y-axis line 0)
                file.read(r);
                file.close;
                // Normalize for raw audio: 0-255 -> -1.0 to 1.0
                b.loadCollection(r.asFloat / 127.5 - 1.0);
            };
        };
        (1/30).wait; // 30fps update is fine for the 'timbre' change
    }
}.fork(AppClock);
)


(
~directLine = {
    // Determine the 'pitch' of your screen line loop
    // 720 samples at 44100Hz = ~61.25Hz fundamental frequency
    var freq = 61.25 * MouseX.kr(0.5, 2); // Still using MouseX for tuning, or change to 1.0

    // PlayBuf scans the buffer at the rate required to hit that frequency
    var rate = freq / (s.sampleRate / b.numFrames);
    var sig = PlayBuf.ar(1, b, rate, loop: 1);

    // Safety & Grit
    sig = LeakDC.ar(sig); // Remove DC offset so you don't blow your T520 speakers
    sig = sig.clip2(0.9);  // Force some rudeness

    sig.dup * 0.3;
};

~directLine.play;

)