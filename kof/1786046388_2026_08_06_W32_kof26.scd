(
s.waitForBoot({
    // 1. Initialize ProxySpace
    p = ProxySpace.push(s);
    
    // 2. Load your f32le data into a server Buffer 
    // (Use Buffer.read for headers, or Buffer.sendCollection if you parsed a raw FloatArray)
    ~audioBuf = Buffer.read(s, "/tmp/01.raw", action: {
        "Buffer loaded successfully. Frame count: ".post; ~audioBuf.numFrames.postln;
    });
    
    // 3. Define an Ndef proxy to play the buffer
    Ndef(\player, {
        var sig = PlayBuf.ar(
            numChannels: 1, 
            bufnum: ~audioBuf, 
            rate: BufRateScale.kr(~audioBuf) * MouseX.kr(0.5, 2.0), // Optional live pitch shift
            loop: 1
        );
        // Duplicate mono to stereo outputs
        sig ! 2; 
    });
    
    // 4. Route the Ndef to hardware outputs
    Ndef(\player).play;
});
)
