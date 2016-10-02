

////////////////////////////hmmmmm
~dis4.stop;
~dis4.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);
(
~dis4[0]={
	var sig, env, fenv, noise;

	noise=EnvGen.kr(Env([0.01,0.05,0.04,0.01],[0.1,0.02,0.1],curve:\welch),\trig.tr);
	env=EnvGen.kr(Env(times:[0.01,1.5],curve:\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr,\freq.kr+(fib(10)*2)], [0.001, 0.04,0.8] ,curve:\welch),\trig.tr);

	sig=LFSaw.ar(fenv+fib(10)).lag([0.01,0.02,0.03,0.04,0.05]);
	sig=(sig+ClipNoise.ar(noise*0.4))*env;
};
)

~dis4[1]=\set-> Pbind(\args, [\trig], \dur, 3, \trig, 1);
~dis4[2]=\set-> Pbind(\args, [\freq], \dur, 3, \octave, Pseq([[4,8],5,[6,4],[6,5],[7,6]],inf), \degree, [2,4,6,8]);

~dis4[29]=\filter-> {arg in; CombN.ar(in,1,0.02)};
~dis4[30]=\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2), [20,40],[8,12,4])};




////////////////////ping ping
~dis7.stop;
~dis7.play(vol:0.1, fadeTime:8, numChannels:2).quant_(8);
(
~dis7[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[1,8],curve:\welch),\trig.tr);
	sig=SinOsc.ar(\freq.kr(220)+fib(10))*Decay.kr(Impulse.kr(1/[0.5,0.25,0.75,2,5,8]),[0.2,0.1]);
	sig=sig*env;
};
)

~dis7[1]=\set-> Pbind(\args, [\trig], \dur,8, \trig, 1);
~dis7[2]=\set-> Pbind(\args, [\freq], \dur, 1, \octave, Pseq([[4,5],[4,6],[8,3],Prand([[5,7],[2,3]],1)],inf), \degree, [2,4,6,8]);
~dis7[30]=\filter->{arg in; CombN.ar(in,2,0.2,1)};
~dis7[31]=\filter->{arg in; GVerb.ar(in,[200,180],[10,12])};

~dis7[31]=nil;





///////////////////////////////weird saw random

~w.clear;
~w.play(vol:0.9, fadeTime:12);
(~w[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[0.4,2]),\trig.tr);
	sig=LFSaw.ar(\freq.kr+[1,2,3,5,8,13,21].reciprocal,(0..2pi)).lag(0.02,0.01)*env;
};

)

~w[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~w[2]=\set->Pbind(\args, [\freq], \dur, 12, \octave, Prand([3,2,3,2,4,2,5],inf), \degree, [2,4,6]);

~w[30]=\filter-> {arg in; CombN.ar(in,4,0.05,9)};
~w[31]=\filter->{arg in; Limiter.ar(LPF.ar(in, \lpf.kr(1400)),0.4)};
~w[32]=\filter-> {arg in; GVerb.ar(in.range(-0.3,0.3),10)};



//////////////////////////////////////bum with woosh


~r.play(numChannels:2, vol:0.7, fadeTime:2).quant_(2);
(~r[0]={
	var sig, env,nenv;

	env=EnvGen.kr(Env([0,1,0], [0.04,2]),\trig.tr);
	nenv=EnvGen.kr(Env([0,1,0,0.7,0],[0.04,0.2,1,0.2]),\trig.tr);
	sig=SinOsc.ar([\freq.kr,\freq.kr+4])+GrayNoise.ar(nenv);

	sig*env;};)

~r[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~r[2]=\set->Pbind(\args, [\freq], \dur, 20, \freq, Pseq([[47,45],[65,67],[55,57],[75,77]+120],inf));

~r[30]=\filter->{arg in; FreeVerb.ar(in,room:0.5,damp:0,add:in)*LFSaw.kr([3,1]).lag(0.2)};
~r[31]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,10,0.3,0.7),0.5)};

