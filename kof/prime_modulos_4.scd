p.push();
97.33/90
~tempo.quant=4;
~tempo={LFNoise2.kr(1/30).range(115,125)/120};
121.9/(1..7)
// once synth ///////////////////////////////////////

(
    ~once2.ar(2);
    ~once2.quant=0;
    ~once2.fadeTime=0.2;
    ~once2={
        var speed = 1/8/[1,2,4] * ~tempo;
        var oct = TWChoose.kr(Impulse.kr(speed/2),[0,1,2,3] *.x [0,12],(8..1),1);
        var f = TWChoose.kr(Impulse.kr(speed/4),[60,64,67,65,71,61]-12+oct,[1,1,1,0.2,0.1,0.1],1).midicps/4;
        var env = (Decay.ar(Impulse.ar(2/(1..16).nthPrime*~tempo),0.12*((1..16).nthPrime**0.25)) );
        var sig = SinOsc.ar(f/[1,2,4],SinOsc.ar(f/2.01)*((1/4/[1,2,4,8])*pi)*(env**LFTri.ar(~tempo/64/(1..16).nthPrime).exprange(0.0001,400)),mul:1/((1..16).nthPrime**0.5)); 
        sig = sig * env;
        sig = sig + BPF.ar(Dust.ar(f/10,mul:env*10),f,0.002);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        Splay.ar(sig,0.75,0.75);
    };
    ~once2.play;
);
~once2.stop(1);
~once2.clear;
~once.pause;
~once.resume;


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
