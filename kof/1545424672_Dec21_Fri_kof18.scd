



p.push();
b.free;

b = Buffer.allocConsecutive(8*8,s,512,1);
(
    ~consec.ar(3);
    ~consec.clock = p.clock;
    ~consec.quant=4;
    ~consec.fadeTime=4;
    ~consec={
        var f = 50;
        var sig = LFNoise2.ar(48000/8!64);
        64.do{|i|
            sig[i] = sig[i] ** (4/(i+2).log2);
            RecordBuf.ar(Mix(sig[i]),b[i],0,0.1,1,loop:1);
        };
        sig;
    };
);



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var mod = Duty.kr([4,16,32]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var base = [65,60,67].midicps/[4,2,1]*mod;
        var f = base/(1.0,1.0001..1.002);
        var sig = [];
        var x = LFTri.ar(f/500.01);
        var y = LFTri.ar(f/1500);
        8.do{|i|
            sig = sig ++ VOsc.ar(x.range(i*8,i*8+7),f);
        };
        sig = SelectX.ar(y.range(0,7),sig);
        sig = Perlin3.ar(sig,LFSaw.ar(1/16),LFSaw.ar(1/1600))/4+sig;
        sig = LeakDC.ar(sig);
        sig = MoogFF.ar(sig,f*((2..64).log2)+SinOsc.kr(LFNoise1.kr(0.1!64),mul:2),LFNoise1.kr(1/4!64).exprange(0.001,0.2));
        sig = Normalizer.ar(sig)*LFSaw.ar(1/(1..64));
        Splay.ar(sig,0.75,0.15);
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
