
s.reboot;

(


    Ndef(\mod).quant = 2.0;
    Ndef(\mod,{Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1.5,3,8,1,2,4,1.5,1,1,1])});

    SynthDef(
        \one,
        {|freq = 220,freq2 = 221,dur = 1,amp = 1,mod = 1,harm = 1000|
         var sig,env;
         env = EnvGen.ar(Env([0,1,0],[0.02,dur*{ExpRand(1,2)}!12],[-3,3]),doneAction:2);
         sig = LPF.ar(SinOsc.ar([freq2,freq] * mod.lag({ExpRand(0.01,dur/2)}!8) / Ndef(\mod).kr, mul:0.12),harm.lag(1/16)) * env;
         Out.ar(0,Splay.ar(
             sig
             ,0.05,1));
        }).add;


    Pdef(\z,{
        Ppar([
            Pbind(
                \instrument,\one,
                \dur, 1/8,
                \freq,Pshuf(2**(1..8)*55*pi,inf),
                \mod,Pshuf([1,2,0.5,1,1.5],inf),
                \freq2,Pshuf(2**(1..8)*55*pi,inf),
                \amp,Pwhite(0.5,1,inf),
                \harm, Pwhite(22,1800,inf)
            ),
            Pbind(
                \instrument,\one,
                \freq,Pshuf(2**(1..8)*5.5*pi,inf),
                \freq2,Pshuf(2**(1..8)*5.5*pi,inf),
                \mod,Pshuf([1,2,0.5,1,1.5],inf),
                \amp,Pwhite(0.5,1,inf),
                \dur, 1/8,
                \harm, Pwhite(22,8000,inf)
            ),
            Pbind(
                \instrument,\one,
                \dur, 1/4,
                \mod,Pshuf([1,2,0.5,1,1.5],inf),
                \amp,Pwhite(0.5,1,inf),
                \freq,Pshuf(2**(1..8)*5.5*pi,inf),
                \freq2,Pshuf(2**(1..8)*5.5*pi,inf),
                \harm, Pwhite(22,8000,inf)
            )
        ])}).play(quant:2);
)
