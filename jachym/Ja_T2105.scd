p = ProxySpace.push(s);
s.scope;

(
var gNode = Group.new();
var gRec = Group.new(gNode,\addAfter);

~drum.group = gNode;
~drum[0] = {
	var f = [60,82,84,98];
	var aEnv = EnvGen.kr(Env([0, 1, 0.45, 0],[[0.01,0.05],[0.29,0.27], [1.5, 0.29, 0.35, 1.57]], \welch), \drumTrig.tr);
	var fEnv = EnvGen.kr(Env([f, 18000, f*1.4, f], [0.003, 0.011, 0.15], \exp), \drumTrig.tr);
	var num = 8;
	var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.05*i,1/num) * BrownNoise.ar(0.3, SinOsc.kr([8, 16.01], 0, 0.7))});
	Splay.ar( osc * aEnv, 0);
};
~drum[1] = \filter -> {|in|
	var lpfEnv = EnvGen.kr(Env([250, \lpfFreq.kr(4000, 6), 800, 50],[0.03, 0.37, 1.2], \exp), \drumTrig.tr);
	LPF.ar(in, lpfEnv)
};
~drum[10] = \filter -> {|in| AllpassC.ar(in,0.06,0.001,4.75) };
~drum[12] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };

~drumTail.group = gNode;
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

~tone.group = gNode;
~tone[0] = {
	var volEnv = EnvGen.ar(\tone_volEnv.kr(Env.newClear(8)), \tone_volTrig.tr);
	var panEnv = EnvGen.kr(Env([0.3,-0.3,0.7,-0.7,0.3],[0.5,1.5],\sin), \masterTrig.tr);
	Pan2.ar(SinOsc.ar(\tone_freq.kr(70)) * volEnv, panEnv);
};

~signal.group = gNode;
~signal[0] = {
	var aEnv = Select.kr(\signal_id_aEnv.kr(0),
		[
			EnvGen.kr(Env([0,0.95,0], [0.24,0.01], [\welch, \step]), \signalTrig.tr),
			EnvGen.kr(Env([0,0.95,0], [0.05,0.2], [\lin,\welch]), \signalTrig.tr),
		]
	);
	Pan2.ar(SinOsc.ar(\signal_freq.kr(2000),mul:BrownNoise.kr(0.95)) * aEnv,0);
};
~signal[10] = \filter -> {|in| CombC.ar(in, 1,0.5,4) };

~noise.group = gNode;
~noise[0] = {
	var aEnv = EnvGen.kr(Env.perc(0.05,0.15), \noiseTrig.tr);
	Pan2.ar( WhiteNoise.ar(0.8) * Saw.ar(8,0.8,0.2) * aEnv);
};
~noise[10] = \filter -> {|in| HPF.ar(in,1800) };
~noise[11] = \filter -> {|in| FreeVerb.ar(in,0.5,0.2,0.25,1,in) };

~saw4.group = gNode;
~saw4[0] = {
	var aEnv = EnvGen.kr(Env.perc(3.5,0.5), \sawTrig.tr);
	var num = 80;
	var osc = Mix.fill(num, {|i|
		LFSaw.ar(\sawFreq.kr(150,4), mul: Saw.ar(1/2,0.9,0.1)) *
		LFPulse.ar(32*i,0.05,0.3,0.8,0.2) *
		GrayNoise.ar(\sawNoise.kr(0.25,4),0.05)
	});
	Pan2.ar(osc * aEnv,Saw.kr(1,0.5));
};
~saw4[10] = \filter -> {|in| OnePole.ar(in,0.9) };
~saw4[11] = \filter -> {|in| LPF.ar(in,\sawLPF.kr(800,4)) };
~saw4[12] = \set -> Pbind(\type, \set, \args, [\sawLPF],
	\dur, 4,
	\sawLPF, Pstutter(Pseq([6,4,4,2], inf), Pseq([800,1400,1000,1800], inf))
);
~saw4[30] = \filter -> {|in| Limiter.ar(in,0.95) };

~limiter.group = gRec;
~limiter[0] = \filter -> {|in| Limiter.ar(in,0.95,0.05) };

~drum.play(vol:0.95).quant_(4).mold(4);
~drumTail.play(vol:0.7).quant_(4);
~tone.play(vol:0.35).quant_(4);
~signal.play(vol:0.32).quant_(4);
~noise.play(vol:0.8).quant_(4);
~saw4.play(vol:0.8).quant_(4);
~limiter.play;
)

(
var masterSeq = Pbind(\type, \set, \args, [\masterTrig], \masterTrig, 1);
var drumSeq = Pbind(\type, \set, \args, [\drumTrig], \drumTrig, 1);
var tailSeq = Pbind(\type, \set, \args, [\tailTrig, \tail_id_aEnv, \tailFreq], \tailTrig, 1);
var signalSeq = Pbind(\type, \set, \args, [\signalTrig, \signal_id_aEnv, \signal_freq], \signalTrig, 1);
var tone_volSeq = Pbind(\type, \set, \args, [\tone_volTrig, \tone_volEnv], \tone_volTrig, 1);
var noiseSeq = Pbind(\type, \set, \args, [\noiseTrig], \noiseTrig, 1);
var sawSeq = Pbind(\type, \set, \args, [\sawTrig, \sawFreq, \sawNoise], \sawTrig, 1);

Pdef(\track, Pdfsm([
	Pseq([
		//intro
		\fadeIn_tone,
		Pseq([ \i1, Pseq([\i1,\i2],2), Pn(\i1,2), \i4, \i1, Pseq([\i2,\i3],2), \i5]),

		//phase1
		Pseq([ Pseq([\p1, \p2, \p1, \p3],4), \p4]),

		//mezzo1
		Pseq([ \i1, Pseq([\i2,\i3],2), \i4, \i3, \i6]),

		//phase2
		Pseq([ Pseq([ Pseq([ Pseq([\p1, \p2, \p1, \p3],2), \p4], 2 ), \p6], 2 ), \p5]),

		//intro
		Pseq([ Pseq([\i2,\i3],2), \i1]),
		\fadeOut_tone,
		\end
	]).trace(prefix: "phase -> "),
	(
		//intro
		\fadeIn_tone: [0,
			Ppar([
				Pbindf(masterSeq, \dur, Pseq([Rest(2),Pn(4,2)])),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,2),0.5,1,1, Rest(7)]), \signal_id_aEnv, 0),
				Pbindf(tone_volSeq, \dur, Pseq([Rest(2),Pn(8, 1)]), \tone_volEnv, [Env([0,0.01,1], [1,7], [\lin,\exp]).asArray] ),
				Pbindf(tailSeq, \dur, Pseq([Rest(2),Pn(8,1)]), \tail_id_aEnv, 3),
			])
		],
		\i1: [0,Pbindf(masterSeq, \dur, Pn(4,1))],
		\i2: [0,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(signalSeq, \dur, Pn(4,1), \signal_id_aEnv, 0),
			])
		],
		\i3: [0,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.2,2), Rest(3.6)]), \signal_id_aEnv, 1),
			])
		],
		\i4: [0,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,2)),
				Pbindf(signalSeq, \dur, Pn(4,2), \signal_id_aEnv, 0),
				Pbindf(tailSeq, \dur, Pn(8,1), \tail_id_aEnv, 3),
			])
		],
		\i5: [1,Pbindf(signalSeq, \dur, Pn(1,4), \signal_id_aEnv, 0)],
		\i6: [2,
			Ppar([
				Pbindf(signalSeq, \dur, Pseq([2,2,Pn(1,4)]), \signal_id_aEnv, 0),
				Pbindf(sawSeq, \dur, Pseq([Rest(4),Pn(4,1)]), \sawFreq, 400),
			])
		],
		\fadeOut_tone:[0,
			Ppar([
				Pbindf(tone_volSeq, \dur, Pn(8, 1), \tone_volEnv, [Env([1,0], [8], [\lin]).asArray] ),
				Pbindf(tailSeq, \dur, Pn(8,1), \tail_id_aEnv, 3),
			])
		],
		\end:[nil]
	),
	(
		//phase1
		\p1: [1,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(4,1)),
				Pbindf(tailSeq, \dur, Pn(4,1),\tail_id_aEnv, 0),
			])
		],

		\p2: [1,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(4,1)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 1),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,2),Rest(3.5)]), \signal_id_aEnv, 0, \signal_freq, Pseq([2000,800], inf)),
			])
		],

		\p3: [1,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pseq([Pn(0.25,2), Rest(3.5)])),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 2),
			])
		],
		\p4:[0,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(2,2)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 2),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,4),Rest(3)]), \signal_id_aEnv, 0, \signal_freq, Pseq([2000,400,800], inf)),
			])
		],
	),
	(
		//phase2
		\p1: [2,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(0.5,8)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 0),
				Pbindf(noiseSeq, \dur, Pseq([Rest(1.5),Pn(0.25,2)],2)),
				Pbindf(sawSeq, \dur, Pn(4,1), \sawFreq, 800),
			])
		],

		\p2: [2,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(0.5,8)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 1),
				Pbindf(sawSeq, \dur, Pn(4,1), \sawFreq, 1700),

			])
		],

		\p3: [2,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(0.5,8)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 0),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,8),Rest(2)]), \signal_id_aEnv, 0, \signal_freq, Pseq([400,200], inf)),
				Pbindf(sawSeq, \dur, Pn(4,1), \sawFreq, 1850),
			])
		],

		\p4:[2,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(0.5,8)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 2),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,4),Rest(3)]), \signal_id_aEnv, 0, \signal_freq, Pseq([600,400,200], inf)),
				Pbindf(noiseSeq, \dur, Pseq([Rest(1.5),Pn(0.25,2)],2)),
			])
		],
		\p5:[0,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,1)),
				Pbindf(drumSeq, \dur, Pn(0.5,8)),
				Pbindf(tailSeq, \dur, Pn(4,1), \tail_id_aEnv, 2),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,4),Rest(3)]), \signal_id_aEnv, 0, \signal_freq, Pseq([600,400,200], inf)),
				Pbindf(noiseSeq, \dur, Pseq([Rest(1.5),Pn(0.25,2)],2)),
			])
		],
		\p6:[2,
			Ppar([
				Pbindf(masterSeq, \dur, Pn(4,2)),
				Pbindf(drumSeq, \dur, Pn(0.5,16)),
				Pbindf(signalSeq, \dur, Pseq([Pn(0.25,4),Rest(3)],2), \signal_id_aEnv, 0, \signal_freq, Pseq([1600,400,200], inf)),
				Pbindf(noiseSeq, \dur, Pseq([Rest(1.5),Pn(0.25,2)],2)),
				Pbindf(sawSeq, \dur, Pn(4,2), \sawNoise, 0.6)
			])
		],
	)
],0,1)).trace.play;
)

~drum.free; ~drumTail.free; ~tone.free; ~signal.free; ~noise.free; ~saw4.free;