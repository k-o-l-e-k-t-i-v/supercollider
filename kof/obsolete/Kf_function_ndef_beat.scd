s.boot;


(
Ndef(\a).quant = 2.0;

Ndef(\a,{
	var rythm;
	rythm = [1,2,4,8];

	RLPF.ar(
		WhiteNoise.ar(SinOsc.kr(1/2/rythm).range(0.01,1.0)) +
		SinOsc.ar([55,88,99,4000,8000]),
		SinOsc.kr(1/4/rythm).exprange(55.0,1001.0)
	) *

	Splay.ar(
		Decay.ar(Impulse.ar(8/rythm))
)}).play;
)