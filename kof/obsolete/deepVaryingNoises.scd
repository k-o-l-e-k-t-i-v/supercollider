
(
~barrel={
	var sig2;
	var sig = PinkNoise.ar(0.1!4);
	var t = Impulse.ar(1/4,(0..3)/4);
	var times = TExpRand.ar(1.01,8,t);
	var slopes = TExpRand.kr(0.33,2,t);
	var freq = TExpRand.kr(20.01,12000,t);


	var env1 = EnvGen.ar(Env([20000,freq,4],[1.2,1.2]*times,[3,-3]*slopes),t);
	var env2 = EnvGen.ar(Env([0.01,1,0.001],[1.2,1.2]*times,[3,-3]*slopes),t);
	var env3 = EnvGen.ar(Env([0,1,0],[1.2,1.2]*times,[3,-3]*slopes),t);


	sig = BBandPass.ar(sig,env1,env2,env3);

	sig2 = DynKlank.ar(`[Array.fill(12,{TExpRand.ar(55.01,140,t).round(44/pi).lag(1/8)}),nil,Array.fill(4,{TExpRand.ar(1.001,4,t)})],sig/20.0);
	sig2 = Limiter.ar(sig2,0.75);

	sig2 = GVerb.ar(sig2)/5+sig/2;
	sig2 = HPF.ar(sig2,55);
	sig2 = LPF.ar(sig2,4000);
	sig2 = CompanderD.ar(sig2,0.5,1/1.5,1/2)/2;

	Splay.ar(sig2,0.1);
};
~barrel.play;
)