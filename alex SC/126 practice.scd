AutoIDE.run;
p=ProxySpace.push(s);


//drone
~n1.play(vol:0.7, fadeTime:2, numChannels:2).quant_(2);
(~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[4,2],\welch),\trig.tr);
	sig=LFSaw.ar([\freq.kr(65,0.2),\freq.kr(65,0.2)+fib(7).reciprocal]).lag([0.001,0.002,0.004]);
	sig=sig*env;
};)

~n1[1]=\set->Pbind(\args, [\trig], \dur, 6, \trig, 1);
~n1[2]=\set->Pbind(\args, [\freq], \dur, Pseq([4,2,6],inf),\freq, Pseq([65,35,85,Prand([80,660,1440,1220],2)],inf));

~n1[30]=\filter->{arg in; GVerb.ar(in,roomsize:[40,35],revtime:[10,15])};

~n1[33]=\filter->{arg in; LPF.ar(in,\lpf.kr(400,2))};
~n1[34]=\set->Pbind(\args, [\lpf], \dur,6, \lpf, Pseq([200,666,400],inf));

~n1[36]=\filter-> {arg in; Limiter.ar(in,0.9)}

//bum

~n2.stop(fadeTime:24);
~n2.play(vol:0.1, fadeTime:12, numChannels:2).quant_(2);
(~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[0.01,0.19],\welch),\trig.tr);
	var fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(5),\freq.kr*2],[0.01,0.04,0.04],\welch),\trig.tr);

	sig=SinOsc.ar(fenv+fib(4).reciprocal,add:BrownNoise.ar([0.001,0.02]));
	sig=sig*env;
});

~n2[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);
~n2[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([35],inf));

~n2[32]=\filter->{arg in; CombN.ar(in,2,0.5,2)};
~n2[30]=\filter->{arg in; GVerb.ar(in,roomsize:[60,40],revtime:[0.7,0.9],damping:0.1)};
~n2[36]=\filter-> {arg in; Limiter.ar(in,0.9)};

~n2[37]=\filter->{arg in; HPF.ar(in,\hpf.kr(6,2))};