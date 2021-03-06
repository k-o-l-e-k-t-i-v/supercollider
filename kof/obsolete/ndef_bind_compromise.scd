

s.boot;

(
    Ndef(\abc).quant = 2.0;
    Ndef(\abc,{|note=60,oct=0,mod1,mod2,oct1,oct2|
               Splay.ar(
                   FreeVerb.ar(
                       CombN.ar(
                           Vibrato.ar(
                           LFTri.ar( (mod1+mod2).midicps * oct1 + (1.01**(1..8)), mul:0.75) +
                           LFSaw.ar((note+oct).midicps * oct2 + (1.001**(1..8)),mul:0.5) * LFSaw.ar(1/4/fib(5)).squared
                               [4,5,6,7],0.2)
                           ,0.02,4,8) +
                       (SinOsc.ar(99*(1/oct1+oct2)) * Pulse.ar(4/[1,2,4],mul:0.2)) +
                       (WhiteNoise.ar(0.1!4) * Pulse.ar(2/[1,2,4],mul:0.1))
                       ,0.33,100)
               )}).play;

    Ndef(\abc)[1] = \set -> Ppar([
        Pbind(
            \dur, Pseq([1/4], inf),
            \note, Pseq([60,61,72],inf),
            \oct, Pseq([[0,12,-12],[0,-12,12],[24,0,0]],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4,1/2], inf),
            \mod1, Pseq([60,67,61]-24,inf),
            \mod2, Pseq([[0,12,-12],[0,-36,12],[24,0,-36]],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4,1/2]*16, inf),
            \oct1, Pseq([1,1.5,1.25,0.5,0.75,1.25,2,1],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4,1/2]*32, inf),
            \oct2, Pseq([1,1.5,1.25,0.5,0.75,1.25,2,1],inf)
        )
    ])
);
)


// <3