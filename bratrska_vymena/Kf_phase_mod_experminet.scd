s.boot;

(
Ndef(\atm,{Splay.ar(
	FreeVerb.ar(
		in:(SinOsc.ar(1/16/[2,4,8,16],LFSaw.ar([55.001,55]).range(-pi,pi)) * LFSaw.ar(4/[1,2,3,5,8,13],mul:1.5)),
		mix:(SinOsc.ar(2.1/[2,4,8,16],LFSaw.ar(1/2/[11.0001,11.0]).range(-pi,pi)) * LFSaw.ar(2/[2,4,8,16])).range(0.1,0.9),
		room:(SinOsc.ar(4.1/[2,4,8,16],LFSaw.ar(1/2/[22.0001,22.0]).range(-pi,pi)) * LFSaw.ar(4/[2,4,8,16])).range(0.01,0.5)
	).distort

)}).play;
)