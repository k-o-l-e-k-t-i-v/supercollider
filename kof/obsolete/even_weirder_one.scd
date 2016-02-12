
(
Ndef(\a,{
	var sig;
	sig = Pulse.ar([1,2,4,8]) ;
	sig = CombN.ar(sig,1/80,1/70+(1/80*LFSaw.ar(1/8/[1,2,4,8]).lag(0.1)),32);
	sig = Limiter.ar(sig,1,0.5);
	sig = sig * LFPulse.ar(8/fib(12));
	sig = Resonz.ar(sig,43.2*[1,2,4,8,16,32,32*1.5,64,64*1.5],1,4);
	sig = sig * Decay.ar(Impulse.ar(4/fib(12)),[1,2,4,6,8,10,20].normalize.reverse*2);
	sig = FreeVerb.ar(sig,0.1,10);

	Splay.ar(
		sig
		,0.1,1,0.5)
}).play;
)

s.scope

