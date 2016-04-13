(
Ndef(\psychadelic,{
	var a;
	a = FreeVerb.ar(
		CombN.ar(
			CombN.ar(
				sin(LFSaw.ar(220*(LFSaw.ar(1/[1,2,4,8]).range(0.01,1))*2200))
				,1,0.1*((cos(1-LFSaw.ar(1/64))+1.0001) ),40).lag(0.001+LFSaw.ar(11).range(0,0.1)) * LFSaw.ar(432/[1.5pi,2pi]) * SinOsc.ar([44,45]*2) * Pulse.ar(8/[1,2,4,8])
			,0.01,0.1*((sin(1-LFSaw.ar(1/640.13))+1.0001) ),40).lag(0.01+LFSaw.ar(4/[1,2]).range(0,0.1))
		,0.199,10) * 2;

	Splay.ar(
		Compander.ar(a,a,0.4,1,0.0025,0.01,0.01)
,0.1,1).clip(-1,1)}).play;
)