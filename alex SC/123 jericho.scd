Kolektiv(\alex);
Kolektiv.free;
currentEnvironment.clear;

(
~basic[0]={
	var sig, fenv;
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr,\freq.kr],[0.01,0.04]),\trig.tr);
	LFSaw.ar(fenv*[1,3,5,8].reciprocal).lag([0.01,0.02])};
)



~new1.stop;
~new1.play(vol:0.4, fadeTime:2).quant_(2);
~new1.clock=TempoClock(128/60).permanent_(true);

(
~new1[0]={
	var env;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.1]),\trig.tr);
	~basic[0]*env;}
)
~new1[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Pn(0.3,3), Rest(1)],inf), \trig, 1);
~new1[2]=\set->Pbind(\args, [\freq], \dur, 6, \freq, Pseq([65,85,45,55,95,120],inf));
~new1[3]=\set->Pbind(\args, [\top], \dur, 6, \top, 4);

~new1[30]=\filter->{arg in; GVerb.ar(in,[40,20,10], [3,5,2],add:in)};
~new1[31]=\filter->{arg in; LPF.ar(in, \lpf.kr(400))};
~new1[33]=\set->Pbind(\args, [\lpf], \dur, 6, \lpf, Pbind([100,200,800],inf));




~new2.stop;
~new2.play(vol:0.1, fadeTime:2).quant_(2);
~new2.clock=TempoClock(128/60).permanent_(true);

(
~new2[0]={
	var env;
	env=EnvGen.kr(Env([0,1,0],[0.1,8]),\trig.tr);
	~basic[0]*env;}
)
~new2[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~new2[2]=\set->Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[4,3],[2,4],[5,1]],inf),\degree, [4,2,6]);
);
~new2[3]=\set->Pbind(\args, [\top], \dur, 6, \top, 1);

~new2[30]=\filter->{arg in; GVerb.ar(in,[60,80,40], [10,15,12],add:in)};
~new2[31]=\filter->{arg in; LPF.ar(in, \lpf.kr(4400))};
// ~new2[33]=\set->Pbind(\args, [\lpf], \dur, 6, \lpf, 400);


~new3.stop;
~new3.play(vol:0.1, fadeTime:20).quant_(2);
~new3.clock=TempoClock(128/60).permanent_(true);

(
~new3[0]={
	var env;
	env=EnvGen.kr(Env([0,1,0],[0.1,0.8]),\trig.tr);
	(~basic[0]+LFSaw.kr(1,add:GrayNoise.ar(0.4)))*env;}
)
~new3[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Pn(1,2),Rest(2)],inf), \trig, 1);
~new3[2]=\set->Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[3,2], [2,3]],inf),\degree, [4,2,6]);
);
~new3[3]=\set->Pbind(\args, [\top], \dur, 6, \top, 8);

~new3[30]=\filter->{arg in; GVerb.ar(in,[60,80,40], [10,5,3],add:in)};
~new3[31]=\filter->{arg in; LPF.ar(in, \lpf.kr(200))};
~new3[33]=\set->Pbind(\args, [\lpf], \dur, 6, \lpf, 1400);

/////////////////////////////////


~beat1.stop;
~beat1.play(vol:0.4, fadeTime:2).quant_(2);
// ~beat1.clock=TempoClock(128/60).permanent_(true);

(
~beat1[0]={
	var sig,env,fenv;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.1]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],[0.01,0.04]),\trig.tr);

	sig=LFSaw.ar(fenv+[1,3,5,8],add:GrayNoise.ar(0.1)).lag([0.01,0.02]);

	sig*env;}
)
~beat1[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Pn(0.25,2), Rest(1),Pn(0.25,2),Rest(1)],inf), \trig, 1);
~beat1[2]=\set->Pbind(\args, [\freq], \dur, 6, \freq, Pseq([45,35],inf));

~beat1[30]=\filter->{arg in; GVerb.ar(in,[40,20,10], [0.3,0.5,2],add:in)};
~beat1[31]=\filter->{arg in; LPF.ar(in, \lpf.kr(200))};





~beat2.stop;
~beat2.play(vol:0.1, fadeTime:2).quant_(2);
// ~beat1.clock=TempoClock(128/60).permanent_(true);

(
~beat2[0]={
	var sig,env,fenv;
	env=EnvGen.kr(Env([0,1,0],[0.01,2]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*2,\freq.kr],[0.05,1]),\trig.tr);

	sig=LFSaw.ar(fenv!2)*BrownNoise.ar(1);

	sig*env;}
)
~beat2[1]=\set->Pbind(\args, [\trig], \dur, Pseq([ Rest(1),3],inf), \trig, 1);
~beat2[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([1,2],inf));

~beat2[30]=\filter->{arg in; GVerb.ar(in,[40,20], [3,2])};
~beat2[30]=nil;
~beat2[31]=\filter->{arg in; Limiter.ar(LPF.ar(in, \lpf.kr(400)),0.2)};





~beat3.stop;
~beat3.play(vol:0.1, fadeTime:2).quant_(2);
// ~beat1.clock=TempoClock(128/60).permanent_(true);

(
~beat3[0]={
	var sig,env,fenv;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.1]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*2,\freq.kr],[0.01,0.04]),\trig.tr);

	sig=SinOsc.ar(fenv!2);

	sig*env;}
)
~beat3[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Rest(3.2),Pn(0.2,4)],inf), \trig, 1);
~beat3[2]=\set->Pbind(\args, [\freq], \dur, 0.2, \octave,Prand([Pseq([4,5,3,[4,2],4],2),Pseq([4,5,8,[4,2],4],2)],inf),\degree,[2,4,8]);

~beat3[30]=\filter->{arg in; GVerb.ar(in,[40,20,10], [3,5,2],add:in*0.2,mul:0.7)};
~beat3[31]=\filter->{arg in; LPF.ar(in, \lpf.kr(200))};






































