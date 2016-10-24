
(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.45,lp=3500,hp=150,len=20,rev = 1|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = Compander.ar(sig,3/4,1/1.5,1/3);
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
    ~tick.quant=4;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr(~tempo*4); };
);

p.clean;
(
    p.clock.tempo_(127/60);
    p.arProxyNames.do(p[_.asSymbol].rebuild);
)



// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant = [2,0];
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
        ];
        var mod = LFNoise2.kr(4).range(-20,40);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[mod,-4.3]), imp * hit);
        var sig;
        var hum = LFNoise2.kr(~tempo).range(0.0,0.09);
        env = DelayN.ar(env,hum,hum);
        sig = SinOsc.ar(50+(env**20*250),env*8pi);
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
        var mod = LFNoise2.kr(1/4).range(-20,20);
        var imp = PulseDivider.kr(~tick.kr,1);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[mod,-4]),imp * hit);
        var sig;
        var hum = LFNoise2.kr(~tempo).range(0.0,0.005);
        env = DelayN.ar(env,hum,hum);
        sig = Crackle.ar(0.4+env); 
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
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
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var base = 33.midicps + LFDNoise1.kr(1/4,mul:5);
        var tmod = 1;//TWChoose.kr(Impulse.kr(~tempo/[1,2,3,4]!4),[1,2,1/4,1/8],[0.6,0.4,0.2,0.1],1);
        var mod = LFDNoise1.kr(1/32!4).range(0.1,8);
        var sig = SinOsc.ar(base,Pulse.ar(2/[1,2,3,4]*~tempo*tmod)**mod*2pi) * SinOsc.ar(4/[1,2,3,4]*~tempo*tmod);
        //sig = sig;
        sig = CombC.ar(sig,1/base,1/base*4,2 * LFNoise2.kr(1/16!4).range(0.01,1));
        Splay.ar(sig,0.85,0.45);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


