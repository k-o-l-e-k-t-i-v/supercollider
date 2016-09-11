AutoIDE.run;

currentEnvironment.free;


~d1.stop;
~d1.play(vol:0.7, fadeTime:2, numChannels:2).quant_(2);
~d1.clock=TempoClock(120/60).permanent_(true);
(~d1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[0.01,0.4],\welch),\trig.tr);
	var fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(1.2),\freq.kr],[0.01,0.04],\welch),\trig.tr);

	sig=BPF.ar(AudioIn.ar([1]),fenv,mul:2)*env*0.5;

});

~d1[1]=\set->Pbind(\args, [\trig], \dur, Pseq([1, Rest(1)],inf), \trig, 1);
~d1[2]=\set->Pbind(\args, [\freq], \dur,1, \octave, Pseq([[4,6],[5,7],[8,2]],inf),\degree, [4,6,2]);

~d1[30]=\filter->{arg in; GVerb.ar(in,roomsize:[40,20],revtime:[2,])};
~d1[33]=\filter->{arg in; Limiter.ar(in,0.4)};


///////

~n1.stop;
~n1.play(vol:1, fadeTime:2, numChannels:2).quant_(2);
~n1.clock=TempoClock(120/60).permanent_(true);
(~n1[0]={
	var sig;

	var env=EnvGen.kr(Env([0,1,0],[0.01,0.4],\welch),\trig.tr);
	var fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);
	sig=LFPulse.ar(fenv+fib(8).reciprocal)+ClipNoise.ar([0.01,0.02]);
	sig=sig*env;
});

~n1[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);
~n1[2]=\set->Pbind(\args, [\freq], \dur,1, \octave, Pseq([[4,2],[5,3],[2,6]],inf),\degree, [4,6,2]);
~n1[30]=\filter->{arg in; GVerb.ar(in,roomsize:[10,20])};

~n1[33]=\filter-> {arg in; Limiter.ar(in,0.7)};

//////////////

~n2.stop(fadeTime:26);
~n2.play(vol:0.8, fadeTime:2, numChannels:2).quant_(2);
~n2.clock=TempoClock(120/60).permanent_(true);
(~n2[0]={
	var sig;

	var env=EnvGen.kr(Env([0,1,0],[0.01,0.4],\welch),\trig.tr);
	var fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(6),\freq.kr],[0.01,0.04],\welch),\trig.tr);

	sig=SinOsc.ar(fenv+fib(8).reciprocal)+ClipNoise.ar([0.05,0.02]);
	sig=sig*env;
});

~n2[1]=\set->Pbind(\args, [\trig], \dur,4, \trig, 1);
~n2[2]=\set->Pbind(\args, [\freq], \dur,1, \octave, Pseq([[3,4],[2,3]],inf),\degree, [8,6,2]);
~n2[30]=\filter->{arg in; GVerb.ar(in,roomsize:[40,20])};

~n2[33]=\filter-> {arg in; Limiter.ar(in,0.9)};

////////////




~n3.stop(fadeTime:16);
~n3.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);
~n3.clock=TempoClock(120/60).permanent_(true);
(~n3[0]={
	var sig;

	var env=EnvGen.kr(Env([0,1,0],[0.01,0.05],\welch),\trig.tr);
	sig=HPF.ar(ClipNoise.ar([0.5,0.2,0.7,0.8,0.6]),\freq.kr(14000,0.2));
	sig=sig*env;
});

~n3[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Pn(0.2,3),Rest(0.2),Pn(0.2,2), Rest(1),Pn(0.2,4),Rest(1)],inf), \trig, 1);
~n3[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([14000,11000,9000,500],inf));
~n3[30]=\filter->{arg in; GVerb.ar(in,roomsize:[30,20],revtime:[1,2])};

~n3[33]=\filter-> {arg in; Limiter.ar(in,0.1)};

~n3.set(\freq, 12000);





//////////////////////


~n4.stop(fadeTime:16);
~n4.play(vol:0.8, fadeTime:2, numChannels:2).quant_(2);
~n4.clock=TempoClock(60/60).permanent_(true);
(~n4[0]={
	var sig;

	var env=EnvGen.kr(Env([0,1,0],[2,0.01],\welch),\trig.tr);
	var fenv=EnvGen.kr(Env([\f2.kr,\f2.kr*\top.kr(2),\f2.kr],[5,0.01],\welch),\trig.tr);
	sig=HPF.ar(GrayNoise.ar([0.5,0.2,0.7]),\freq.kr(14000,0.2))*LFSaw.ar(fenv);
	sig=sig*env;
});

~n4[1]=\set->Pbind(\args, [\trig], \dur,4, \trig, 1);
~n4[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([9000,15000],inf));
~n4[3]=\set->Pbind(\args, [\f2], \dur,4, \f2, Pseq([10,12],inf));

~n4[30]=\filter->{arg in; GVerb.ar(in,roomsize:[40,60],revtime:[8,6])};

~n4[33]=\filter-> {arg in; Limiter.ar(in,0.5)};

~n4.set(\freq, 12000);




















