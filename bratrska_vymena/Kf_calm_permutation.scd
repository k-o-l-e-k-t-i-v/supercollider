
s.boot;

(
t = Tuning.harmonic;

Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;

Ndef(\a,{Splay.ar(
	~change = LFSaw.kr(1/2/[1,2,3,4,8,16,32]).range(1,8).round(2);

	~n = t.cents.at([1,2,7,11,7,2,1]) / 3.141528;
	~f = ~n / ~change + SinOsc.kr((_*0.1!4)).range(-2,2);

	FreeVerb.ar(
		XFade2.ar(
			RHPF.ar(
				SinOsc.ar(~f),
				SinOsc.ar(~f/(256..260)).range(~f/2,~f*2)
			),
			RLPF.ar(
				LFSaw.ar(~f),
				SinOsc.ar(~f/(512..516)).range(~f/2,~f*2)
			),
			SinOsc.kr([0.01,0.02,0.04,0.05])
		)
		* Decay.ar(Impulse.ar(4/[1,2,3,5,8,13,21,34]),[1,2,2,4,8,8,16]) +

		(WhiteNoise.ar(SinOsc.kr((_*0.01!4)+0.01).range(0.01,0.2)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13,21]),Decay.kr(Dust.kr([1,2,4,8])*4)))

		,0.333,2,0.2,0.8)

)}).play;
)

