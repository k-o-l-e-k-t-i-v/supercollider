// CONNECT TO CARLA IF IT IS RUNNING ///////////////////////////////////////////////////////////////////
// ELSE CONNECT TO DEFAULT SYSTEM OUT DIRECTLY /////////////////////////////////////////////////////////

(
    if("ps -aux | grep carla".unixCmdGetStdOutLines.size>2){
        "Connecting to carla system".warn;
        "SC_JACK_DEFAULT_INPUTS".setenv("system");
        "SC_JACK_DEFAULT_OUTPUTS".setenv("Carla");

    }{
        "Connecting to a system directly".warn;
        "SC_JACK_DEFAULT_INPUTS".setenv("system");
        "SC_JACK_DEFAULT_OUTPUTS".setenv("system");
    }
);

// SERVER DEFAULTS /////////////////////////////////////////////////////////////////////////////////////

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
/////// ROJ SETUP STARTS HERE /////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

(
    SystemClock.sched(0.0,{|t| ("TIME NOW:"+t).postln;});
    " RUNNING ROJ STARTUP SEQUENCE ".padLeft(72,"-").postln;


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
/*
    // 3 /////////////////////////////////////////////////
    {
        5.wait;
        " 3) define resender".padLeft(72,"-").postf;
        o = OSCFunc({ arg ...args;
            var deviation = (p.clock.beats.round(1) - p.clock.beats.round(0.01));
            var beatNo =  p.clock.beats.round(1);

            beatNo.postln;

            if(beatNo%16==0){
                "echo \"\\033[1m % beat \\033[0m\"".format(beatNo).unixCmd;
                "CPU: %\\% NUMS: % BPM: %".format(Server.local.peakCPU.round(0.01),  p.arProxyNames.size, (p.clock.tempo*60) ).postln;

            }{
                "CPU: %\\% NUMS: % BPM: %".format(Server.local.peakCPU.round(0.01),  p.arProxyNames.size, (p.clock.tempo*60) ).postln;
            };
        },'/tr',s.addr);
        " OK".postln;
    }.fork;
*/

);





/*

(
    3.wait;
    " 3) define resender".padLeft(72,"-").postf;
    SystemClock.sched(0.0,{|t| ("TIME NOW:"+t).postln;});

    o = OSCFunc({ arg ...args;
        var deviation = (p.clock.beats.round(1) - p.clock.beats.round(0.01));
        var beatNo =  p.clock.beats.round(1);

        // beatNo.postln;

        if(beatNo%16==0){
            "echo \"\\033[1m % beat \\033[0m\"".format(beatNo).unixCmd;
            "CPU: %\\% NUMS: % BPM: %".format(Server.local.peakCPU.round(0.01),  p.arProxyNames.size, (p.clock.tempo*60) ).postln;

        }{
            "CPU: %\\% NUMS: % BPM: %".format(Server.local.peakCPU.round(0.01),  p.arProxyNames.size, (p.clock.tempo*60) ).postln;
        };
    },'/tr',s.addr);
    " OK".postln;
);


SystemClock.schedAbs(16,{|t|
    ("ok TIME NOW:"+t).postln;
    ~tick.kr(1);
    ~counter.kr(1);

    // ~tick.clock = p.clock;
    // ~counter.clock = p.clock;

    ~tick.quant=0;
    ~counter.quant=0;

    ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};

});

// 3 /////////////////////////////////////////////////

});
);
Server.default.waitForBoot({
    " ROJ boot sequence initiated".padLeft(72,"-").postln;


    // 0 //////////////////////////////////////////////////////
    (

        " 0) startin NetProxy".padLeft(72,"-").postf;
        //p = NetProxy.push();
        p = ProxySpace.push(s);
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





    // 2 /////////////////////////////////////////////////
    (
        " 2) add custom restart function".padLeft(72,"-").postf;
        p.restartClock();
        ~tick.kr(1);
        ~counter.kr(1);

        ~tick.clock = p.clock;
        ~counter.clock = p.clock;

        ~tick.quant = 16;
        ~counter.quant = 16;

        ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
        ~counter = {PulseCount.kr(~tick.kr);};
        //p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
        " OK".postln;


    );



    // 3 /////////////////////////////////////////////////
    (
        5.wait;
        " 3) define resender".padLeft(72,"-").postf;
        o = OSCFunc({ arg ...args;
            var deviation = (p.clock.beats.round(1) - p.clock.beats.round(0.01));
            var beatNo =  p.clock.beats.round(1);

            beatNo.postln;

            if(beatNo%16==0){
                "echo \"\\033[1m % beat \\033[0m\"".format(beatNo).unixCmd;
                "CPU: %\\% NUMS: % BPM: %".format(Server.local.peakCPU.round(0.01),  p.arProxyNames.size, (p.clock.tempo*60) ).postln;

            }{
                "CPU: %\\% NUMS: % BPM: %".format(Server.local.peakCPU.round(0.01),  p.arProxyNames.size, (p.clock.tempo*60) ).postln;
            };
        },'/tr',s.addr);
        " OK".postln;
    );
};
);//end after server boots

*/





///////////////////////////////////////////////////////////////////////////////////////////////////////
/////// ROJ SETUP ENDS HERE ///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

