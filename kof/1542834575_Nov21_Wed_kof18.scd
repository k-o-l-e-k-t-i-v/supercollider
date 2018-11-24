


p.push();

(
    ProxySynthDef(\alpha,{
        arg freq, sustain;
        var sig,env;

        sig = VarSaw.ar(freq);
        env = EnvGen.kr(Env([0,1,0], [0.1,0.5,0.01],curve:\lin), timeScale: sustain, doneAction:2);
        sig = sig * env;
        Splay.ar(sig,1,0.13);
    }).add;
)

(
    ~mel.play(fadeTime:4);
    ~mel.quant=4;
)

(
    ~mel[0]=Pbind(
        \instrument, \alpha,
        \dur, Pseq([1,2,1,0.5],inf),
        \sustain, 0.5,
        \octave, Pseq([4,5,[5,6],[2,7]],inf),
        \note, Prand([4,[2,6,5,8]],inf)
    );
)

// aa synth ///////////////////////////////////////

(
    ~aa.ar(2);
    ~aa.clock = p.clock;
    ~aa.quant=2;
    ~aa.fadeTime=4;
    ~aa={
        var sig = SinOsc.ar(50!2);
        Splay.ar(sig,0.5,0.25);
    };
    ~aa.play;
);
~aa.stop(4);
~aa.clear;
~aa.pause;
~aa.resume;
