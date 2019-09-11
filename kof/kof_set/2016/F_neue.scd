


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = Compander.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);

        //sig = sig * TwoPole.ar(sig,TRand.kr(Impulse.kr(1/4*~tempo),500,16000),LFDNoise1.kr(1/4*~tempo).range(0.1,0.99));
        //sig = Normalizer.ar(sig);
        //sig = LeakDC.ar(sig);

        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

// intercorporator synth ///////////////////////////////////////

(
    ~intercorporator.ar(2);
    ~intercorporator.clock = p.clock;
    ~intercorporator.quant=[16,0];
    ~intercorporator.fadeTime=4;
    ~intercorporator={
        var ammount = LFNoise2.kr(1/320*~tempo!4).range(1/8,50);
        var pulse = LFSaw.ar(1/16*[1,2,3,4]*~tempo).softclip ** LFNoise2.kr(1/16*~tempo!4).range(0.5,2);
        var oct = Duty.kr(16/~tempo*[1,2,3,4],0,Dseq([0,0,0,1,-1,0,0,0,2,-2,0,0,0,1,3,-2],inf));
        var freq = Duty.kr(4/~tempo*[1,2,3,4],0,Dseq(([36,24]+oct).midicps,inf));
        var f = VarSaw.ar(freq,0, pulse*pi).exprange(0.1,ammount) + LFSaw.ar(1/16*~tempo).exprange(01.01,3);
        var sig = Perlin3.ar(SinOsc.ar(1/32*~tempo/2),SinOsc.ar(1/320*~tempo/2),f);
        sig = sig * pulse;
        sig = LPF.ar(sig,pulse.range(500,15000));
        Splay.ar(sig,0.5,0.5);
    };
    ~intercorporator.play;
);
~intercorporator.stop(4);
~intercorporator.clear(120);
~intercorporator.pause;
~intercorporator.resume;


Integrator.help
