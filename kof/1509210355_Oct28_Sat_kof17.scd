



p.push();
// raw_saw synth ///////////////////////////////////////

(
    ~raw_saw.ar(2);
    ~raw_saw.clock = p.clock;
    ~raw_saw.quant=2;
    ~raw_saw.fadeTime=4;
    ~raw_saw={
        var t = SinOsc.ar([4,10,1/16/[1,2,3,4]]);
        var base = Duty.kr(16/[1,2,3,4],0,Dseq((([12,36,24,7,11]/12)**2),inf)) *  100;
        var mod = Duty.kr(8*[1,2,3,4],0,Dseq(1/[1,2,1.5,1.33333],inf));
        var perl = Perlin3.ar(t[0],t[1]*base,t[2])/10000.0;
        var sig = SinOsc.ar(base,Pulse.ar(4/[1,2,3,4])*LFNoise2.kr(1/16/[1,2,3,4]).range(0,8pi));
        sig = LPF.ar(sig,LFNoise1.kr(1/4).range(50,15000)) * Pulse.ar(8/[1,2,3,4])/2;
        sig = CombN.ar(sig,1/base,(mod/(base*2))+perl,LFNoise0.kr(1/4).exprange(1/1000,4));
        sig = LeakDC.ar(sig) * (LFTri.ar(1,0,Pulse.ar(4/[4,3,2,1])));
        sig = AllpassN.ar(sig,1,1/(base*mod),4);
        sig = CombL.ar(sig,3/base,(mod*16/(base))+LFNoise2.kr(1/4).range(-0.0001,0.0001)+perl,LFNoise0.kr(4).exprange(1/1000,2))/8;
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = AllpassN.ar(sig,1/4,2.001/(base*mod),1/2);
        sig = LPF.ar(sig,500) + CombN.ar(HPF.ar(sig,1000),1/4,1/8,1/4);
        Splay.ar(sig,0.5,0.5);
    };
    ~raw_saw.play;
);
~raw_saw.stop(4);
~raw_saw.clear;
~raw_saw.pause;
~raw_saw.resume;

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
