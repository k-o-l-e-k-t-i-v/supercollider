
(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

// hen synth ///////////////////////////////////////

(
    ~hen.ar(2);
    ~hen.quant=2;
    ~hen.fadeTime=4;
    ~hen={
        var sig = StandardN.ar(14320/[1.333,16,1.25,1.5],0.5+LFNoise1.ar(1/400/[1,2,3,4]).range(0.5));
        sig = RLPF.ar(sig,4320/12*[1,11,4,6,2,3,7,6].scramble,0.1+LFNoise2.kr(1!4))*2;
        sig = CombN.ar(sig,1/[2,4,8,1],1,16)+sig;
        sig = sig * Decay.ar(Impulse.ar([2,4,8,2]*4/[1,2,3,4,5,6,7,8]),0.25);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.5,0.125);
    };
    ~hen.play;
);
~hen.stop(4);
~hen.clear;
~hen.pause;
~hen.resume;

~reb.quant=2;
~reb={loop{~hen.rebuild;4.wait;}}.fork;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**40*400));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hh synth ///////////////////////////////////////

(
    ~hh.ar(2);
    ~hh.quant=2;
    ~hh.fadeTime=0.2;
    ~hh={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFNoise1.ar(14320/[1,2,3,4],env/2) + WhiteNoise.ar(env**4/2!2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.075);
    };
    ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;
