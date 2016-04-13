


(
~q={
	var f,sig;
	f=(LFSaw.ar(500.01) @ LFSaw.ar(1/100/(1..12),mul:1)).rho - 0.5;
	sig = LFPulse.ar(f.linlin(-1,1,33.5,2200.5/(1..32))) * LFTri.ar(1/4*(fib(12))).range(1,0);
	sig = BBandPass.ar(sig,LFNoise0.ar(1/fib(12)).exprange(44.01,4000).lag(1*fib(12)),0.2,5);
	sig = Resonz.ar(sig,LFNoise0.ar(4/fib(12)).exprange(44.01,4000).lag(1/4*fib(12)),0.2,4);
	sig = FreeVerb.ar(sig,0.33,0.5);

	Splay.ar(sig,0.1,0.8);
};
~q.play;
)

s.scope;