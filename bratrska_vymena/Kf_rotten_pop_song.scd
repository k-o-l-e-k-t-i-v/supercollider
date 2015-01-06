(
Ndef(\qqq,{


	~mod2 = LFSaw.ar(1/4/[1,2,4,8]).range(1,8).round(2);
	~mod = SinOsc.ar(1/8/[1,2,4,8]).range(1,8).round(2) + ~mod2;

	Splay.ar(
	LPF.ar(
	CompanderD.ar(
	Normalizer.ar(
		AllpassN.ar(
			Pulse.ar(4/[1,2,4,8]) * SinOsc.ar([1111,1111.1/1.5,111/1.25,111/1.5]*~mod/12pi)
			,TExpRand.ar(0.0001,8,Impulse.ar(1/8!8)).lag(8),TExpRand.ar(0.01,8,Impulse.ar(8!8)).lag(0.01),8)
	,1.5,0.5)
	,0.5,1,0.5)
	,8800)
)}).play;
)

s.scope;