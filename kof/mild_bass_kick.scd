(
~human={
	var sig,env,fenv,tenv,imp,mod1,mod2;
	mod1 = Duty.kr(4,0,Dseq([1,1,2,1,4,2,4],inf)).lag(1/10);
	mod2 = Duty.kr(4,0,Dseq([1,1.5,1.25,1.125,2,4],inf)).lag(1/10);
	imp = Impulse.ar(1/4,(0..7)++[0.5,0.25]/8);
	imp = TDelay.ar(imp,TExpRand.ar(0.001,0.125,imp));
	env = EnvGen.ar(Env.perc(0.01,2),imp);
	fenv = EnvGen.ar(Env.perc(0.0005,0.025,LFDNoise1.ar(1/[7,8,3,2]).exprange(150.01,350)),imp);
	tenv = EnvGen.ar(Env.perc(0.5,0.0025),imp);

	sig = SinOsc.ar([50,75,50,100]+fenv) * env + (LFSaw.ar(43.2*(mod1*0.5pi)) + SinOsc.ar(4320/(mod2*pi)) * tenv / 8) / 2;
	sig = Vibrato.ar(sig,[4,5,6,7]/4,0.2);
	sig = Limiter.ar(sig.softclip.distort,1,0.01);
	sig = BPF.ar(sig,LFDNoise1.ar(1/4/[7,8,3,2]).exprange(150.01,15000)) + LPF.ar(sig,150);
	sig = CompanderD.ar(sig,0.75,1/2,1/2);

	Splay.ar(sig.flat,0);

};
~human.quant=2;
~human.fadeTime=2;
~human.play;
)