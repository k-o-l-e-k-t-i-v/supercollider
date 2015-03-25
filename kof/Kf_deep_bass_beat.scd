(
Ndef(\z,{
	var a;
	a = LFCub.ar((1/12)!4+({ExpRand()/100.0}!12)).linlin(-1,1,-0.9,0.9);
	Splay.ar(
		LFCub.ar([77,77.01]*LFSaw.ar(1/[1,2]).linlin(-1,1,1,0.001),a) * LFPulse.ar(4/[1,2])
)}).play;
)