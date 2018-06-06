

p.push();

// sw synth ///////////////////////////////////////

(
    ~sw.ar(2);
    ~sw.quant=2;
    ~sw.fadeTime=0.2;
    ~sw={
        //         |       |       |       |       |  
        var pat = [1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5]*LFDNoise1.kr(~tempo/16).range(0.1,4),[3,-3],curve:'exp'),imp * hit)};
        var mod = Duty.kr(1*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var sig = [
            SinOsc.ar(50!2,env**20*2pi),
            WhiteNoise.ar(0.5*env),
            SinOsc.ar(50!2,env**20*4pi),
            PinkNoise.ar(0.5*env),
            Pulse.ar(4),
            VarSaw.ar(220/mod*(2**([0,5,7,12]/12)),mul:0.8).distort,
            GrayNoise.ar(0.5*env),
            SinOsc.ar(50,env**40*8pi)
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.25,0.5);
    };
    ~sw.play;
);
~sw.stop(4);
~sw.clear(12);
~sw.pause;
~sw.resume;


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var fra = SinOsc.kr(~tempo/16/(1..8).reciprocal)*2pi;
        var f = [220,440]/.x[1,1.5,1.333334,];
        var sig = LFSaw.ar([f,~tempo/512,~tempo/256]);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        sig = SinOsc.ar(f,sig*2pi) * LFTri.ar(~tempo/4/(1..8));
        Splay.ar(sig,0.15,0.15);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
    ~master.quant=2;
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
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
