p=ProxySpace.push(s);

~e.play(numChannels:2, vol:0.2, fadeTime:2).quant_(2);
(~e[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.4,2]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr, \freq.kr*8, \freq.kr], [0.01,0.04]),\trig.tr);

	sig=BPF.ar(GrayNoise.ar([1,0.7,0.5,1]),fenv,fenv/\filter.kr(200));

	sig*env;};)
~e[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~e[2]=\set->Pbind(\args, [\freq], \dur, 2, \freq, Prand([55,85,125,65,45,70,140,85,65],inf));
~e[3]=\set->Pbind(\args, [\filter], \dur, 10, \filter, Pseq([100,500,800,2000,1000],inf));

~e[30]=\filter->{arg in; CombN.ar(in,1,\long.kr([0.02,0.004]),10)};

~e[32]=\filter->{arg in; Limiter.ar(LPF.ar(GVerb.ar(in,180,10,add:in),1000),0.5)};
~e[33]=\filter-> {arg in; in*LFSaw.kr([0.00125,0.0025]).lag(1).range(0,1)};
~e[32]=nil;



~r.play(numChannels:2, vol:0.7, fadeTime:2).quant_(2);
(~r[0]={
	var sig, env,nenv;

	env=EnvGen.kr(Env([0,1,0], [0.04,2]),\trig.tr);
	nenv=EnvGen.kr(Env([0,1,0,0.7,0],[0.04,0.2,1,0.2]),\trig.tr);
	sig=SinOsc.ar([\freq.kr,\freq.kr+4])+GrayNoise.ar(nenv);

	sig*env;};)

~r[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~r[2]=\set->Pbind(\args, [\freq], \dur, 20, \freq, Pseq([[47,45],[65,67],[55,57],[75,77]],inf));

~r[30]=\filter->{arg in; FreeVerb.ar(in,room:0.5,damp:0,add:in)*LFSaw.kr([3,1]).lag(0.2)};
~r[31]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,10,3,0.7),0.5)};