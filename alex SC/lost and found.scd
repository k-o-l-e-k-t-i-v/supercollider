p=ProxySpace.push(s);


////////////////////////////YES BUM SAW
~dis4.clear;
~dis4.stop(fadeTime:6);
~dis4.play(vol:0.5, fadeTime:2, numChannels:2).quant_(2);
(
~dis4[0]={
	var sig, env, fenv, noise;

	noise=EnvGen.kr(Env([0.01,0.05,0.09,0.01],[0.1,0.02,0.1],curve:\welch),\trig.tr);
	env=EnvGen.kr(Env(times:[0.1,1.4],curve:\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr,\freq.kr+(fib(10)*2)], [0.001, 0.04,0.8] ,curve:\welch),\trig.tr);

	sig=LFSaw.ar(fenv+fib(10)).lag([0.01,0.02,0.03,0.04,0.05]);
	sig=(sig+ClipNoise.ar(noise*0.8))*env;
};
)

~dis4[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pseries(16,-1,8),8,6,Pn(4,4)],inf), \trig, 1);
(~dis4[2]=\set-> Pbind(\args, [\freq], \dur, 3, \octave, Pseq([
	Pseq([[4,5],5,[2,4],[4,3][5,2],[6,2],Prand([[6,5],[7,6]],1)],60),
	Pseq([[4,2],[5,3]],inf)],1),
\degree, [4,6,8]);)

~dis4[29]=\filter-> {arg in; CombN.ar(in,1,0.02)};
~dis4[30]=\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2), [20,40],[8,12,4])};
~dis4[33]=\filter->{arg in; LPF.ar(in,\lpf.kr(900))};
(~dis4[35]=\set->Pbind(\args, [\lpf], \dur, 12, \lpf, Pseq([Pseq([4000,3400,2800,2000,1200],60),
	Pseq([800,900,700],inf)],1);)
);
~dis4[36]=\filter->{arg in; Limiter.ar(in,0.3)};



//////////////////////////////////////DRONE
~n1.clear;
~n1.play(vol:0.02, fadeTime:2, numChannels:2).quant_(2);
(~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[4,2],\welch),\trig.tr);
	sig=LFSaw.ar([\freq.kr(65,0.2),\freq.kr(65,0.2)+fib(7).reciprocal]).lag([0.001,0.002,0.004]);
	sig=sig*env;
};)

~n1[1]=\set->Pbind(\args, [\trig], \dur, Pseq([8,4,2,2],inf), \trig, 1);
~n1[2]=\set->Pbind(\args, [\freq], \dur, Pseq([8,4,2,2],inf),\freq, Pseq([65,35,85,Prand([80,660,240,2200],2)],inf));

~n1[30]=\filter->{arg in; GVerb.ar(in,roomsize:[40,35],revtime:[2,4],mul:0.6,add:in)};

~n1[33]=\filter->{arg in; LPF.ar(in,\lpf.kr(400,2))};
~n1[34]=\set->Pbind(\args, [\lpf], \dur,Pseq([6,4],inf),\lpf, Pseq([600,200,400],inf));

~n1[36]=\filter-> {arg in; Limiter.ar(in,0.1)}



//////////////////////////////////////bum with woosh YES
~r.clear;
~r.stop(fadeTime:60);
~r.play( vol:0.1,numChannels:2, fadeTime:2).quant_(2); //low vol
(~r[0]={
	var sig, env,nenv;

	env=EnvGen.kr(Env([0,1,0], [0.04,1.4]),\trig.tr);
	nenv=EnvGen.kr(Env([0,1,0,0.7,0],[0.04,0.2,1,0.2]),\trig.tr);
	sig=SinOsc.ar([\freq.kr,\freq.kr+4])+GrayNoise.ar(nenv);
	sig*env;};)

~r[1]=\set->Pbind(\args, [\trig], \dur, 24, \trig, 1);
~r[2]=\set->Pbind(\args, [\freq], \dur, 24, \freq, Pseq([[47,45]+20,[65,67]+20,[55,57],[75,77]+120],inf));

~r[30]=\filter->{arg in; FreeVerb.ar(in,room:2,damp:0.7,add:in)*LFSaw.kr([3,1]).lag(0.2)};
~r[31]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,10,[4,6],0.7,mul:0.7,add:in),0.6)};