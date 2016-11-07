


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.45,lp=3500,hp=250,len=10,rev = 1|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = Compander.ar(sig,3/4,1/2,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);


(
    s.latency=0;
    p.clock.tempo_(60/60);
    p.arProxyNames.do(p[_.asSymbol].rebuild);
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~counter.clock = p.clock;
    ~counter.quant = 4;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr(~tempo*4); };
);

// lame synth ///////////////////////////////////////

(
    ~lame.ar(2);
    ~lame.clock = p.clock;
    ~lame.quant=[2,1/2];
    ~lame.fadeTime=4;
    ~lame={
        var mod = TWChoose.kr(Impulse.kr(2/[16,32]*~tempo),[1,1.5,1.33333,2,4,8,16],[5,4,3,2,1,1,1],1);
        var sig = [
            LFSaw.ar(50*mod)*LFNoise2.kr(1/4!4),
            SinOsc.ar(150/[1,2,4]*mod,Pulse.ar(2/[1,2,3,4]*~tempo))*LFNoise2.kr(1/4),
            Pulse.ar(50*mod)*LFNoise2.kr(1/4!4),
            LFPulse.ar(300/[1,2,1.5,1.3333]*mod)*LFNoise2.kr(1/4!4),
            LFCub.ar(150/[1,2,4]*mod)*LFNoise2.kr(1/4!4),
            WhiteNoise.ar(0.8) * LFNoise2.kr(1/4!4)
        ];
        sig = sig / 8 * Pulse.ar(8/[[1,2,3,4],[3,2],[3,4],[1,4],[8,2,3,4],[1,4]]*~tempo/2);
        sig = RLPF.ar(sig,LFNoise2.kr(1/8!8*~tempo).range(250,6800),0.2) * LFNoise2.kr(1/8!4 * ~tempo);
        //sig = CombN.ar(sig,1/50/mod,1/5/mod,4);
        sig = CompanderD.ar(sig,1/3,1/LFNoise2.kr(1/4!8*~tempo).range(1,3),1/2);
        //sig = CombN.ar(sig,2/~tempo,2/~tempo,8);
        Splay.ar(sig,0.05,0.25);
    };
    ~lame.play;
);
~lame.stop(4);
~lame.clear;
~lame.pause;
~lame.resume;


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=1;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);    




// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[2,0];
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1];
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[40,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



// his synth ///////////////////////////////////////

(
    ~his.ar(2);
    ~his.quant=[4,1/4];
    ~his.fadeTime=0.2;
    ~his={
        //         |       |       |       |       |  
        var pat = [
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,
        ];
        var mod = LFNoise2.kr(4*~tempo).range(1,80);
        var imp = PulseDivider.kr(~tick.kr,1);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[20,-4]),imp * hit);
        var sig;
        var hum = LFNoise2.kr(~tempo).range(0.0,0.015);
        //env = DelayN.ar(env,hum,hum);
        sig = Crackle.ar(0.4+(env**mod)); 
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~his.play;
);
~his.stop(4);
~his.clear;
~his.pause;
~his.resume;


