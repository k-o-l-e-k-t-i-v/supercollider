


(
~a = {

	var sig;
	sig = Pluck.ar(
		LFSaw.ar(43.2*(1.00001**(1..8))*(Pulse.ar(4)*0.5+1)),Impulse.ar(6/[1,2]),0.01+TExpRand.ar(0.0001,0.1,Impulse.ar(1/2)).lag(1),0.01+TExpRand.ar(0.0001,0.05,Impulse.ar(1/4)).round(0.0025),0.55);

	sig = LPF.ar(sig,4000) + Resonz.ar(WhiteNoise.ar(0.75),LFSaw.ar(1/4/[1,2]).exprange([440.01,880],1.01));
	sig = sig + (SinOsc.ar(4320*[2,8,0.25,1.5,0.5],mul:0.5) * Decay.ar(Impulse.ar(1/16,[1,2,4,8].normalize),2));
	sig = sig + (SinOsc.ar(43.2 * 3,mul:0.5)* Decay.ar(Impulse.ar(1),1));
	sig = CompanderD.ar(sig,0.9,1,0.1);
	sig = FreeVerb.ar(sig,0.133,200);
	sig = Limiter.ar(sig,1);
	Splay.ar(sig,0.1);
};
~a.play;
)


// cool ^^