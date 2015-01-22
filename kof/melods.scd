
s.boot;

(

    (
        Ndef(\mod).quant = 2.0;
        Ndef(\mod,{Splay.kr(Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,0.5,2,1,1,1.5,1.25,2,4,1,1]) )});
    );

    SynthDef(\base2,{|freq = 0, amp = 0.5,dur = 1|
                     var sig,env,fenv;
                     env = EnvGen.ar(Env([0,1,0],[0.02,dur],[-3,3]),doneAction:2);
                     fenv = EnvGen.ar(Env([freq,freq*Ndef(\mod).kr,99*Ndef(\mod).kr],[0.02,dur/8],[3,-3]));

                     sig = LFSaw.ar(fenv+(1.001**(1..8))) * env;
                     sig = 
                     AllpassC.ar(
                         BBandPass.ar(
                             Vibrato.ar(
                                 sig
                                 ,[4,5,6,7].scramble,0.02)
                             ,SinOsc.ar(fenv/fib(12),{ExpRand(0,2pi)}!8).range(fenv*Ndef(\mod).kr,freq)
                         )
                         ,0.012,1,2);

                     Out.ar(0,Splay.ar(sig,0.5,amp));
                    }).add;
)

(
    Pdef(\two,{
        Ppar([
            Pbind(
                \instrument, \base2,
                \dur, Pseq([1/2,1,1,1]/4, inf),
                \freq, Pxrand([72,60+[12,-24].choose,65,61+[24,-24].choose].midicps, inf),
                \amp, Pwhite(0.4,0.8),
            ),
            Pbind(
                \instrument, \base2,
                \dur, Prand([1/2,1]*8, inf),
                \freq, Pxrand(([61,60,72,63]-24).midicps, inf),
                \amp, Pwhite(0.1,0.4)
            ),
            Pbind(
                \instrument, \base2,
                \dur, Prand([1/2,1]*8, inf),
                \freq, Pxrand(([61,60,72,69]-24).midicps, inf),
                \amp, Pwhite(0.1,0.4)
            ) 
        ])
    }).play(quant:2);
)
