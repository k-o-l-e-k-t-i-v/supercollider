



p.push();
s.latency = 0.2;



// noisy synth ///////////////////////////////////////

(
    ~noisy.ar(2);
    ~noisy.clock = p.clock;
    ~noisy.quant=4;
    ~noisy.fadeTime=1;
    ~noisy={
        var base = [48,52,56].midicps;//Select.kr(TRand.kr(0,5,Impulse.kr(~tempo!3)),[60,48,72,84].midicps)/4;
        var set = [1,2,1.5,1.333334,1/2,15/8];
        var a = Select.kr(TRand.kr(0,set.size,Impulse.kr(~tempo/64!3)),set);
        var b = Select.kr(TRand.kr(0,set.size,Impulse.kr(~tempo/64!3)),set);
        var c = Select.kr(TRand.kr(0,set.size,Impulse.kr(~tempo/64!3)),set);
        var env =  (LFTri.kr(~tempo/64));
        var f = base/[1,1/2]*a*[1,2,1.5]/b/[1,2,1.5]*c + SinOsc.kr(~tempo/16+((1..6)/1000),mul:5*((env**2)));
        var sig = LFSaw.ar([f/100,f/7000.01,f]) * (env**[1.5,2,8]) * 2pi;
        sig = Perlin3.ar(sig[0].cos+1,sig[1].sin+1,sig[2]) + SinOsc.ar(f,mul:0.2);
        sig = MoogVCF.ar(sig,f*.x(2**([0,5,7,9]/12))*2,LFNoise1.kr(~tempo/64!sig.size).range(0.1,0.9),mul:LFNoise2.kr(~tempo/64!sig.size));
        sig = sig * env;
        sig = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(~tempo/64!3).range(100,7500)),1/4,1/2,1)+(sig/2);
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,1/2,1/3,1);
        Splay.ar(sig,0.25,0.5);
    };
    ~noisy.play;
);
~noisy.stop(4);
~noisy.clear;
~noisy.pause;
~noisy.resume;

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
