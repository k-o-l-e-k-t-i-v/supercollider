(
Ndef(\1,{Splay.ar(

	CombN.ar(
		LPF.ar(
			FreeVerb.ar(
				BBandPass.ar(
					CompanderD.ar(
						SinOsc.ar(22000/(1.5**(8..16)).scramble) +
						LFSaw.ar(43.2/(1.00022**(1..32)),SinOsc.ar(4.32/(1.00011**(1..32))).range(-4pi,4pi),mul:1) * LFSaw.ar(1/4/fib(21)).squared
						,0.125,0.5,1,0.001,0.001)
					,SinOsc.ar(1*(1.01**(1..32))).range(44,4320))
				,0.133,100)
			,4320)
		,0.133/(1.01*(1..32)),4,32)
	,0.4,1)}).play;
)


s.scope;