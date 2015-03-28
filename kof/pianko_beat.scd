

(
~a.play;
~a.quant = 2;

~mod.quant=2;
~mod.mold(4);
~mod={Duty.kr([4,8,16,32]/4,0,Dseq(powerset([1,1.25,1.125,1.5,2,0.5]).scramble.flat.pyramid,inf))};


~md.quant=2;
~md.mold(4);
~md={Duty.kr([4,8,16,32]/2,0,Dseq(powerset([1,1.25,1.125,1.5,2,0.5]).scramble.flat.pyramid,inf))};


~mod2.quant=2;
~mod2.mold(1);
~mod2={Duty.kr(4,0,Dseq(powerset([2,1.5,1]).scramble.flat.pyramid,inf))};


)

(
~a = {
	var sig,t,env,m;

	t = Impulse.ar(1/4,1/8*[0,1,2,3,5,4,6,7,7.25,7.5,7.75]);
	env = Decay.ar(t,1.45);
	sig = SinOsc.ar(50 * (env.sqrt*1.5+1),mul:0.5 ) * env;

	t = Impulse.ar(1/4,1/8*([0,1,2,3,4,5,6,7,7.25,7.5]+0.5));
	env = Decay.ar(t,0.25);

	sig = RHPF.ar(GrayNoise.ar(0.4!2) * env,TExpRand.ar(12000,18000,t)-(1+env.sqrt*4000)) + sig;


	t = Impulse.ar(1,1/4*([0,1,2,3]));
	env = Decay.ar(t,1.5+TExpRand.ar(0.5,(1..4),t));
	m = 43.2*((~mod2)*[0.5pi,1pi,2pi,4pi]/[1,2])/~mod;
	sig = RLPF.ar(LFSaw.ar(m*(1.0001**(1..11))+SinOsc.ar(fib(11)),mul:0.64*TExpRand.ar(0.25,1,t)) * env,m*(env.sqrt+1)) + sig;

	t = Impulse.ar(1/4,1/8*([0,2,4,6]));
	env = Decay.ar(t,3.75+TExpRand.ar(0.5,(1..4),t));
	m = 43.21*((~mod2)*[1pi,0.5pi])/~md;
	sig = RLPF.ar(LFSaw.ar(m*(1.00001**(1..11))+SinOsc.ar(1/fib(11,1,3)),mul:0.84*TExpRand.ar(0.25,1,t)) * env,m*(env.sqrt+1)) + sig;

	sig = Vibrato.ar(sig,[4,5,6,7],0.04);
	sig = CombN.ar(sig,0.025,4,8);
	sig = FreeVerb.ar(sig,0.13,0.5);
	sig = CompanderD.ar(sig,0.85,1/1.5,1/10);

	Splay.ar(sig,0.05,1);
};
)