AutoIDE.run;
p.makeTempoClock;

~tempo=120/60;

~n1.clear;
~n1.play(vol:0.01, fadeTime:2, numChannels:2).quant_(2);
(~n1[0]={
	var sig, env, fenv, f2env;

	env=EnvGen.kr(Env(times:[0.01,3]),\trig.tr);
    fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);
	f2env=EnvGen.kr(Env([\f2.kr,\f2.kr*4,\f2.kr],[0.01,3],\welch),\trig.tr);

	sig=LFSaw.ar(fenv,add:GrayNoise.ar(0.5))*LFSaw.kr(f2env);
	sig=sig*env;

};)

~n1[1]=\set->Pbind(\args, [\trig], \dur, 8, \trig, 1);
~n1[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([Pn(45,4),Pn(85,4)],inf));
~n1[3]=\set->Pbind(\args, [\f2], \dur,1, \f2,2);

~n1[30]=\filter->{arg in; GVerb.ar(in,roomsize:[40,60],revtime:[1,2])};
~n1[33]=\filter->{arg in; LPF.ar(in,Line.kr(200,2500,60))};



~n2.play(vol:0.051, fadeTime:2, numChannels:2).quant_(2);
(~n2[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.1]),\trig.tr,gate:\trig.tr);
	// fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);
	sig=SinOsc.ar(\freq.kr+fib(10)+fib(10).reciprocal);
	sig=sig*env;

};)

~n2[1]=\set->Pbind(\args, [\trig], \dur, 0.1, \trig, 1);
~n2[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([Pn(12000,2),Pn(8500,2),800,9000,600,1200,4000],inf));
~n2[32]=\filter->{arg in; CombN.ar(in,4,[0.75,1],20)*SinOsc.kr(0.125).range(0.01,0.5)};





~n3.play(vol:0.6, fadeTime:2, numChannels:2).quant_(2);
(~n3[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[4,2]),\trig.tr,gate:\trig.tr);
	sig=BPF.ar(WhiteNoise.ar(1!2),LFNoise1.kr(2).range(\freq.kr,\freq.kr+165),LFNoise2.kr(20).range(0.01,2));
	sig=sig*env;

};)

~n3[1]=\set->Pbind(\args, [\trig], \dur, Prand([4,2,6],inf), \trig, 1);
~n3[2]=\set->Pbind(\args, [\freq], \dur,6, \freq, Pseq([220,600,120,40,600,1200],inf));
~n3[32]=\filter->{arg in;GVerb.ar(in,2,[10,15])};
~n3[33]=\filter->{arg in; LPF.ar(in,Line.kr(200,1200,60))};





~n4.clear;
~n4.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);
(~n4[0]=
{
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.1]),\trig.tr);
    fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);

	sig=LFSaw.ar(fenv!2)+GrayNoise.ar([0.2,0.3]);
	sig=sig*env;

};)
(
~n4[1]=\set->Pbind(\args, [\trig],
	\dur,Pseq([Pn(0.1,5),Rest(1.5)],inf), \trig, 1);
)
~n4[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([85,65],inf));
~n4[30]=\filter->{arg in; GVerb.ar(in,roomsize:[10,20],revtime:[0.2,0.3],mul:0.2)};
~n4[33]=\filter->{arg in; LPF.ar(in,Line.kr(600,1500,360))};





~n5.play(vol:0.1, fadeTime:2, numChannels:2).quant_(2);
(~n5[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.1]),\trig.tr,gate:\trig.tr);
	// fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);
	sig=LFSaw.ar(\freq.kr+fib(10)+fib(10).reciprocal).lag(0.02);
	sig=sig*env;

};)

~n5[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~n5[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([200,9000,600,1200,4000],inf));
~n5[32]=\filter->{arg in; CombN.ar(in,8,[0.2,0.5],40)*SinOsc.kr(0.125).range(0.1,0.2)};
~n5[30]=\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:10)};
