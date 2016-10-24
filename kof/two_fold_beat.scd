
(
    ~o = {16};
    ~l = {16};
    //  ~z.quant=8;
    ~z = {[
        1,0,0,0, 0,0,0,0, 0,0,1,0, 1,0,0,0,
        1,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,0,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        0,0,0,0, 0,1,0,0, 0,0,0,0, 0,1,0,0,
    ]};

    //    p.arProxyNames.do(p[_.asSymbol].rebuild);
)



(
    {
        p.stop(20);
        ~master.play;
        20.wait;
        p.clean;
    }.fork;  
)
(
    ~master.quant=8;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=7500,hp=70,len=3,rev = 1|
        var sig = In.ar([0,1]);
        var orig = PitchShift.ar(sig,0.01,SinOsc.ar(1/[5,6],mul:0.05)+1);
        var fx;
        //fx = Limiter.ar(sig,0.95);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = Compander.ar(fx,3/4,1/2,1/2);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);




p.makeTempoClock;  
(
    ~offset = {(0..7)/8};

    ~tick.quant = 8;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
    p.clock.tempo_(127/60);
);


p.arProxyNames.do(p[_.asSymbol].rebuild);




// ok synth ///////////////////////////////////////

(
    ~first.ar(2);
    ~first.quant=8;
    ~first.fadeTime=0.2;
    ~first={
        //         |       |       |       |       |  
        var pat = ~z.kr;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50!2,env**70*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~first.play;
);
~first.stop(4);
~first.clear;
~first.pause;
~first.resume;


// second synth ///////////////////////////////////////

(
    ~second.ar(2);
    ~second.quant=8;
    ~second.fadeTime=0.2;
    ~second={
        //         |       |       |       |       |  
        var pat = ~z.kr;
        var mod = Duty.kr(2*~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr+~o.kr,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = VarSaw.ar(50!2*mod,env**80*2pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~second.play;
);
~second.stop(4);
~second.clear;
~second.pause;
~second.resume;

// third synth ///////////////////////////////////////

(
    ~third.ar(2);
    ~third.quant=8;
    ~third.fadeTime=0.2;
    ~third={
        var pat = ~z.kr;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr+(~o.kr*2),pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = HPF.ar(WhiteNoise.ar(0.9!2),LFNoise1.kr(1/16!2).range(500,15000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.85);
    };
    ~third.play;
);
~third.stop(4);
~third.clear;
~third.pause;
~third.resume;


// fourth synth ///////////////////////////////////////

(
    ~fourth.ar(2);
    ~fourth.quant=2;
    ~fourth.fadeTime=0.2;
    ~fourth={
        //         |       |       |       |       |  
        var pat = ~z.kr;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr+(~o.kr*3),pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.702,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PinkNoise.ar(0.75!2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.85);
    };
    ~fourth.play;
);
~fourth.stop(4);
~fourth.clear;
~fourth.pause;
~fourth.resume;

