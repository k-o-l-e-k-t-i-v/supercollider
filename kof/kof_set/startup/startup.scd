// CONNECT TO CARLA IF RUNNING, OTHERWISE FALLBACK TO SYSTEM //////////////////////////////////////////////////////////////

(
    // Check if carla is running (using pgrep for a cleaner process check)
    if("pgrep carla".unixCmdGetStdOutLines.size > 0){
        "Connecting to Carla via PipeWire-JACK".warn;
        "SC_JACK_DEFAULT_INPUTS".setenv("system");
        "SC_JACK_DEFAULT_OUTPUTS".setenv("Carla");
    }{
        "Connecting directly to system via PipeWire-JACK".warn;
        "SC_JACK_DEFAULT_INPUTS".setenv("system");
        "SC_JACK_DEFAULT_OUTPUTS".setenv("system");
    }
);


// SERVER DEFAULTS //////////////////////////////////////////////////////////////////////////////////

Server.local.options.numOutputBusChannels = 2;    // change number of input and output channels
Server.local.options.numInputBusChannels = 2;

Server.internal.options.numOutputBusChannels = 2;
Server.internal.options.numInputBusChannels = 2;

Server.local.options.device = nil;                // use the system default soundcard

Server.local.options.blockSize = 128; // increase block size (default is 64)
Server.internal.options.blockSize = 128;

Server.local.options.hardwareBufferSize = 512*4;
Server.internal.options.hardwareBufferSize = 512*4;

Server.local.options.memSize = 65536*4; // increase block size (default is 64)
Server.internal.options.blockSize = 65536*4;

Server.local.options.threads = 4;
Server.internal.options.threads = 4;

Server.internal.options.sampleRate = nil;    // use the currently selected samplerate of the soundcard

// change the standard archive path to a custom one:
Archive.archiveDir = "/home/kof/src/sc/kof/scwork".standardizePath;
thisProcess.platform.recordingsDir = "/home/kof/recordings".standardizePath;

s.options.protocol = \udp;
s.options.initialNodeID = 1000;
s.options.numWireBufs = 256;

/// SUPERNOVA ///////////////////////////////////////
// Server.program = "/usr/local/bin/supernova";
// Server.supernova;
// s = Server.local = Server.default;

/// MIDI ////////////////////////////////////////////
// k = CCIn.new;
// MIDIIn.connectAll;


///////////////////////////////////////////////////////////////////////////////////////////////////////
/////// KOLEKTIV SETUP STARTS HERE /////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

(
    SystemClock.sched(0.0,{|t| ("TIME NOW:"+t).postln;});
    " RUNNING KOLEKTIV STARTUP SEQUENCE ".padLeft(72,"-").postln;


    s = Server.default;

    {
      p = ProxySpace.push(s.boot);
      3.wait;
      p = NetProxy.push();
      3.wait;


        p.clock.tempo = (120/60.0);
        //TempoClock.default = p.clock;
        ~tick.kr(1);
        ~counter.kr(1);

        // ~tick.clock = p.clock;
        // ~counter.clock = p.clock;

        ~tick.quant=16;
        ~counter.quant=16;

        ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
        ~counter = {PulseCount.kr(~tick.kr);};
    }.fork;


Server.default.waitForBoot({
    " KOLEKTIV boot sequence initiated".padLeft(72,"-").postln;


    // 0 //////////////////////////////////////////////////////
    (

        " 0) startin NetProxy".padLeft(72,"-").postf;
        p = NetProxy.push();
        //p = ProxySpace.push(s);
        s.latency = 0.5;

        2.wait;
        TempoClock.default = p.clock;
        p.bpm(120);

        " OK".postln;
    );

    // 1 /////////////////////////////////////////////////
    (

        " 1) move master synth to the end".padLeft(72,"-").postf;
        p.moveNodeToTail(\master);
        " OK".postln;
    );


});
)










///////////////////////////////////////////////////////////////////////////////////////////////////////
/////// ROJ SETUP ENDS HERE ///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

