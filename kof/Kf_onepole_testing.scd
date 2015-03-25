s.boot;


(
Ndef(\evlover).quant = 2.0;
Ndef(\evlover).fadeTime = 2.0;
Ndef(\evlover,{
	var mod,f;
	mod = LFNoise0.kr(1/[1,2,3,5,8,12,21,34]).range(-24,24).round(12);
	f = ([61,63,67]-24+mod).midicps + LFNoise0.ar(1).lag(1);

	Splay.ar(
		FreeVerb.ar(
			AllpassN.ar(
				LPF.ar(
					TwoPole.ar(
						XFade2.ar(
							SinOsc.ar(f/2,mul:0.7),
							SinOsc.ar(f*1.5,mul:0.7),
							SinOsc.kr(1/16)
						),
						SinOsc.ar(f/4096.0).range(f/2,f*2),
						SinOsc.ar(1/16/[1,2,3,5,8]).exprange(0.001,0.35)
					),
					SinOsc.ar(f/804.80).range(f/2,f*2)
			),0.66,0.33,4,mul:1) *
			Decay.ar(Impulse.ar(8/[1,2,3,5,8,13,21,34]),1/2)
			,0.133,2).softclip
	)
}).play;
)



(
Ndef(\hiss).fadeTime = 2.0;
Ndef(\hiss).quant = 2.0;
Ndef(\hiss,{Splay.ar(
	FreeVerb.ar(
		OnePole.ar(WhiteNoise.ar([0.2,0.2]),SinOsc.kr(1/[16,16.6]).range(-0.99,0.99)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8]))
	)
)}).play;
)

(
Ndef(\beat).fadeTime = 2.0;
Ndef(\beat).quant = 2.0;
Ndef(\beat,{Splay.ar(
	OnePole.ar(SinOsc.ar([77,77.1]),SinOsc.ar(0.1).range(-0.99,0.99)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8]));
)}).play;
)


