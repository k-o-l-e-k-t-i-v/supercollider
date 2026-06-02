(
s.quit; 
// Increase RT memory to 128MB to be safe for ProxySpace overhead
s.options.memSize = 8192 * 16;
s.options.numBuffers = 2048;
s.options.maxNodes = 1024 * 4;

s.waitForBoot {
    p = ProxySpace.push(s);
    "Mothership memory expanded. Ready.".postln;
};
)

p = ProxySpace.push(s);
p.push();

(
p.clear; // Clear the ProxySpace to reset indexes
s.nextBufferNumber; // Reset buffer counter

// Use 'b' as a global variable instead of '~diffBuf' to stay out of ProxySpace's way
~width = 720;
~height = 576;
~size = (~width * ~height).asInteger;

b = Buffer.alloc(s, ~size, 1);
~rawData = Int8Array.newClear(~size);

"Buffer allocated as 'b'. ProxySpace is clear.".postln;
)
(
~wavetable = {
    // Scan through the whole buffer 5 times per second
    var phase = LFSaw.ar(5).range(0, BufFrames.kr(~diffBuf));
    var sig = BufRd.ar(1, ~diffBuf, phase, interpolation: 2);
    
    // Cleanup and stereo spread
    LeakDC.ar(sig).dup * 0.2;
};

~wavetable.play; // Starts the sound
~wavetable.fadeTime = 2; // Smooth transitions when you change the code

)

(
~grains = {
    var trig = Impulse.ar(MouseX.kr(5, 100)); // Trigger rate controlled by mouse
    var pos = LFNoise1.kr(0.1).range(0, 1);  // Slowly drift across the screen data
    var dur = 0.1;
    var sig = TGrains.ar(2, trig, ~diffBuf, 1, pos * BufDur.kr(~diffBuf), dur);

    sig * 0.4;
};

~grains.play;
)
