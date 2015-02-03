
s.boot();
(
  Ndef(\a).fadeTime = 8.0;
Ndef(\a,{Splay.ar(
  SinOsc.ar(43.07*3pi*(1.001**(1..32)),mul:1/(1..32)) 
  ,1,1,0.5)}).play;
)
