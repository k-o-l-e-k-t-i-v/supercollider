
s.boot;
(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{Splay.ar(
	~base = [60,60.13];
	~saws = LFSaw.ar(1/8/[1,2,3,5,8,13,21,34,55,89]).squared;

	FreeVerb.ar(
		FreeVerb.ar(
			SinOsc.ar(SinOsc.kr([1,1/2,1/4,1/8]*pi).range(~base,~base+2),mul:2)
			,0.1375,1).softclip * Decay.ar(Impulse.ar(8/[1,2,3,5,8])).squared + (VarSaw.ar(SinOsc.kr([1,1/2,1/4,1/8],(8pi*~saws)).range(~base*2,~base*2+2)) * ~saws) +
		(HPF.ar(WhiteNoise.ar(0.75!4),10080) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),0.6).squared)

		,0.1,2).softclip
)}).play;
)