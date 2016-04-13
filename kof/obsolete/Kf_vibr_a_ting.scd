
(
Ndef(\zzz,{
	var t,s,env;
	t = LFSaw.ar(2/[1,2,4,8]).linlin(-1,1,0.02,SinOsc.ar(1/[1,2,4,8]).range(0.01,0.002));
	s = LFPulse.ar(2/[1,2,4,8]).linlin(-1,SinOsc.ar(2/[1,2,4,8]).abs+0.0001,1,-1);
	env =  Decay.ar(Impulse.ar(4/[1,2,4,8]),0.5);
	Splay.ar(
		AllpassN.ar(
			Resonz.ar(
				CombN.ar(s,t.linexp(0,1,1,0),t,2,1,s) * s * env;
				,[77,77.1,35,777.1]+SinOsc.kr([0.1,0.11]).range(0,33))
			,0.33,0.033,1)
)}).play;
)