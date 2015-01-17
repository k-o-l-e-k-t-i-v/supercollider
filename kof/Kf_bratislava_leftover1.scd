(
Ndef(\first).quant = 2.0;
Ndef(\first,{Splay.ar(
	LFSaw.ar([432,432.1,432.13,432.14]/3pi) * LFSaw.ar([1.5,1,1,8].scramble).squared
)}).play;
)

(
Ndef(\second).quant = 2.0;
Ndef(\second,{Splay.ar(
	SinOsc.ar([432,432.1,432.13,432.14] / 1.25pi) * LFSaw.ar([1.5,1,1,8].scramble).squared
)}).play;
)

Ndef(\second).stop(5)


(
Ndef(\third).fadeTime = 2.0;
Ndef(\third).quant = 2.0;
Ndef(\third,{Splay.ar(
	GVerb.ar(
		SinOsc.ar([432,432.1,432.13,432.14] /  ([4,1.5,1.25,1,0.5,1.25] * 1.5pi) ) * LFSaw.ar(1/16/[1,2,4,8].scramble).squared
	,20,3,0.2)

)}).play;
)


Ndef(\third).stop(5)






(
Ndef(\third).fadeTime = 2.0;
Ndef(\third).quant = 2.0;
Ndef(\third,{Splay.ar(
	GVerb.ar(
		LPF.ar(
		WhiteNoise.ar(0.6!4) * Decay.ar(Impulse.ar(2/[1,2,3,5,8,13]),0.1)
			,LFNoise0.ar(1!4).range(44,22000))
			,10,3,0.2)

)}).play;
)


(
Ndef(\new).fadeTime = 2.0;
Ndef(\new).quant = 2.0;
Ndef(\new,{
	Splay.ar(
		Vibrato.ar(
			LFSaw.ar(LFSaw.ar([32/[1,2,3,5,13,21]]).range(4320*2,1)) * Decay.ar(Impulse.ar(8/[1,2,3,5,13,21]))
			,[4,5,6,7],0.1)
	,1,0.1)
}).play;

)

Ndef(\new).stop(10)


(
Ndef(\quar).quant = 2.0;
Ndef(\quar,{Splay.ar(
	LFSaw.ar([432,432.1,432.13,432.134]/1.5pi) * Decay.ar(Impulse.ar([4,2,1,4]))
)}).play;
)

NdefMixer(s);