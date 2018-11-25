
p.push();
p.bpm(126.965)

(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var sig = Formant.ar(50,50+LFSaw.kr(~tempo/320/[1,2,3,4]).exprange(0.01,5000),5+LFSaw.kr(1/160*~tempo/[1,2,3,4]).exprange(0.01,500));
        sig = sig + Perlin3.ar(sig[0]+1,sig[1]+1,sig[2]+LFSaw.kr(1/600));
        sig = CombN.ar(sig * Pulse.ar(~tempo*2/[1,2,3,4]),~tempo/4,1/50,4);
        sig = LeakDC.ar(sig);
        sig = MoogVCF.ar(sig,150*[1,12,4,8],LFNoise2.kr(1/16!4).range(0.01,0.95)) + Normalizer.ar(LPF.ar(sig,500));
        sig = Normalizer.ar(sig);

        sig = sig * LFTri.ar(~tempo/2/[1,2,3,4]);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50+((1..10)*10*(env**40/(1..10))),env**80*2pi) + WhiteNoise.ar(env**20);
        sig = sig.softclip;
        sig = Normalizer.ar(sig);
        sig = sig * env;
        sig = LPF.ar(sig,500);
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// snth synth ///////////////////////////////////////

(
    ~snth.ar(2);
    ~snth.clock = p.clock;
    ~snth.quant=4;
    ~snth.fadeTime=4;
    ~snth={
        var sig = ClipNoise.ar(Pulse.ar(~tempo*4));
        sig = Resonz.ar(sig,1500,LFSaw.ar(~tempo/4)**4+0.01);
        sig = Normalizer.ar(sig) * LFPulse.ar(~tempo*4);
        Splay.ar(sig,0.5,0.25);
    };
    ~snth.play;
);
~snth.stop(4);
~snth.clear;
~snth.pause;
~snth.resume;

// raw synth ///////////////////////////////////////

(
    ~raw.ar(2);
    ~raw.quant=2;
    ~raw.fadeTime=0.2;
    ~raw={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            PinkNoise.ar(0.64) * Pulse.ar(~tempo*8),
            BrownNoise.ar(0.65) * Pulse.ar(~tempo*4),
            LFPulse.ar(500+SinOsc.ar(~tempo*16,mul:500),env**20) * Pulse.ar(~tempo*2),
            WhiteNoise.ar(0.62) * Pulse.ar(~tempo*2),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        //sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~raw.play;
);
~raw.stop(4);
~raw.clear;
~raw.pause;
~raw.resume;

// hisses synth ///////////////////////////////////////

(
    ~hisses.ar(2);
    ~hisses.clock = p.clock;
    ~hisses.quant=[16,0];
    ~hisses.fadeTime=0.02;
    ~hisses={
        //  |       |       |       |       |  
        var pat = [
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
        var sig = HPF.ar(ClipNoise.ar(1!4),1500*[1,2,3,4]);
        sig = sig * env;
        sig = CombN.ar(sig,1/8/~tempo,1/8/~tempo,1/~tempo);
        Splay.ar(sig,0.75,0.25);
    };
    ~hisses.play;
);
~hisses.stop(4);
~hisses.clear;
~hisses.pause;
~hisses.resume;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = LPF.ar(CompanderD.ar(sig,3/4,1/2,1/3),500)+HPF.ar(CompanderD.ar(sig,3/4,1/1.1,1/3),500);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;

        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
