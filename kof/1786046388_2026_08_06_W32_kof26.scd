s.boot;


f = SoundFile.new;
f.headerFormat = "raw";
f.sampleFormat = "float";
f.numChannels = 1; // Adjust to match your channels
f.sampleRate = 44100;

(
if (f.openRead("/tmp/01.raw")) {
    "FIFO opened successfully for reading.".postln;
    // Read your chunks here
    f.close;
};
)
