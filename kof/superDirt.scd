include("SuperDirt")
SuperDirt.start

(
    s.options.numBuffers = 1024 * 16; // increase this if you need to load more samples
    s.options.memSize = 8192 * 16; // increase this if you get "alloc failed" messages
    s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
    s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
    s.options.numInputBusChannels = 2; // set this to your hardware input channel size, if necessary

    s.reboot;
    s.waitForBoot {
        ~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
        ~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
        s.sync; // wait for samples to be read
        ~dirt.start(57120, [0, 0]);
    }
)
