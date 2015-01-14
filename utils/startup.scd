// placing the following code in the file will cause these modifications to be made
// at startup (see also: ServerOptions)

Server.local.options.numOutputBusChannels = 2;    // change number of input and output channels
Server.local.options.numInputBusChannels = 2;
Server.internal.options.numOutputBusChannels = 2;
Server.internal.options.numInputBusChannels = 2;

Server.local.options.device = nil;                // use the system default soundcard

Server.local.options.blockSize = 128; // increase block size (default is 64)
Server.internal.options.blockSize = 128;


Server.local.options.maxLogins = 10; // increase block size (default is 64)
Server.internal.options.maxLogins = 10;

Server.local.options.memSize = 65536*4; // increase block size (default is 64)
Server.internal.options.blockSize = 65536*4;

// Server.local.options.sampleRate = 48000; // increase sampling rate (if your hardware supports it)
// Server.internal.options.sampleRate = 48000;
Server.internal.options.sampleRate = nil;    // use the currently selected samplerate of the soundcard

// change the standard archive path to a custom one:
Archive.archiveDir = "/sketchBook/scwork".standardizePath;

// hook up jack ports to audio channels
// "SC_JACK_DEFAULT_INPUTS".setenv("PulseAudio JACK Sink");
// "SC_JACK_DEFAULT_OUTPUTS".setenv("system");

// MIDIIn.connect;
// MIDIIn.noteOn = { |port, chan, note, vel| [port, chan, note, vel].postln };

// "Starting MIDI".postln;
// m = CCIn.new;