
(

var f1 = 44;
var f2 = 777;

var arr = 0.5 * [0.25,3,12,0.25,0.25,6,0.5,0.25];

Ndef(\bass1,{Splay.ar(SinOsc.ar({ExpRand().exprange(f1,f1*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
Ndef(\bass2,{Splay.ar(SinOsc.ar({ExpRand().exprange(f1,f1*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
Ndef(\bass3,{Splay.ar(SinOsc.ar({ExpRand().exprange(f2,f2*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
Ndef(\bass4,{Splay.ar(SinOsc.ar({ExpRand().exprange(f2,f2*2)}!8) * Pulse.ar(arr).clip(),1,0.55)}).play;
)

NdefMixer(s);

s.scope;