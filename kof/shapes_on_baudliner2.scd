
s.boot;

(
    Ndef(\saw).fadeTime = 2.0;
    Ndef(\saw,{|mod|
               Splay.ar(
                   CompanderD.ar(
                   FreeVerb.ar(
                   BBandPass.ar(
                       CombN.ar(
                           SinOsc.ar((1.50001**(1..32))*(1..32)*43.2*(0.5pi*mod).lag(0.1/(1..32)),0,1/(1..32) *
                                     Decay.ar(Impulse.ar(8/[1,2,4,8]),0.05*(1..32)))
                           ,0.2*(1..32),4/(1..32),32/(1..32)) * 12.8
                       ,SinOsc.ar(1/4/fib(8,9,21)).range(44,2200/(1..32)),
                       SinOsc.ar(4/fib(2,3,12)).range(1,1/16/(1..32))).softclip
                       ,0.75,(1..32)) * 16 * LFSaw.ar(1/4/(1..32)).squared
                   ,0.9,1,0.1)
                   ,0.5,1,0.5);
              }).play;

    Ndef(\saw)[1] = \set -> Pmono(\aa,
                                  \dur, Pseq(4/fib(12),inf),
                                  \mod, Pseq([1,1.5,2,1.25,0.5,0.25,2,1/2+1,1/4+1,1/8+1],inf)
                                 );


)
