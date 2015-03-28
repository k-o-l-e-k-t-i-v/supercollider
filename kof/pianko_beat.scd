

(
~a.play;
~a.quant = 2;

~mod.quant=2;
~mod.mold(4);
~mod={Duty.kr([4,8,16,32]/4,0,Dseq(powerset([1,1.25,1.125,1.5,2,0.5]).scramble.pyramid.flat,inf))};


~md.quant=2;
~md.mold(4);
~md={Duty.kr([4,8,16,32]/8,0,Dseq(powerset([1,1.25,1.125,1.5,2,0.5]).scramble.pyramid.flat,inf))};


~mod2.quant=2;
~mod2.mold(1);
~mod2={Duty.kr(4,0,Dseq([2,1.5,1],inf))};


)

(
~a = {
	var sig,t,env,m;

	t = Impulse.ar(1/8,1/8*[0,1,2,3,5,4,6,7,7.25]);
	env = Decay.ar(t,1.45);
	sig = SinOsc.ar(50 * (env.sqrt*2+1) ) *env;

	t = Impulse.ar(1/8,1/8*([0,1,2,3,4,5,6,7,7.25]+0.5));
	env = Decay.ar(t,0.5);

	sig = RHPF.ar(WhiteNoise.ar(0.4!2) * env,TExpRand.ar(12000,18000,t)-(1+env.sqrt*4000)) + sig;


	t = Impulse.ar(1,1/4*([0,1,2,3]));
	env = Decay.ar(t,2.5+TExpRand.ar(0.5,(1..4),t));
	m = 43.2*((~mod2)*[0.5pi,1pi,2pi])/~mod;
	sig = RLPF.ar(LFSaw.ar(m*(1.0001**(1..11))+SinOsc.ar(fib(11)),mul:0.64*TExpRand.ar(0.65,1,t)) * env,m*(env.sqrt+1)) + sig;


	sig = sig + (SinOsc.ar(m*(1.001**(1..11)),mul:0.4) * LFSaw.ar(1/fib(12)).range(1,0));


	t = Impulse.ar(1/2,1/4*([0,1,2,3]));
	env = Decay.ar(t,2.5+TExpRand.ar(0.5,(1..4),t));
	m = 43.2*((~mod2)*0.5pi)/~mod;
	sig = RLPF.ar(LFSaw.ar(m*(1.00001**(1..11))+SinOsc.ar(1/fib(11,1,3)),mul:0.54*TExpRand.ar(0.65,1,t)) * env,m*(env.sqrt+1)) + sig;


	sig = CombN.ar(sig,0.25,4,4);
	sig = FreeVerb.ar(sig,0.3,1.5);
	sig = CompanderD.ar(sig,0.85,1/1.5,1/10);
    sig = FreeVerb.ar(sig,0.13,0.5);

	Splay.ar(sig,0.1);
};
)