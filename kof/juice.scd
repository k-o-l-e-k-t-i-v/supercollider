
(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=5500,hp=100,len=5,rev = 4|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = Compander.ar(sig,3/4,1,1/2,0.004,0.3);
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
    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/8) ** 4;};
    ~master.map(\wet,~master_wet);
)


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=1;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);    

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


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant = [4,0];
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ];
        var mod = LFNoise2.ar(1/16*~tempo).range(2,80);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[8,-4.3]), imp * hit);
        var sig;
        var hum = LFDNoise1.kr(~tempo*4).range(0.0,0.019);
        //env = DelayN.ar(env,hum,hum);
        sig = SinOsc.ar(50+(env**mod*250),env**mod*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
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
    ~his.quant=[2,1/2];
    ~his.fadeTime=0.2;
    ~his={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
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



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=[2,1/2];
    ~one.fadeTime=4;
    ~one={
        var base = 55 + LFDNoise1.kr(1/4,mul:1);
        var tmod = 1;//TWChoose.kr(Impulse.kr(~tempo/[1,2,3,4]!4),[1,2,1/4,1/8],[0.6,0.4,0.2,0.1],1);
        var cmod = LFNoise2.kr(1/16!4).range(0.1,0.9);
        var mod = LFNoise2.kr(1/16!4).range(0.1,40);
        var sig = SinOsc.ar(base,Pulse.ar(2/[1,2,4,8]*~tempo*tmod)**mod*2pi) * SinOsc.ar(4/[1,2,4,8]*~tempo*tmod);
        //sig = sig;
        sig = CompanderD.ar(sig,cmod,1,1/2);
        sig = CombN.ar(sig,1/base,1/base*10,8 * LFNoise2.kr(1/8!4 * ~tempo).range(0.01,1))/4+sig;
        Splay.ar(sig,0.85,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    ~perlin.ar(2);
    ~perlin.quant=[2];
    ~perlin.fadeTime=1.2;
    ~perlin={
        var mmod = LFDNoise1.kr(1/16!4 * ~tempo).range(0.1,8);
        var mod = Duty.kr(32/~tempo,0,Dseq([1,2,3,4].reciprocal,inf)) ;
        var sig = LFSaw.ar([1/4/[1,2,3,4]*~tempo,1/4*~tempo,55/mod]) ** mmod * 2 + LFTri.ar(1/16*~tempo,mul:10) + LFTri.ar(1/360,mul:100);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        sig = Resonz.ar(sig,TWChoose.kr(Impulse.kr(8*~tempo/[1,2,3,4]),[1,2,4,8].reciprocal+1*550,[1,1,0.5,0.25],1),0.4);
        sig = Pulse.ar(4/[1,2,3,4]*~tempo/4) * sig;
        //sig = AllpassN.ar(sig,1/50,1+BrownNoise.ar(0.00001),4);
        sig = CompanderD.ar(sig,3/4,1/2,1/2).distort;
        Splay.ar(sig,0.9,0.15);
    };
    ~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;
