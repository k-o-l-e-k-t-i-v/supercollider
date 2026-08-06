f = SoundFile.new;
f.headerFormat = "raw";     // Tell it there is no header
f.sampleFormat = "float";   // Sets 32-bit floating-point (f32le)
f.numChannels = 1;          // Match your channel count (e.g., 2 for stereo)
f.sampleRate = 44100;       // Match your sample rate

// Now it will successfully parse the stream
if (f.openRead("/tmp/01.raw")) {
    ("Opened successfully. Total frames: " + f.numFrames).postln;
    
    // Allocate a buffer or read chunks here...
    
    f.close;
} {
    "Failed to open file descriptor.".warn;
};
