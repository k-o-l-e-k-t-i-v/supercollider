b=Server.default;
b.boot

p = ProxySpace.push();


(
~one={
	var mod = [1,1.5];
	var sig = LFSaw.ar(40!2 + LFSaw.ar(1/(1..8).nthPrime).exprange(0.01,1600)*mod) * Pulse.ar(4/(1..8).nthPrime);
	
	sig = SelectX.ar(LFSaw.ar(1/[1,2,3]),[LPF.ar(sig,1900),sig]) * LFPulse.ar(8/(1..8).nthPrime);
	Splay.ar(sig,0,0.1);
};
~one.play;

)
