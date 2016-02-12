

(
Ndef(\pila).fadeTime = 2.0;
Ndef(\pila).quant = 2.0;

Ndef(\pila,{
	(
		CombN.ar(
			LFSaw.ar([0.5,2]*1/2) * LFSaw.ar([0.5,2]*22) * LFPulse.ar(1/[1,2]).lag(0.01)
			,0.1,LFNoise1.ar(320!2).range(1,160)/48000,32)
	).softclip * SinOsc.ar([44,44.1]*2,mul:0.45)
}).play;
)