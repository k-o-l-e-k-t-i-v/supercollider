
s.boot;

(
    Ndef(\saw).fadeTime = 2.0;
    Ndef(\saw,{|mod|
               Splay.ar(
                   BBandPass.ar(
                       CombN.ar(
                           LFSaw.ar((1..32)*43.2*mod.lag(0.1),0,1/(1..32))
                           ,0.2*(1..32),4/(1..32),32/(1..32)) * 128
                       ,SinOsc.ar(1/fib(8,9,21)).range(22*(1..32),22000/(1..32)),1/8/(1..32)).softclip
                   ,0.5,1,0.5);
              }).play;

    Ndef(\saw)[1] = \set -> Pmono(\aa,
        \dur, 4,
        \mod, Pseq([1,1.5,2,1.25,0.5,0.25,2,4,8],inf)
    ); 
)
