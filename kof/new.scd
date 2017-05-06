(
    p.push();
    p.bpm(90);
    s.latency = 0.2;
)



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=8;
    ~one.fadeTime=5;
    ~one={
        var mel = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333,2,4,8],inf));
        var env = Decay.ar(Impulse.ar(~tempo/[1,2,3,4]/4),~tempo/4*(1..4)*8);
        var base = [90,180,270,360] / ([1,1.5,1.33333,0.5]) / mel;
        var t = SinOsc.ar([~tempo/4,~tempo/16,base])/4 + LFSaw.ar(1/900/[1,2,3,4],mul:4);
        var prln = Perlin3.ar(t[0],t[1],t[2]);
        var sig = Formant.ar(base,LFSaw.ar(~tempo/[1,2,3,4]/128).exprange(base/100,base*100),LFSaw.ar(~tempo/32/[1,2,3,4]).exprange(base/2,base*100));
        sig = Resonz.ar(sig,base*4/[1,2,1.5,1.3333],0.1/(env*100+1));
        sig = Normalizer.ar(sig);
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

Pulse.help
270/4
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


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
    }.fork;  
)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=8;
    ~one.fadeTime=4;
    ~one={
        //var sig = LFSaw.ar(1250/[1,10] /.x [1,1.5,2,4]) * LFPulse.ar(16*[1,1.5,2,4]);
        var sig = WhiteNoise.ar(0.65!2);
        sig = RLPF.ar(sig,LFNoise2.kr(4!2).range(50,15000)) * Pulse.ar(4/(1..8));
        Splay.ar(sig,0.5,0.15);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// perlin synth ///////////////////////////////////////

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb3Band.ar(NumChannels.ar(fx,2),[5000,5010])/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

(
    ~perlin.ar(2);
    ~perlin.clock = p.clock;
    ~perlin.quant=8;
    ~perlin.fadeTime=4;
    ~perlin={
        var mod = Duty.kr([4,8,16,64],0,Dseq([1,2,1.5,1.33333],inf));
        var t = LFSaw.ar([1/4,1/16,500 / [1,1.5,2,4,8] / mod]) + LFSaw.ar(1/500/[1,2,3]);
        var sig = Perlin3.ar(t[0],t[1],t[2]) * (LFTri.ar(1/16/[1,2,3,4])**4);
        sig = sig * LFPulse.ar(1/4/(1..8));
        sig = CombN.ar(sig,1/500*mod.lag(0.01),1/500*mod.lag(0.01),4) * Pulse.ar(16/[1,2,3,4]);
        //sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.15,0.75);
    };
    ~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=8;
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0,
        ].rotate(1);
        var mod = Duty.kr(32/~tempo*[1,2,3,4],0,Dseq([1,2,3,4],inf))  ;
        var imp = PulseDivider.kr(~tick.kr,mod);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.0,1,0.0001],[0.002,[1.5,0.75,1,3]],[3,-6]),imp * hit);
        var sig = SinOsc.ar(45+(env**(180*mod)*45),env**(40*mod)*8pi);
        sig = sig + LPF.ar(BrownNoise.ar(env**((1..4)*20)),500*(1..8));
        
        //sig = FreqShift.ar(sig,LFNoise2.kr(0.2).range(0,2)*(env**30),SinOsc.kr(20));
        sig = sig * env;
        sig = HPF.ar(sig,40);
        Splay.ar(sig,0.005,1);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
            1,0,0,0, 0,0,1,0, 1,0,1,0, 1,1,1,0,
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,1,0,
        ].rotate(3);
        var mod = Duty.kr(32/~tempo*[1,2,3,4],0,Dseq([1,2,3,4],inf))  ;
        var imp = PulseDivider.kr(~tick.kr,mod);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.75!3);
        sig = HPF.ar(sig,18000/[1,2,3,4]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


simple


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.clock = p.clock;
    ~two.quant=[16,0];
    ~two.fadeTime=0.02;
    ~two={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(1);
        var mod = Duty.kr([4,8,16,64],0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,7.5],[3,-3]),imp * hit);
        var sig = Formant.ar(1000!2/mod/1.5,50+(env**0.2*50)/mod,150+(env**20*50));
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.clock = p.clock;
    ~two.quant=16;
    ~two.fadeTime=4;
    ~two={
        var sig = Formant.ar(500 + SinOsc.ar(4).range(-5,5),50,500*(1+(1..8).reciprocal)) * LFTri.ar(1/(1..8));
        Splay.ar(sig,0.5,0.25);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

