p.push()
p.bpm(110);

(
    s.latency=0.4;
    p.restartClock;
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){ p[synth.asSymbol].quant = [16,0]; p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};
    /*
    (
        SystemClock.sched( p.clock.timeToNextBeat(1 * 16) ,{ 
            p.restartClock;

        });
    );
    */
);

(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.35,lp=4500,hp=250,len=4,rev = 2,duckLo = 150|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,low,high,mid;
        var duck;

        duck = LPF.ar(LPF.ar(sig,duckLo),duckLo);
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2*~tempo).range(100,800)),9/10,1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!2*~tempo).range(500,4500),1/2),9/10,1,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/16!2*~tempo).range(3000,10000)),9/10,1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,9/10,1,1/1.2);
        orig = sig;
        fx = LPF.ar(sig,lp).distort;
        fx = LPF.ar(fx,lp);
        fx = HPF.ar(fx,hp);
        fx = HPF.ar(fx,hp);
        fx = AllpassN.ar(fx,1/1600*~tempo,1/4*~tempo,len);

        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5100],1/len)/rev + fx;

        sig = SelectX.ar(wet,[orig,fx]);
        //  sig = Compander.ar(sig,~duck.ar,8/10,1/2,1);
        sig = NumChannels.ar(sig,2) ;
        sig = Limiter.ar(sig.softclip);
        ReplaceOut.ar(0,sig);
    };

    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/1600!2).exprange(0.15,0.45);};
    // ~master_wet = {|sig| sig-(1-LFSaw.ar(~tempo*1)).range(0,1)**4};
    ~master.map(\wet,~master_wet);
    p.moveNodeToTail(\master);
);


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.75,lp=3500,hp=250,len=10,rev = 2|
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
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);


// plain synth ///////////////////////////////////////

(
~plain.ar(2);
~plain.clock = p.clock;
~plain.quant=2;
~plain.fadeTime=4;
~plain={
  var sig = AudioIn.ar([0,1]);
  Splay.ar(sig,0.5,0.75);
};
~plain.play;
);
~plain.stop(4);
~plain.clear;
~plain.pause;
~plain.resume;



(
~modulator.quant=1;
    ~modulator.fadeTime = 2;
~modulator = {TChoose.kr(Impulse.kr(1/4*~tempo),[1,2,4,8,16,1/16,1/8,1/4]).lag(1/40)};


// glitch synth ///////////////////////////////////////

    ~glitch2.ar(2);
    ~glitch2.clock = p.clock;
    ~glitch2.quant=1;
    ~glitch2.fadeTime=4;
    ~glitch2={
        var mod = Duty.ar(1/[1,2,3,4]/~tempo,0,Dseq([1,2,1,1.33333,4,0.1,0.8],inf));
        var f = [60,65,67,69].midicps*~modulator.kr/mod;

        var in = Normalizer.ar(HPF.ar(LPF.ar(AudioIn.ar([1,2]),2500),150));
        //var in = CompanderD.ar(AudioIn.ar([1,2]),1/2,1/3,1);
        var t = LFSaw.ar([~tempo/4,~tempo/16,f]) + LFSaw.ar(4410,mul:1);
        var perl = Perlin3.ar(t[0],t[1],t[2]) * LFDNoise1.kr(1/16!4);
        var sig;


        sig = CombN.ar(in+perl,1/f,1/f+0.01,4) + perl + in/4;
        sig = LocalIn.ar(2) + sig;
        sig = DelayN.ar(sig,1/f,1/f);
        sig = GlitchBPF.ar(sig+in,f,0.14);
        sig = CompanderD.ar(sig,3/4,1/1.45,1);
        sig = LPF.ar(sig,f);
        LocalOut.ar(NumChannels.ar(sig,2));

        sig = PitchShift.ar(in+sig/2,0.25,[1,2,pi,1/pi]);
        in = CombN.ar(in,1/f,[2,1,8,4]/f,~tempo*4);
        sig = GlitchBPF.ar(sig+in,f,0.2);
        //sig = LPF.ar(sig,9000);

        sig = Limiter.ar(sig/2,0.85);
        sig = CompanderD.ar(sig,3/4,1/2,1)/4;
        Splay.ar(sig,0.5,0.95);
    };
    ~glitch2.play;
);
~glitch2.stop(4);
~glitch2.clear;
~glitch2.pause;
~glitch2.resume;


GlitchBPF.help
