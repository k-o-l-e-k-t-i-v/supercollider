

s.boot;

(
    Ndef(\abc).quant = 2.0;
    Ndef(\abc,{|note=60,oct=0,mod1,mod2,oct1,oct2|
               Splay.ar(
                   FreeVerb.ar(
                           Vibrato.ar(
                               LPF.ar(
                                   LFSaw.ar( (mod1+mod2).midicps.lag(1) * oct1 * (1.01**(1..8)), mul:0.25) +
                                   LFSaw.ar((note+oct).midicps * oct2 * (1.001**(1..8)),mul:0.25) * LFSaw.ar(1/8/[1,2,4,8]).squared
                                   ,((note+oct).midicps + (mod1+mod2).midicps * (1.01**(1..8))))
                               [4,5,6,7],0.2) + LFSaw.ar((note+oct-24).midicps * 1.5 * oct2 * (1.00001**(1..8)),mul:0.12) +
                       (SinOsc.ar(99+((1/oct1+1/oct2)*9)) * Decay.ar(Impulse.ar(4/[1,2,4]),0.1,mul:0.4)) +
                       HPF.ar((WhiteNoise.ar(0.2!4) * Pulse.ar(4/fib(8),mul:0.4)),SinOsc.ar(0.01**(1..8)).range(444,4444))
                       ,0.133,2)
               ,0.2,1)}).play;

    Ndef(\abc)[1] = \set -> Ppar([
        Pbind(
            \dur, Pseq([1/4], inf),
            \note, Pseq([60,65,69],inf),
            \oct, Pseq([[0,12,-12],[0,-12,12],[24,0,0]],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4,1/2], inf),
            \mod1, Pseq([60,67,61]-24,inf),
            \mod2, Pseq([[0,12,-12],[0,-36,12],[24,0,-36]],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4]*16, inf),
            \oct1, Pseq([1,1.5,1.25,0.5,0.75,1.25,2,1],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4]*32, inf),
            \oct2, Pseq([1,1.5,1.25,0.5,0.75,1.25,2,1].reverse,inf)
        )
    ])
);
)
