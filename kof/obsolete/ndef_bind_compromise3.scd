

s.boot;

(
    Ndef(\abc).quant = 2.0;
    Ndef(\abc,{|note=60,oct=0,mod1,mod2,oct1,oct2|
               Splay.ar(
                   FreeVerb.ar(
                       CompanderD.ar(
                           Vibrato.ar(
                               CombN.ar(
                                   LFTri.ar((mod1+mod2).midicps * oct1 * (1.001**(1..8)), mul:0.5).distort +
                                   LFSaw.ar((note+oct).midicps * oct2 * (1.0001**(1..8)),mul:0.25).distort
                                   ,0.02,4,8) *
                               LFSaw.ar(1/2/fib(8)).squared
                               ,[4,5,6,7],1/(1..8)) +
                           LFSaw.ar((note+36).midicps / (oct1*oct2).lag(1/fib(8)) * (1.001**(1..8)),mul:0.5).tanh.distort +
                           (SinOsc.ar([44,45]) * Pulse.ar(4/[1,2,2,4],mul:0.35)) +
                           HPF.ar((WhiteNoise.ar(0.2!4) * Pulse.ar(4/fib(8),mul:0.4)),SinOsc.ar(1.1**(1..8)).range(444,4444))
                           ,0.5,1,0.5)
                       ,0.33,2)
                   ,0.5,1)}).play;

    Ndef(\abc)[1] = \set -> Ppar([
        Pbind(
            \dur, Pseq([1/4], inf),
            \note, Pseq([60,65,69,61,61,60-12,60,60+12], inf),
            \oct, Pseq([[0,12,-12].scramble,[0,-12,12].scramble,[24,0,0].scramble].scramble,inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4], inf),
            \mod1, Pseq([60,60-12,61],inf),
            \mod2, Pseq([[0,12,-12].scramble,[0,-0,12].scramble,[24,0,0].scramble].scramble,inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4]*16, inf),
            \oct1, Pseq([1,1.5,1.25,0.5,0.75,1.25,2,1],inf)
        ),
        Pbind(
            \dur, Pseq([1/4,1/4]*32, inf),
            \oct2, Pseq([1.5,1.25,0.5,0.75,1.25,2,1].reverse,inf)
        )
    ])
);
)
