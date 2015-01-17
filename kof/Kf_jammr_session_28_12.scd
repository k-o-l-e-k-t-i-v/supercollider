
(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 8.0;
Ndef(\a,{Splay.ar(
		FreeVerb.ar(
		CompanderD.ar(
			Vibrato.ar(
			CombN.ar(
				SinOsc.ar([43,44.013,44*2,44*8]*16*(1+1/[2,4,16,32,64,1.25,1.25])) * LFPulse.ar(1/4/4/[1,2,4,8]).squared
				,[4,5,6,7]*[1,2,4,7,6,5].scramble,0.8)
				,0.5,1,0.5)
			,1,0.25/[1,2,4,8],10)
	,0.1933,20) * LFPulse.ar(1/[2,4,8]/[1,2,3,5,13]).squared
	,1,0.01355523454321)}).play;
)



(
Ndef(\b).quant = 2.0;
Ndef(\b).fadeTime = 8.0;
Ndef(\b,{Splay.ar(
		FreeVerb.ar(
		CompanderD.ar(
			Vibrato.ar(
			CombN.ar(
				SinOsc.ar([43,44.013,44*2,44*8]*32*(1+1/[2,4,16,32,64,1.25,1.25])) * LFPulse.ar(1/8/[1,2,4,8]).squared
				,[4,5,6,7]*[1,2,4,7,6,5].scramble,0.8)
			,0.5,1,0.5)
			,1,0.25/[1,2,4,8],10)
	,0.1933,20) * LFPulse.ar(1/[2,4,8]/[1,2,4,8]).squared
	,1,0.01355523454321)}).play;
)



(
Ndef(\c).quant = 2.0;
Ndef(\c).fadeTime = 8.0;
Ndef(\c,{Splay.ar(
		FreeVerb.ar(
		CompanderD.ar(
			Vibrato.ar(
			CombN.ar(
				SinOsc.ar([43,44.013,44*2,44*8]*64*(1+1/[2,4,16,32,64,1.25,1.25])) * LFPulse.ar(1/4/[1,2,4,8]).squared
				,[4,5,6,7]/[1,2,4,7,6,5],0.8)
				,0.5,1,0.5)
			,1,0.25/[1,2,4,8].scramble,10)
	,0.1933,20) * LFPulse.ar(1/[2,4,8]/[1,2,3,4]).squared
	,1,0.01355523454321)}).play;
)