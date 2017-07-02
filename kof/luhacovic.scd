p.push();
p.bpm(90);



(
    ~master.quant=4;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannelsC1C3.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);



(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={

        var sig = LFNoise0.ar(18000/[1,2,3,4]) ++ LFNoise1.ar(1) * Pulse.ar(~tempo*2/[1,2,3,4]);
        sig = CombN.ar(sig,1/8,1/8,1);
        RandSeed.ar(Impulse.ar([40,16,50,100]),LFNoise1.ar(~tempo/16).exprange(1/16,4));
        sig = Compander.ar(sig,Pulse.ar(4/[1,2,3,4]) + ~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.5,0.15,SinOsc.ar(8.01));
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.clock = p.clock;
    ~two.quant=16;
    ~two.fadeTime=32;
    ~two={
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf))  ;
        var sig = [
            SinOsc.ar(1500/mod),
            WhiteNoise.ar(0.1),
            VarSaw.ar(10/mod),
            BrownNoise.ar(0.5),
        ];
        sig = Select.ar(LFNoise1.ar(~tempo*2/[1,2,3,4]).range(0,0+sig.size()),sig);
        sig = sig * Pulse.ar(8/(1..12));
        Splay.ar(sig,0.5,0.25);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(1.15);
        sig = HPF.ar(sig,5000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,

        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2+(env**40*350),0,env**LFNoise2.kr(1/4!4).exprange(0.2,100)*8pi) * LFTri.ar(4/[1,2,3,4]);
        sig = sig * env;
        Splay.ar(sig,0.05,0.25);
    };
    ~kick.play;
);
~kick.stop(8);
~kick.clear;
~kick.pause;
~kick.resume;




// formant synth ///////////////////////////////////////

(
    ~formant.ar(2);
    ~formant.clock = p.clock;
    ~formant.quant=16;
    ~formant.fadeTime=4;
    ~formant={
        var sig = Formant.ar(50,LFNoise2.kr(~tempo/4).range(5,10),LFNoise1.ar(~tempo/16).range(8,8000));
        sig = sig * Pulse.ar(~tempo*2/[1,2,3,4]);
        Splay.ar(sig,0.5,0.25);
    };
    ~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;


