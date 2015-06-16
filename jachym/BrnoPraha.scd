ProxySpace.push(s);

(
~drum.play(vol:0.8).quant_(4);
~drum.monitor.fadeTime = 16;
~drum[0] = {
	var f = [100,152,12400,148];
	var aEnv = EnvGen.kr(Env([0, 1, 0.45, 0],[[0.01,0.05],[0.29,0.27], [0.5, 0.29, 0.35, 1.57]], \welch), \aTrig.tr);
	var fEnv = EnvGen.kr(Env([f, 18000, f*1.4, f], [0.003, 0.011, 0.15], \exp), \fTrig.tr);
	var num = 12;
	var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.05*i,1/num) * BrownNoise.ar(0.3, SinOsc.kr([8, 16.01], 0, 0.7))});
	Pan2.ar(osc * aEnv,\pan.kr(0,2));
};
~drum[1] = \set -> Pbind(\args, [\pan], \dur, 0.25, \pan, Pseq([0.3, -0.3, 0.9, -0.9], inf));

~drum[10] = \filter -> {|in| AllpassC.ar(in,0.06,0.001,4.75) };
~drum[11] = \filter -> {|in|
	var lpfEnv = EnvGen.kr(Env([250, \lpfFreq.kr(80, 16), 800, 50],[0.03, 0.37, 0.7], \exp), \aTrig.tr);
	LPF.ar(in, lpfEnv)
};
~drum[12] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)
~drum.set(\lpfFreq, 12660);
~drum.stop(20);
~drum.free;

(
~drumTail.play(vol:0.6).quant_(4);
~drumTail[0] = {
	var aEnv = Select.kr(\tail_id_aEnv.kr(0),
		[
			EnvGen.kr(Env([0.001,0.8,1,0.001], [1,2.7,0.3], [\welch, \lin, \step]), \tailTrig.tr),
			EnvGen.kr(Env([0.001,0.75,0.3,1,0.001], [2.7,0.3,0.8,0.2], [\exp, \step, \exp, \sin]), \tailTrig.tr),
			EnvGen.kr(Env(
				[0,0.7,0,1,0,1,0,1,0,1,0],
				[1.75,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.05,0.45],
				\step
			), \masterTrig.tr),
			EnvGen.kr(Env([0,1,0], [2,6], [\welch, \sin]), \tailTrig.tr)
		]
	);
	var selEnv = EnvGen.ar(Env([0.001,1,0.001], [3.99,0.01], [\exp,\step]), \tailTrig.tr);
	var osc = SelectX.ar(selEnv,
		[
			SinOsc.ar(\tailFreq.kr(400),0,0.15),
			WhiteNoise.ar(0.8,0.2) * LFSaw.ar(\tailFreq.kr(400)*12,0.1,0.9)
		]
	);
	Pan2.ar( osc * aEnv, 0);
};
~drumTail[10] = \filter -> {|in| GVerb.ar(in,10,1.5,earlyreflevel:0.2,taillevel:0.9) };
// ~drumTail[11] = \filter -> {|in| LPF.ar(in,10,1.5,earlyreflevel:0.2,taillevel:0.9) };
)
~drumTail.free;
~drumTail.set(\tailTrig, 1);

~tone.play(vol:0.3).quant_(1);
~tone.fadeTime = 2;
~tone.monitor.fadeTime = 4;
(
~tone[0] = {
	var selEnv = Select.kr(\tone_selEnv.kr(0),
		[
			EnvGen.ar(Env([0.2,0.65,0.65,0.2],[1.0,0.5,0.25,0.25], \sin), \selTrig.tr),
			EnvGen.ar(Env([0.2,0.65,0.65,0.2],[0.25,0.75,3], \sin), \selTrig.tr)
		]
	);

	var osc = LinSelectX.ar(selEnv,
		[
			Saw.ar(200,SinOsc.kr(1/8, 0, 0.13, 0.58), 0.25),
			VarSaw.ar(SinOsc.kr([1600,1600.1], 0.01, 50, 250),0,0.5, 0.1, SinOsc.kr([2,4], 0, 0.15, 0.59), 0.4),
		]
	);
	Pan2.ar(osc * BrownNoise.ar(0.05,0.95), \panTone.kr(0));
};
~tone[30] = \filter -> {|in| BPF.ar(in, 800, Saw.kr(1/2, 14, 15)) };
~tone[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)
~tone.stop(18);
~tone.free;

~tone2.play(vol:0.1);
~tone2.monitor.fadeTime = 6;
(
~tone2[0] = { Pan2.ar(SinOsc.ar(6000, Saw.kr(4, 0.5, 0.5)), \panTone2.kr(0, 2)) };
~tone2[1] = \set -> Pbind(\panTone2, Pseq([0.9,-0.9], inf), \dur, 2);
~tone[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)
~tone2.stop(8);
(
Pdef(\drumA, Pbind(\type, \set, \args, [\aTrig, \fTrig],
	\aTrig, 1,
	\fTrig, Pseq([1,1,0,0], inf),
	// \dur, Pseq([Pn(0.25,7),0.5,3.75], inf)
	\dur, 1, //Pseq([Pn(0.25,4),Rest(6)], inf)
)).play;
)
Pdef(\drumA).stop;
(
Pdef(\drumT, Pbind(\type, \set, \args, [\tailTrig, \tail_id_aEnv, \tailFreq],
	\tailTrig, 1,
	\dur, Pn(2,4), //Pseq([Pn(4,4)]),
	\tail_id_aEnv, Pseq([0,1,0,2], inf)
)).play;
)
Pdef(\drumTail).stop;

(
Pdef(\tone, Pbind(\type, \set, \args, [\tone_selEnv, \selTrig, \toneTrig],
	\dur, 2,
	\toneTrig, 1,
	\selTrig, Pseq([1,1,0], inf)
)).play;
)
Pdef(\tone).stop;


s.scope;
