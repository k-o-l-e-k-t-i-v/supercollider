(
p=ProxySpace.push(s);.reboot);
);

/////////////////////////////////////////////////////
/////////////////////////////////////////////////////



(
    var tempo = 4/3;
    var offset = (0..7)/8;
    t = TempoClock.new(tempo);
    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};

    offset = ((0..7)+0.5)/8;
    ~tick2.quant = 1;
    ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
    ~counter = {PulseCount.kr(~tick.kr)};
    ~time = {LFSaw.kr(tempo/4).range(0,1)};
)



// kick synth ///////////////////////////////////////

(
    ~kick.quant=1;
    ~kick.fadeTime=2.02;
    ~kick={
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75/(1..8)],[3,-3]),imp);
        var streva = env**40*(250+LFNoise2.kr(1/16).range(10,2000+(ToggleFF.kr(imp)*100)))+72;
        var sig = [
            LFPulse.ar(streva),
            Saw.ar(streva),
            SinOsc.ar(streva),
            Formant.ar(streva,70,120)
        ];
        sig = Select.ar(~counter/[1,2,3,4]%sig.size,sig);
        sig = sig ;//+ LFSaw.ar(44.0/[1,2,3,4],mul:0.2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~kick.play;
);
~kick.stop(7);
~kick.clear;


// hh synth ///////////////////////////////////////

(
    ~hh.quant=1;
    ~hh.fadeTime=0.02;
    ~hh={
        var imp = PulseDivider.kr(~tick,[4,3,2,1]*1.5,~counter);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25/(1..4)],[3,-3]),imp);
        var sig = HPF.ar(WhiteNoise.ar(0.8!2),LFNoise2.kr(4!2).range(2000,16000*env+2000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~hh.play;
);
~hh.stop(7);
~hh.clear;


// low synth ///////////////////////////////////////

(
    ~low.quant=1;
    ~low.fadeTime=5.02;
    ~low={
        var imp = PulseDivider.kr(~tick,64*fib(4),~counter);
        var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,4.5],[3,-3]),imp);
        var sig = SinOsc.ar(55.midicps*8/([1,2,1.5,1.25,1.125]*pi) + SinOsc.kr(11/fib(8)).range(-3,3) );
        sig = sig * SinOsc.ar(24.midicps*env) * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~low.play;
);
~low.stop(7);
~low.clear;



// high synth ///////////////////////////////////////

(
    ~high.quant=1;
    ~high.fadeTime=4.02;
    ~high={
        var imp = PulseDivider.kr(~tick.kr,64*fib(8),~counter.kr);
        var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,4.5],[3,-3]),imp);
        var sig = SinOsc.ar(72.midicps*8/([1,2,1.5,4]*pi) + SinOsc.kr(11/fib(8)).range(-3,3) );
        sig = sig * SinOsc.ar(12.midicps*env) * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~high.play;
);
~high.stop(7);
~high.clear;



// noise synth ///////////////////////////////////////

(
    ~noise.quant=1;
    ~noise.fadeTime=0.02;
    ~noise={
        var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
        var env = EnvGen.ar(Env([0.001,1,0.001],[8.002,4.5],[3,-3]),imp);
        var sig = Dust.ar(14444!2);
        var x,y;
        sig = BPF.ar(sig,LFNoise2.kr(1/8!4).range(1000,10000),0.2)*2;
        #x,y = Rotate2.ar(sig[0],sig[1],SinOsc.kr(7));
        sig = (x+y) * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~noise.play;
);
~noise.stop(7);
~noise.clear;

// out synth ///////////////////////////////////////

(
    ~out.quant=1;
    ~out.fadeTime=5.02;
    ~out={
        var sig = ~low.ar + ~high.ar + ~hh.ar + ~kick.ar + ~noise.ar;
        sig = Select.ar(~counter.kr%sig.size,sig) + sig;
        sig = sig + BrownNoise.ar(0.01!4);
        sig = sig * LFNoise2.kr(1/[4,5,6,7,8]);
        //sig = sig + (CombN.ar(sig,1/8,LFNoise2.kr(1/4!4).range(0.002,0.2),4)/4);
        sig = GVerb.ar(HPF.ar(sig,600),[40,50],drylevel:0.5,spread:55,maxroomsize:100)+LPF.ar(sig,600) + sig;
        sig = CompanderD.ar(sig,1/2,1/LFNoise2.kr(1/16!4).range(1.1,3),1/2);
        Splay.ar(sig.flat,0.75,0.5);
    };
    ~out.play;
);
~out.stop(7);
~out.clear;

/////////////////////////////////////////////////////
/////////////////////////////////////////////////////


//holy fuck. this is SOOOO nice. dayumn