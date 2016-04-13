
(
Ndef(\z).quant = 2.0;
Ndef(\z).fadeTime;
Ndef(\z,{Splay.ar(

	FreeVerb.ar(
		AllpassC.ar(

			LPF.ar(
			OnePole.ar(
					LFSaw.ar([1,2,4,8],mul:0.5) * LFSaw.ar([55,55.1,55.2,55.3]),SinOsc.ar(0.1).range(-0.9,0.9)
				)
			,110)
			,0.133,0.133,1)
		,0.133,1)

)}).play;
)