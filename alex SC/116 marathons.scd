Kolektiv(\alex);
Kolektiv.print;
(octave: [4,1],strum:1,dur:4,degree:[4,6], sustain:2, amp:1).play;
p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(60/60);

~q.scope;
~q.play(vol:0.2, fadeTime:2).quant_(1);
(~q[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\step, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\freq.kr,\freq.kr*\top.kr(4),\freq.kr],times:[0.01,0.04],curve:[\step, \welch]),\trig.tr);

	sig=LFPulse.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.1)).lag([0.001,0.2,0.02,0.002,0.03])*env;
};
)
~q[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);
~q[2]=\set->Pbind(\args, [\freq], \dur, 4, \freq, Pseq([Pseries(85,-2,8),45],inf));

~q[30]=\filter-> {arg in; GVerb.ar(in,20,3,mul:0.2,add:in)};

~q[31]=\filter-> {arg in; LPF.ar(in,\lpf.kr(1800))};

~q.clear;


~r.scope;
~r.play(vol:1, fadeTime:2).quant_(1);
(~r[0]={
	var sig, env;

	env=EnvGen.kr(Env(times:[0.4,4],curve:[\step, \welch]),\trig.tr);
	sig=BPF.ar(PinkNoise.ar(1)+GrayNoise.ar(1).clip(0.2,0.8),
		freq:\freq.kr!2,
		rq:LFNoise2.kr(20).range(0.0001,0.1));
	sig=sig*env;
});
~r[1]=\set->Pbind(\args, [\trig], \dur, 3, \trig, 1);
~r[2]=\set->Pbind(\args, [\freq], \dur, 4, \octave, Prand([[2,3],[4,9],[3,5]],inf),\degree, [4,6,2]);

~r[30]=\filter-> {arg in; GVerb.ar(in,10,5,mul:0.2,add:in*0.4)};
~r[31]=\filter-> {arg in; LPF.ar(in,1400)};


~r.clear;



~v.scope;
~v.play(vol:0.1, fadeTime:2).quant_(3);
(~v[0]={
	var sig, env;

	env=EnvGen.kr(Env(times:[0.4,4],curve:[\step, \welch]),\trig.tr);
	sig=LFSaw.ar(\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2]);
	sig=sig*env;
});
~v[1]=\set->Pbind(\args, [\trig], \dur, 3, \trig, 1);
~v[2]=\set->Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[2,3],[4,3,2],[4,2],[3,2],[3,2,5]],inf),\degree, [4,6,2]);

~v[30]=\filter-> {arg in; GVerb.ar(in,40,15,mul:0.4,add:in*0.1)};
~v[31]=\filter-> {arg in; LPF.ar(in,400,add:in*0.2)};


~v.clear;



~d.scope;
~d.play(vol:0.04, fadeTime:2).quant_(3);
(~d[0]={
	var sig, env;

	env=EnvGen.kr(Env(times:[0.4,8],curve:[\step, \welch]),\trig.tr);
	sig=LFSaw.ar(\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,5,2,0.5].reciprocal);
	sig=sig*env;
});
~d[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~d[2]=\set->Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\degree, [3,4,2]);

~d[30]=\filter-> {arg in; GVerb.ar(in,[20,34],15,mul:0.23,add:in*0.1)};
~d[31]=\filter-> {arg in; LPF.ar(in,5700,add:in*0.4)};


~d.clear;




~a.scope;
~a.play(vol:0.7, fadeTime:2).quant_(3);
(~a[0]={
	var sig, env;

	env=EnvGen.kr(Env(times:[0.01,0.1],curve:[\step, \step]),\trig.tr);
	sig=HPF.ar(WhiteNoise.ar(1)+GrayNoise.ar(1),\freq.kr(14000));
	sig=sig*env;
});
~a[1]=\set->Pbind(\args, [\trig], \dur, 2, \trig, 1);
~a[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([14000,7000,9000,12000],inf));

~a[29]=\filter-> {arg in; CombN.ar(in,2,\del.kr(0.25),2)};
~a[29]=\set->Pbind(\args, [\del], \dur, Pseq([4,1,2],inf), \del, Pseq([0.5,0.25,0.5],inf));
~a[30]=\filter-> {arg in; GVerb.ar(in,20,10,mul:0.2,add:in)};
~a[31]=\filter-> {arg in; LPF.ar(in,4000,add:in*0.2)};


~a.clear;