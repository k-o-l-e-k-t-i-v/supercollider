

(
Ndef(\rythm).fadeTime = 4;
Ndef(\rythm).quant = 2;

Ndef(\rythm).mold(16);
Ndef(\rythm,{
	Pulse.ar(4/(1..4),0.01*(1.9**(1..16))).softclip
});
)

(
Ndef(\magick).quant = 2.0;
Ndef(\magick).fadeTime = 2.0;
Ndef(\magick,{
	Splay.ar(
		CompanderD.ar(
		CombN.ar(
		SinOsc.ar(43.2 * ( LFTri.ar(432e-3/fib(32) ).squared.range(1,3) ** (1..32)),mul:1/fib(12)) +
				WhiteNoise.ar(0.015!32) * Ndef(\rythm).ar
		,1,432e-5*(1.01**(1..32)),(2**(1..16)),mul:1/fib(12))
		,0.5,1,0.5).softclip
			,0.33,1)}).play;
)