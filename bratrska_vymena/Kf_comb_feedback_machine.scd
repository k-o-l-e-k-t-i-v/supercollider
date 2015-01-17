(
Ndef(\z,{Splay.ar(
	Normalizer.ar(
	AllpassN.ar(
	RLPF.ar(
		GVerb.ar(
			(
				Resonz.ar(
					CombN.ar(
						WhiteNoise.ar(LFNoise0.ar(16!4)/2) + SinOsc.ar([43.2,43.21]*2) + Impulse.ar(4/[1,2,4,8])
						,0.5,LFNoise0.ar((1/2)!4).linlin(0,1,0.02,0.015).round(0.001).lag(0.2),8,LFNoise0.ar((1/2)!4).linexp(0,1,0.5,1.0))
					,[432,432.1]/4) * 4 *
				Decay.ar(Impulse.ar(4/[1,2,4,8]),1)
			).softclip
			,2,3,0.9)
		,4000+SinOsc.ar([4,5,6,7]).range(-30,10000))
		,0.033,0.033,4/[1,2,4,8])
	)
	,SinOsc.ar(0.1).linexp(-1,1,0.1,0.9))}).play;
)