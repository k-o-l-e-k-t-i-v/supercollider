

(
~a.play;
~a.quant = 2;

~mod.quant=2;
~mod.mold(4);
~mod={Duty.kr([4,8,16,32]/4,0,Dseq(powerset([1,1.25,1.5,1.125,2,0.5]).scramble.pyramid.flat,inf))};

~mod2.quant=2;
~mod2.mold(1);
~mod2={Duty.kr(4,0,Dseq([2,1.5,1],inf))};


)

(
~a = {
	var sig,t,env,m;

	t = Impulse.ar(1/16,1/8*[0,1,1.5,2,3,3.5,4,5,6,6.5,7,7.25,7.5]);
	env = Decay.ar(t,2.5);
	sig = SinOsc.ar(43.2 * (env.sqrt*2+1) ) *env;

	t = Impulse.ar(1/8,1/8*([0,1,2,3,4,5,6,7,7.25]+0.5));
	env = Decay.ar(t,0.35);

	sig = RHPF.ar(WhiteNoise.ar(0.4!2) * env,TExpRand.ar(12000,18000,t)-(1+env.sqrt*4000)) + sig;

	t = Impulse.ar(1,1/4*([0,1,2,3]));
	env = Decay.ar(t,1.5);

	m = 43.2*(~mod2*pi)/~mod;
	sig = RLPF.ar(LFSaw.ar(m*(1.0001**(1..11)),mul:0.44*TExpRand.ar(0.5,1,t)) * env,m*(env.sqrt*~mod+1)) + sig;


	sig = CombN.ar(sig,0.05,1,2);
	sig = CompanderD.ar(sig,0.5,1/1.5,1/10);
	sig = FreeVerb.ar(sig,0.1,0.5);

	Splay.ar(sig,0.1);
};
)