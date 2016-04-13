

(
~xoxxxo.quant=2;
~xoxxxo.play;
~xoxxxo={
	var t,env,t2,env2,sig,fenv,fenv2;
	var tempo = 1/2;
	t = Impulse.ar(tempo/2,1/8*((0..7)++[7.25,7.5]+LFNoise0.ar(1!4,0.0025)));
	t2 = Impulse.ar(tempo,1/4*((0..3)+0.5+LFNoise0.ar(1!4,0.0025)));

	env = Decay.ar(t,0.5);
	env2 = Decay.ar(t2,0.9);

	fenv = Decay.ar(t,0.002+LFNoise0.ar(1,0.002)).sqrt.distort;
	fenv2 = Decay.ar(t2,0.32).sqrt.distort;


	sig = SinOsc.ar(48*(fenv+1*2))*env;
	sig = sig + HPF.ar((WhiteNoise.ar(0.4!2) * env2),12000/((fenv2+1)));


	sig = CompanderD.ar(sig,0.95,1/LFSaw.ar(2/[1,2]).range(1.5,0.1),1/2)*2;


	Splay.ar(sig,0);

};

)