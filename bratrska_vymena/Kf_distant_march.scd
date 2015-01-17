(
Ndef(\z).fadeTime = 3.0;
Ndef(\z, {Splay.ar(
	AllpassC.ar(
		LPF.ar(
			BBandPass.ar(
				    SinOsc.ar([77,77]) + BrownNoise.ar(0.1!2),
				220,LFSaw.ar(1/4/[1,2]).range(2,5), // bw
				    1)+ WhiteNoise.ar(0.1!2) * Decay.ar(Impulse.ar(4/[1,4]),1.2)
			,1000)
		,2,0.0125,2) +
	AllpassC.ar(
		HPF.ar(
			LPF.ar(
				LFSaw.ar([2000,4001,150,150/8,150/4] + LFNoise0.ar(8).lag(1),mul:0.5) * LFSaw.ar(1/8/[1,2,4,8]).squared
				,LFSaw.ar(44/[1,2]).range(220,1660))
			,220)
		,4,0.0125,8)

)}).play;

)