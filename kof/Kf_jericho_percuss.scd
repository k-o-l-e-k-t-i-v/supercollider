



(
Ndef(\nois).quant = 2.0;
Ndef(\nois).fadeTime = 8;
Ndef(\nois,{Splay.ar(
	CompanderD.ar(
	GVerb.ar(
		CombC.ar(
			BPF.ar(WhiteNoise.ar({ExpRand(0.01,0.95)}!8),{ExpRand(44,18000)}!8)
			,1,0.025/(1.01**(1..16)),2/fib(8))
		,100)
	,0.5,0.5,1)
)})
)

(
Ndef(\beat).quant = 2.0;
Ndef(\beat).fadeTime = 4.0;
Ndef(\beat,{Splay.ar(
	Decay.ar(Impulse.ar(8/fib(12)),{ExpRand(0.1,2)}!8);
)})
)

(
Ndef(\compose).fadeTime = 4.0;
Ndef(\compose,{Splay.ar(
	// GVerb.ar(
	Ndef(\nois).ar * Ndef(\beat).ar
		// ,10)
	,0.5,0.25)

}).play;
)