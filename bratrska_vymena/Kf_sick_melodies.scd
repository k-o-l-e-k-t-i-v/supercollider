
(
Ndef(\a,{Splay.ar(


	~env = LFSaw.ar(1/4/fib(21)).squared;
	~f = LFNoise0.ar(1/4/fib(21)).range(0.01,12).round(pi/2).lag(0.1) /
	{TRand.ar(0.5,8,Impulse.ar(1/4/fib(21))).round(1)} +
	SinOsc.ar(1/[4,5,6,7]).range(-0.02,0.02);

	FreeVerb.ar(
		LPF.ar(
			CombN.ar(
				CompanderD.ar(
					OnePole.ar(
						LFSaw.ar(432*~f*(1.0001**(1..32)),mul:0.5/fib(12)).distort.tanh +
						LFTri.ar(43.2*(~f/1.5)*(1.001**(1..32)),mul:0.5/fib(12)).distort.tanh * ~env
						,SinOsc.ar(0.1/fib(8)).range(0.1,0.9))
					,0.5,1,0.5,SinOsc.ar(0.1/(2**(1..12))).range(0.001,0.1))

				,1,0.133/(1.001**(1..12)),8/fib(12))
			,880)
		,0.33,80)
	,0.5,1)}).play;
)

