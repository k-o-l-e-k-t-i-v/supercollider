

(
~xoxxxo.quant=2;
~xoxxxo.play;
~xoxxxo={
	var t,env,t2,env2,sig,fenv,fenv2;
	var tempo = 1/2;
	t = Impulse.ar(tempo,1/4*(0..3));
	t2 = Impulse.ar(tempo,1/4*((0..3)+0.5));

	env = Decay.ar(t,0.75);
	env2 = Decay.ar(t2,0.75);

	fenv = Decay.ar(t,0.05).sqrt.distort;
	fenv2 = Decay.ar(t2,0.32).sqrt.distort;


	sig = SinOsc.ar(50*(fenv+1*2))*env;
	sig = sig + HPF.ar((WhiteNoise.ar(0.4!2) * env2),18000-((fenv2+1)*4000));

	sig = CompanderD.ar(sig,0.95,1/LFSaw.ar(16/[1,2]).range(1,4),1/6);

	Splay.ar(sig,0);

};

)