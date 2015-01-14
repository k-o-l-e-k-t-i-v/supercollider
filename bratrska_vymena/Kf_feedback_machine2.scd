
(
Ndef(\rythm).fadeTime = 4;
Ndef(\rythm).quant = 4;

Ndef(\rythm,{Splay.ar(
	Splay.ar(
		Pulse.ar(4/(2**(1..8)))
	)
)});
)

(
Ndef(\a).fadeTime = 4.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{Splay.ar(
	Limiter.ar(
		SinOsc.ar(DelayN.ar(Ndef(\a).ar,0.25,4).range(432/8,432*1.5)) + SinOsc.ar(432*[1,1]) * Ndef(\rythm).ar
	)
)}).play;
)