






p.push();

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
    p.moveNodeToTail(\master);
);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var sig = Impulse.ar(4/(1..16));
        var mod = Duty.kr(1/4*[1,4,64,1024],0,Dseq([1,1/2,1.5,1.33333],inf)).lag(LFNoise2.kr(1/16!8).range(0.001,0.05));
        var freqs = 22000/([24,36,60]).midicps /.x [1,1,1,2,1.5,1.3333333] *.x [1,1/2] * mod;
        var t = SinOsc.ar([freqs/4,1/16,freqs/10000]) + SinOsc.ar([1/4,1/4/(1..16),1/160],mul:1/40);
        sig = Ringz.ar(sig,freqs,1/8/(1..16) * LFNoise2.kr(1/16).range(1,4)) * SinOsc.ar(freqs/2, Perlin3.ar(t[0],t[1],t[2])*8pi);
        sig = CompanderD.ar(sig,3/4,1/3,1);
        Splay.ar(sig,0.25,0.15);
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
    ~two.fadeTime=4;
    ~two={
        var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
        var f = TWChoose.kr(Impulse.kr(1/16/[1,2,3]),[60,72,64,67,69].midicps,[1,1,1,0.1,0.2],1) /.x [1,2,1/2] * 2 / mod;
        // var noise = RLPF.ar(WhiteNoise.ar(0.35!3),f) * (LFSaw.ar(1/16/[1,2,3])**4) 
        var noise =  Impulse.ar(4/[1,2,3]);
        var sig = Formlet.ar(noise,f,20/f*[3,2,1],80/f*[1,2,3]).softclip;// + SinOsc.ar(f,SinOsc.ar(1/4/[1,2,3]),mul:LFSaw.kr(1/4/[1,2,3])/4);
        var env2 = Decay2.ar(noise,0.25,1.5);
        sig = sig + (VarSaw.ar(f/4,0,env2,mul:0.1) * env2);
        Splay.ar(sig,0.25,0.5);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75],[3,-3]),imp * hit);
        var sig = SinOsc.ar(32.midicps!2,env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
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
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.1!2);
        sig = sig * env;
        Splay.ar(sig,0.15,0.5);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;
