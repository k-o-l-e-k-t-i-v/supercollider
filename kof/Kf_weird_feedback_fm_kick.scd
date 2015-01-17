
NdefMixer(s);

(
Ndef(\ss,{

	~t = 4/[1,1,2,4,8];

	Splay.ar(
	SinOsc.ar(
		(
			CombN.ar(
				LPF.ar(
					GVerb.ar(
						Impulse.ar([1,1.1]) + WhiteNoise.ar(0.01!2)
					)
					,LFNoise0.ar(1!3).range(44,99)) * 200.0
				,0.05,SinOsc.ar(~t).range(0.01,0.04),8) * Decay.ar(Impulse.ar(~t))
	).softclip.range(54,77)) * Decay.ar(Impulse.ar(~t),1/~t)
)}).play;
)