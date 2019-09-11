


/////////////// CONNECT //////////////////////

p.disconnect;
p = NetProxy.connect(\kof);
TempoClock.default = p.clock;

p.bpm(120);

p.bpm;
p.metro(4,1800);
p.players;


// soft reset
(
//    p.restartClock;
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){ p[synth.asSymbol].quant = [16,0]; p[synth.asSymbol].rebuild;};});
 
)

/////// CLOCK MASHING, gloria heureka
(
    s.latency=0.4;
    p.restartClock;
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){ p[synth.asSymbol].quant = [16,0]; p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};
    /*
    (
        SystemClock.sched( p.clock.timeToNextBeat(1 * 16) ,{ 
            p.restartClock;

        });
    );
    */
);

////////////////////////////////////////////////

p.players;
p.time;

///////////////////////////////////////////////

////// SAFE ///////////////
p = NetProxy.push();
(
    ~tick.rebuild;
    ~counter.rebuild;
)

SystemClock.clear;
(
    "NOW!".postln;
    //        s.latency = 0.2;
    p.makeTempoClock;
    p.clock.tempo_(120/60);
    //TempoClock.default = p.clock;
);

(

    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
    //s.latency=0.2;
    //p.clock.tempo_(120/60);

    (
        z = [];
        p.proxyNames.do(z ++ _.asSymbol);
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].quantize(p[z]); p[synth.asSymbol].rebuild; }{ ~master.quantize(z); }; }; );
    );
)



(
    // test_one synth ///////////////////////////////////////

    (
        ~test_one.ar(2);
        ~test_one.clock = p.clock;
        ~test_one.quantize(p[z]);
        ~test_one.quant=[16,0];
        ~test_one.fadeTime=0.02;
        ~test_one={
            //  |       |       |       |       |
            var pat = [
                1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            ].rotate(1);
            var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
            var sig = SinOsc.ar(50!2,env**20*8pi);
            sig = sig * env;
            Splay.ar(sig,0.75,0.5);
        };
        ~test_one.play;
    );

    // test synth ///////////////////////////////////////

    (
        ~test.ar(2);
        ~test.clock = p.clock;
        ~test.quant=[16,0];
        ~test.fadeTime=0;
        ~test={
            var sig = SinOsc.ar(5000!2,mul:0.1) * Decay.ar(Impulse.ar(~tempo/2),1);
            Splay.ar(sig,0.5,0.25);
        };
        ~test.play;
    );
)

p.moveNodeToTail(\master);
