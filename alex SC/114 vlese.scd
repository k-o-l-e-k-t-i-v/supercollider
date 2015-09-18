p=ProxySpace.push(s);


~h.play(vol:1, fadeTime:4);
~h.scope(2);
~h.clear;
~h.mold(1);
(
~h[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.2],[\step, \step]),\trig.tr);
	sig=LFPulse.ar([15,17])*GrayNoise.ar(0.7);
	sig=LPF.ar(sig,\freq.kr(13000,0.5));
	sig=sig*env;
};
)
~h[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);
~h[2]=\set->Pbind(\args, [\freq], \dur, 1, \freq, 4000);


~h[30]=\filter-> {arg in; CombN.ar(in,4,\del.kr(0.5),2)};
~h[31]=\filter-> {arg in; GVerb.ar(in,roomsize:20,revtime:2)};
~h.free(fadeTime:1);


~f.play(vol:2, fadeTime:1);
~f.scope;
~f.clear;
(
~f[0]={
	var sig, env,fenv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.4],[\step, \step]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr],[0.04,0.1],[\step, \step]),\trig.tr);

	sig=SinOsc.ar([fenv, fenv+4],add:GrayNoise.ar(1)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.2));
	sig=sig*env;
};
)
~f[1]=\set->Pbind(\args, [\trig], \dur, 2, \trig, 1);
~f[2]=\set->Pbind(\args, [\freq], \dur, 4, \freq, Pseq([200,150],inf));


~f[29]=\filter-> {arg in; Limiter.ar( LPF.ar(in,\lpf.kr(15000)),1)};
~f[30]=\filter-> {arg in; CombN.ar(in,4,\del.kr(0.25),2)};

~f[31]=\filter-> {arg in; GVerb.ar(in,roomsize:120,revtime:4)};
~f[31].free;


currentEnvironment.free;

~g.play(vol:0.1, fadeTime:1);
~g.scope;
~g.clear;
~g.(mold: 2);
(
~g[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[0.5,2],[\step, \step]),\trig.tr);
	sig=LPF.ar(LFSaw.ar(\freq.kr!4+[1,2,3,5,8].reciprocal).lag(\lag.kr(0.001)),\freq.kr);
	sig=sig*env;
};
)
~g[1]=\set->Pbind(\args, [\trig], \dur, 6, \trig, 1);
~g[2]=\set->Pbind(\args, [\freq], \dur, 12, \freq, Pseq([500,14700,15500,16500,14700],inf));

// ~g[30]=\filter-> {arg in; CombN.ar(in,6,\del.kr(0.5),4)};

~g[30]=\filter-> {arg in; LPF.ar(in,\lpf.kr(100)),1)};
~g[31]=\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:4)};
~g.free(fadeTime:1);
