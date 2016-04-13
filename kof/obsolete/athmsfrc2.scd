

s.boot;

(
Ndef(\a).fadeTime = 5.0;
Ndef(\a,{Splay.ar(CombL.ar(VarSaw.ar(2*[98,99,100,101,102,103,104]+SinOsc.kr([1,2,4,8,16]/1000.0).range(1,2),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/8.0).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/40.0)),0.2,0.21,3.0))}).play;


Ndef(\b).fadeTime = 5.0;
Ndef(\b,{Splay.ar(CombL.ar(VarSaw.ar(1.01*[98,99,100,101,102,103,104,105]+SinOsc.kr([1,2,4,8,16]/1001.0).range(1,5),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/10.1).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/30.14)),0.2,0.22,3.0))}).play;


Ndef(\c).fadeTime = 5.0;
Ndef(\c,{Splay.ar(CombL.ar(VarSaw.ar(4.01*[98,99,100,101,102,103,104,105,106]+SinOsc.kr([1,2,4,8,16]/1003.1337).range(1,2.3),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/10.0).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/100.23)),0.2,0.23,3.0))}).play;


Ndef(\d).fadeTime = 5.0;
Ndef(\d,{Splay.ar(CombL.ar(VarSaw.ar(0.5127*[98,99,97,96,95,94,93]+SinOsc.kr([1,2,4,8,16]/1008.1337).range(1,2.2),0,SinOsc.kr([0.5,0.4,0.3,0.1,0.01]/10.0).range(0.1,1.0),SinOsc.kr([0.1,0.13,0.02,0.041]/10.1)),0.2,0.27,3.0))}).play;


)

Ndef(\a).stop(10);
Ndef(\b).stop(10);
Ndef(\c).stop(10);
Ndef(\d).stop(10);


NdefMixer(s);