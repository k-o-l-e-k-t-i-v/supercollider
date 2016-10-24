
(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


p=NetProxy.connect()
p.bpm(180)
p.time;
p.metro(4);
p.restartClock;
p.clock.tempo_(120/60);


(
    s.latency=0.01;
    ~tick.kr;
    ~counter = {PulseCount.kr(~tick.kr)};
    ~tick.clock = p.clock;
    ~tick.fadeTime=0;
    ~tick.quant=0;
    ~tick = { Trig1.kr(1.0,0.05) };
    p.clock.sched(p.clock.timeToNextBeat(1),{~tick.rebuild;});
);  




(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = Compander.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

// synctest synth ///////////////////////////////////////

(
    ~synctest.clock;
    ~synctest.ar(2);
    ~synctest.quant=[4];
    ~synctest.fadeTime=0.2;
    ~synctest={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0];
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise2.kr(1/4).range(0.5,2.5)],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**10*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~synctest.play();
);
~synctest.stop(4);
~synctest.clear;
~synctest.pause;
~synctest.resume;


// test synth ///////////////////////////////////////

(
    ~test.clock = p.clock;
    ~test.ar(2);
    ~test.quant=[2,1/2];
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(500!2,mul:0.2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;
