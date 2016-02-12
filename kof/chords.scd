

(
    p.clock.tempo_(60/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


(
n = ProxyMixer(p,32);
n.parent.alwaysOnTop_(true);
)

// cho synth ///////////////////////////////////////

(
    ~cho.ar(2);
    ~cho.quant=2;
    ~cho.fadeTime=0.2;
    ~cho={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var mid = [57,59,60,62,64,65,68,69,71,72,74,76,77,80,81,83,84,86,88,89,92,93];
        var chords = [[3,7,10],[4,7,10],[4,7,11],[3,6,9]].choose;
        var sig = SinOsc.ar((Select.kr([1,2,4]+chords,mid)).midicps,SinOsc.kr(1/4/[1,2,3])*pi,mul:0.2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~cho.play;
);
~cho.stop(4);
~cho.clear;
~cho.pause;
~cho.resume;


Tdef(\melody,{loop{~cho.rebuild;4.wait}})
TdefAllGui.new
