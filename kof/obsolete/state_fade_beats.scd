

(
~fader={
	var sig,t,env,sel,mod;

	mod = Duty.kr([8,4],0,Dseq(1+(1/[1,2,1.5,1,2,1.25,4,0.5]),inf));

	t = Impulse.ar(1/2,(0..3)++[0.5,0.25]/4);

	env = EnvGen.ar(Env([0,1,0],[TExpRand.ar(0.002,0.025,t),TExpRand.ar(0.25,2,t)],[3,-3]),t);

	sig = [
		RLPF.ar(WhiteNoise.ar(TExpRand.ar(0.1,0.6,t)),LFSaw.ar(1/8).range(20,12000)),
		SinOsc.ar(TExpRand.ar(33,55,t)*(env**TExpRand.ar(2,8,t)*mod+1)),
		HPF.ar(PinkNoise.ar(TExpRand.ar(0.1,0.6,t)),LFSaw.ar(1/8).range(200,12000)),
		MoogFF.ar(SinOsc.ar(([1.25,2,1.5,4]/mod*4pi)*[4,8]*(1.00001**(1..8)+1)),SinOsc.ar(1/fib(8)).range(22,12000)),
		MoogFF.ar(LFSaw.ar(([1.25,2,1.5,4]/mod*1.5pi)*[4,8]*(1.001**(1..8)+1)),SinOsc.ar(1/fib(8)).range(12000,22)),
	];

	sel = EnvGen.ar(Env([0,1,2,3.1,4],[TExpRand.ar(0.002,0.025,t),TExpRand.ar(0.2,0.25,t),TExpRand.ar(0.4,1.5,t),TExpRand.ar(0.2,0.4,t)],[8,2,-30]),t);

	sig = SelectX.ar(sel,sig) * env;


	sig = CompanderD.ar(sig,0.75,1/1.5,1/4);

	sig = GVerb.ar(sig)/4+sig/2;

	sig = CompanderD.ar(sig,0.75,1/1.25,1/4);


	Splay.ar(sig,0.1);

};
~fader.play;
)