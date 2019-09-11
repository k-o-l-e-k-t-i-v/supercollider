p.push()


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        var fx2;
        //fx = Limiter.ar(sig,0.95);
        fx2 = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DelayN.ar(sig,1/50,1/50);
        fx = DWGReverb3Band.ar(NumChannels.ar(fx,2),[5000,5010]/[4,3,2,1],200,3,2)/rev;
        sig = SelectX.ar(wet,[orig,fx]) + (fx2*wet);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);


p.bpm(90)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=0.4;
    ~one={
        var slide = 16;
        var mel = Duty.kr([4,8,16,32]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) ;
        var f = [60,36,48,72].midicps*mel;
        var hits = LFTri.kr(1/60/[1,2,3,4]).range(~tempo-(~tempo/slide),~tempo+(~tempo/slide));
        var mod = SinOsc.kr(~tempo/16).range( 0.1 , 1.0001 );
        var sig = SinOsc.ar(f+Pulse.ar(hits).range(0,f/4),Pulse.ar(hits)) * Pulse.ar(hits);
        var env = {EnvGen.ar(Env([0.001,1,0.001],[0.002,mod],[3,-3]),Impulse.ar(hits))};
        sig = Perlin3.ar(sig,sig**mod,sig*mod) * Perlin3.ar(env**20,LFSaw.ar(env*f),env*mod) * env;
        Splay.ar(sig,0.95,0.15);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
