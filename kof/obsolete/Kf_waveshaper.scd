
(
Ndef(\waveShaper,{

	Splay.ar(
		CombC.ar(
			SinOsc.ar(432/8pi,mul:0.25)
			,0.41,TExpRand.ar(0.008,0.01,Impulse.ar(4444)).lag(SinOsc.ar((1..32)/320).range(0,0.5)),8).softclip * LFSaw.ar(1/4/[1,2,4,8])
		,1,0.7).softclip
}).play;
)