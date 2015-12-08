


(
    p.clock.tempo_(32*2);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**50*500));
        sig = sig * env;
        Splay.ar(sig,0.15,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hat synth ///////////////////////////////////////

(
    ~hat.ar(2);
    ~hat.quant=2;
    ~hat.fadeTime=4.2;
    ~hat={
        //         |       |       |       |       |  
        var pat = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = LFNoise0.ar(16000/[1,20,2,40]);
        sig = sig * env;
        sig = AllpassC.ar(sig,1/200,1/200*[1,2,8,4],2);
        Splay.ar(sig,0.15,0.25);
    };
    ~hat.play;
);
~hat.stop(4);
~hat.clear;
~hat.pause;
~hat.resume;

// mago synth ///////////////////////////////////////

(
    ~mago.ar(2);
    ~mago.quant=2;
    ~mago.fadeTime=0.02;
    ~mago={
        //         |       |       |       |       |  
        var pat = [0,1,0,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
        var mod = Duty.kr([4,1,1/4,1/8],0,Dseq([1,2,1.5,1.25,1.3333,2,8,4],inf)).lag(0.015);
        var sig = [
            SinOsc.ar( 15000 / 1.33333335, mul:0.2),
            LFSaw.ar( 15000 / 2  / 1.25, mul:0.2),
            SinOsc.ar( 150 / 1.25 / 2, mul:0.2),
            VarSaw.ar( 15000 / 1pi, mul:0.2),
            SinOsc.ar( 150 / 1.3333335, mul:0.2),
            LFSaw.ar( 15000 / 1.5 / 2, mul:0.2),
            SinOsc.ar( 15000 / 1.333335, mul:0.2),
            SinOsc.ar( 150 / 1.25, mul:0.2),
            LFNoise2.ar( 10000 / 1.125 / 2, mul:0.2),
            SinOsc.ar( 150 / 1.125, mul:0.2),
            Pulse.ar( 15000 / 1.125, mul:0.2),
            SinOsc.ar( 150 / 1.25 / 2, mul:0.2),
            LFSaw.ar( 50 / 1.5, mul:0.2),
            SinOsc.ar( 1500 / 1.25, mul:0.2),
            LFTri.ar( 150 / 1.5, mul:0.2),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        //sig = sig * env;
        sig = CombN.ar(sig,1/4/mod.lag(4),1/[200,40,4,8]/fib(16)/mod,0.25)+sig;
        sig = CompanderD.ar(sig,1/2+SinOsc.ar(4/[1,2,3,4]).range(-0.41,0.41),1/4,1/2);
        Splay.ar(sig,0.25,0.09875);
    };
    ~mago.play;
);
~mago.stop(4);
~mago.clear;
~mago.pause;
~mago.resume;



