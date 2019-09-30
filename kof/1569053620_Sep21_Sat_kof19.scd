
p.push;

~tempo={LFNoise1.kr(~tempo/4).range(0.99,1.01)*87.5/120};

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var f = [40,30,22]+SinOsc.kr([4,5,6]);
        var ll = LFSaw.ar(~tempo*4/[1,2,3]).range(0.001,4/f);
        var sig = Dust.ar(LFSaw.ar(~tempo*4/16/[1,2,3])*160);
        sig = LPF.ar(sig*4,f*40);
        sig = CombC.ar(sig,ll,ll);
        sig = SinOsc.ar(f,sig*2pi);
        sig = DelayL.ar(sig,[0,SinOsc.kr(f+0.01).range(0,1/f)],[0,SinOsc.kr(f).range(0,1/f)]);
        sig = MoogFF.ar(sig,f*80,LFSaw.ar(~tempo/4).range(0.1,3.4));
        sig = CombN.ar(sig,1/2,1/2,1);
        Splay.ar(sig,0.95,0.5);
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
    ~two.quant=[16,1];
    ~two.fadeTime=1;
    ~two={
        var f = [40*40,40*42,40*38];
        var sig = Dust.ar(~tempo*8/[1,2,3]*40)*8;
        sig = BPF.ar(sig,f,0.2)*Pulse.ar(~tempo*8/[1,2,3]);
        sig = DelayL.ar(sig,[0,SinOsc.kr(f+0.01).range(0,1/f)],[0,SinOsc.kr(f).range(0,1/f)]);
        Splay.ar(sig,0.65,0.25,SinOsc.kr([4,5,6])/4);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.55,lp=13500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[2500,2513]+SinOsc.kr(~tempo/4/[1,1.101],mul:500),1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
