
(
Ndef(\pila).fadeTime = 2.0;
Ndef(\pila).quant = 2.0;

Ndef(\pila,{
	(
		CombN.ar(
			LFSaw.ar([0.5,2]*1/2) * LFSaw.ar([0.5,2]*22) * LFPulse.ar(1/[1,2]).lag(0.1)
			,0.1,LFNoise1.ar(88!2).range(1,16)/48000,32)
	).softclip * SinOsc.ar([44,44.1]*[2,2.01],mul:0.75)
});
)

Ndef(\pila).stop


(
var num,speed,sharpness;
num = 127;
speed = 1/16/[12,18,22,99,0.1];
sharpness = 0.02;

Ndef(\filtr).fadeTime = 2.0;
Ndef(\filtr,{
	Splay.ar(
	BPF.ar(
			Ndef(\pila).ar + SinOsc.ar((1..10)/100.1,mul:0.01)
			,(1..num)*(16000/num)+SinOsc.ar({ExpRand()}!48).range(-40,40),sharpness,SinOsc.ar({ExpRand()*speed}!48).exprange(0.001,8)
		)
,0.17,1)}).play;
)