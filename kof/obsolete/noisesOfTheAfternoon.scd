(
~a.quant=2;
~a={
	var sig,env,env2,env3,t,nois,noisEnv;

	t = Mix.ar(Impulse.ar(1/8,(0..3)/4));
	t = TDelay.ar(t,(1..30)*0.0125);//TExpRand.ar(0.0125,0.0125,t));

	nois = DynKlank.ar(`[[116,257,397,631,771,2641,2922,3553],nil,[1,1,0.2,0.2,0.2,1,1,0.7]],PinkNoise.ar(0.014!2),1);
	nois = Normalizer.ar(nois,0.8) + PinkNoise.ar(0.1!2);
	noisEnv = EnvGen.ar(Env.new([0,1,0],[0.0001,0.66],[3,-3]),t);

	nois = nois * noisEnv;

	sig = DynKlank.ar(`[[116,257,397,631,771,2641,2922,3553]],t) * 0.1 + LFSaw.ar([44]) + nois;

	env = EnvGen.ar(Env.new([18000,90,1800],[0.04,0.082],[-1,1]),t);
	env2 = EnvGen.ar(Env.new([0.85,0.858,0.0042],[0.028,2]),t);
	env3 = EnvGen.ar(Env.new([0,1,0.015,0.1],[0.00028,0.58,0.5]),t);

	sig = CombN.ar(sig,env2,env2,32);
	sig = LPF.ar(sig,18000);

	sig = CompanderD.ar(sig,0.9,1/1.25,1/10);
	sig = FreeVerb.ar(sig,0.153,10.5);
	sig = BPF.ar(sig,env,0.8) * env3;

	Splay.ar(sig,0.1);
};
~a.play;
)

(
~b.quant=2;
~b={

	var sig,fenv,t,nois,nois2,noisEnv;

	t = Mix.ar(Impulse.ar(1/8,(0..3)/4));
	t = TDelay.ar(t,(1..30)*0.0125);

	nois = DynKlank.ar(`[[116,257,397,631,771,2641,2922,3553],nil,[1,1,0.2,0.2,0.2,1,1,0.7]],PinkNoise.ar(0.014!2),1,0,0.06) +
	LFSaw.ar(44!2,mul:0.4);

	nois = nois + DynKlank.ar(`[[116,257,397,631,771,2641,2922,3553],nil,[1,1,0.2,0.2,0.2,1,1,0.7]],PinkNoise.ar(0.014!2),1,0,0.08);
	// nois = Normalizer.ar(nois,0.4);
	noisEnv = EnvGen.ar(Env.new([0,1,0.001],[0.0001,1.16],[1,-5]),t);
	nois = nois * noisEnv;


	nois2 = WhiteNoise.ar(0.4!2);
	noisEnv = EnvGen.ar(Env.new([0,1,0],[0.01,0.0156],[3,-3]),t);

	fenv = EnvGen.ar(Env.new([12000,100,400],[0.01,0.136],[1,-3]),t);
	nois2 = GVerb.ar(nois2,2,0.7,0.1,drylevel:0.01,taillevel:6);
	nois2 = BPF.ar(nois2,fenv,0.15);
	nois2 = CompanderD.ar(nois2,0.5,1/1.5,1/10);

	nois = nois2 * noisEnv + nois;


	Splay.ar(nois,0.1);

};
~b.play;
)