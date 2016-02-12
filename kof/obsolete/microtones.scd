(
Ndef(\a,{
	Splay.ar(
		Limiter.ar(CombN.ar(Pulse.ar((1.0001**(1..8))*10) * LFSaw.ar(1/8/(1..32)).range(0,1),
			1/80,1/70,10) ,1) / 2  ,0.3,1) }).play;
)
