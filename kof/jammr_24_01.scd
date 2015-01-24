s.boot;

(
  Ndef(\a).quant = 2.0;
  Ndef(\a).fadeTime = 8.0;
  Ndef(\a,{Splay.ar(
    AllpassN.ar(
      CombN.ar(
        RLPF.ar(SinOsc.ar(432*(1..12)*((1.0001)**(1..8))/2pi,mul:1/(1..12)),SinOsc.ar(8/(1..12)).range(22000,44) ) * LFSaw.ar(8/(2**(1..12))).squared
        ,MouseX.kr(0.002,1),MouseY.kr(0.002,4),8)
      ,0.02*(1..12),4,12)
    ,0.2,1)}).play;
)

Ndef(\a).stop(30)
