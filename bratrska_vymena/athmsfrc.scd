


Ndef(\a,{Splay.ar(CombN.ar((WhiteNoise.ar(0.08!8) * Pulse.ar(6.6).clip()) + VarSaw.ar(VarSaw.kr(0.01*{ExpRand()}!20).exprange(44,99),{ExpRand()}!20,{ExpRand()}!20)))});


Ndef(\b,{Splay.ar( Compander.ar(BBandPass.ar( Ndef(\a).ar, SinOsc.kr(0.1).exprange(44,444))) )}).play;


Ndef(\c,{Splay.ar(Compander.ar(Ndef(\b).ar * Pulse.ar(6.6),0,0.75,2.2))}).play();

Ndef(\d,{Splay.ar(Compander.ar(VarSaw.ar({ExpRand()*44100}!8,{ExpRand()}!8,{ExpRand()}!8,{ExpRand()/2.0}!8) * Pulse.ar({ExpRand()*10.0}!8).clip()))}).play;


NdefMixer(s);