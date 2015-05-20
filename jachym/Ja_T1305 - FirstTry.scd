p = ProxySpace.push(s);
s.scope;

(
~drum.rebuild;
~drum[0] = {
	var f = [60,82,84,98];
	var aEnv = EnvGen.kr(Env([0, 1, 0.45, 0],[[0.01,0.05],[0.29,0.27], [1.5, 0.29, 0.35, 1.57]], \welch), \aTrig.tr);
	var fEnv = EnvGen.kr(Env([f, 18000, f*1.4, f], [0.003, 0.011, 0.15], \exp), \fTrig.tr);
	var num = 8;
	var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.05*i,1/num) * BrownNoise.ar(0.3, SinOsc.kr([8, 16.01], 0, 0.7))});
	Splay.ar( osc * aEnv, center:\pan.kr(0));
};
~drum[1] = \set -> Pbind(\args, [\pan], \dur, 1, \pan, Pseq([0.3, -0.3, 0.9, -0.9], inf));

~drum[10] = \filter -> {|in| AllpassC.ar(in,0.06,0.001,4.75) };
~drum[11] = \filter -> {|in|
	var lpfEnv = EnvGen.kr(Env([250, \lpfFreq.kr(2000, 6), 800, 50],[0.03, 0.37, 0.7], \exp), \aTrig.tr);
	LPF.ar(in, lpfEnv)
};
~drum[12] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };

~tone.rebuild;
~tone[0] = {
	var ampEnv = EnvGen.ar(\tone_ampEnv.kr(Env.newClear(8)), \toneTrig.tr);
	var selEnv = EnvGen.ar(\tone_selEnv.kr(Env.newClear(8)), \selTrig.tr);
	var osc = LinSelectX.ar(selEnv,
		[
			SinOsc.ar(13000,0, SinOsc.kr(1/8, 0, 0.03, 0.18), 0.25),
			VarSaw.ar(SinOsc.kr([60,60.1], 0.01, 50, 250),0,0.5, 0.1, SinOsc.kr([2,4], 0, 0.15, 0.19), 0.2),
		]
	);
	Pan2.ar(osc * ampEnv * BrownNoise.ar(0.05,0.95), \panTone.kr(0));
};
~tone[30] = \filter -> {|in| BPF.ar(in, 800, Saw.kr(1/2, 14, 15)) };
~tone[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };

~tone2.rebuild;
~tone2[0] = {
	var aEnv = EnvGen.kr(Env.perc(0.15,3.85), \tone2Trig.tr);
	Pan2.ar( SinOsc.ar(\freq.kr(60,0.15),0,0.7) * LFPulse.ar([35, 40, 8000, 8080],0,0.1, 0.3, 0.7) * aEnv , 0);
};
~tone2[10] = \filter -> {|in| LPF.ar(in, SinOsc.kr(1/4, 0, 1800, 2800)) };
~tone2[11] = \filter -> {|in| CombC.ar(in, 1, 0.125, 4) };
)

(
var drumSeq = Pbind(\type, \set, \args, [\aTrig, \fTrig], \aTrig, 1, \fTrig, 1);
var toneSeq_amp = Pbind(\type, \set, \args, [\tone_ampEnv, \toneTrig], \toneTrig, 1);
var toneSeq_sel = Pbind(\type, \set, \args, [\tone_selEnv, \selTrig], \selTrig, 1);
var tone2_freq = Pbind(\type, \set, \args, [\tone2Trig, \freq], \tone2Trig, 1);

~drum.play(vol:0.9).quant_(1).mold(4);
~tone.play(vol:0.6).quant_(1);
~tone2.play(vol:0.15).quant_(1).mold(4);


Pdfsm([
	Pseq([
		\fadeIn_tone,
		Pseq([\i1,\i2,\i3], 2),
		Pseq([\i3,\i4], 4),
		\i3,
		Pseq([\i5,\i3,\i5,\i3,\i4]),
		Pn(\i3, 2),
		\fadeOut_tone,
		\end
	]).trace(prefix: "phase -> "),
	(
		\fadeIn_tone: [0, Pbindf(toneSeq_amp, \dur, Pn(8, 1), \tone_ampEnv, [Env([0,1], [8], \sin).asArray] )],
		\fadeOut_tone: [0,
			Ppar([
				Pbindf(toneSeq_amp, \dur, Pn(16, 1), \tone_ampEnv, [Env([1,0], [16], \sin).asArray]),
				Pbindf(drumSeq, \dur, Pseq([Pn(0.5, 4), Rest(1), Pn(0.5, 4), Rest(1),1, Rest(7)]), \fTrig, 1),
			])
		],
		\i1: [0, Pbindf(toneSeq_sel, \dur, Pn(8,1), \tone_selEnv, Pn([Env([0.2,0.85],[1.0], \sin).asArray],1) )],
		\i2: [0, Pbindf(toneSeq_sel, \dur, Pn(2,4), \tone_selEnv, Pn([Env([0.85,0.2],[2.0], \exp).asArray],4) )],
		\i3: [0,
			Ppar([
				Pbindf(drumSeq, \dur, Pn(1,8)),
				Pbindf(toneSeq_sel, \dur, Pn(2,4), \tone_selEnv, Pn([Env([0.2,0.65,0.65,0.2],[1.0,0.5,0.25,0.25], \sin).asArray],4)),
			])
		],
		\i4: [0,
			Ppar([
				Pbindf(drumSeq, \dur, Pseq([Pn(0.5,2), Rest(1)], 4), \fTrig, 0),
				Pbindf(toneSeq_sel, \dur, Pn(2,4), \tone_selEnv, Pn([Env([0.2,0.65,0.65,0.2],[0.25,0.75,3], \sin).asArray],4)),
				Pbindf(tone2_freq, \dur, Pseq([Rest(2), Pn(1, 4), Rest(2)]), \octave, 4, \degree, Pseq([\,3,3,3,4,\,\,3,3,3,7,\]))
			])
		],
		\i5: [0,
			Ppar([
				Pbindf(drumSeq, \dur, Pseq([Pn(0.25,2),0.5, Rest(1)], 4), \fTrig, 1),
				Pbindf(toneSeq_sel, \dur, Pn(2,4), \tone_selEnv, Pn([Env([0.2,0.65,0.65,0.2],[0.25,0.75,3], \sin).asArray],4)),
				Pbindf(tone2_freq, \dur, Pseq([Rest(2), 1.5,0.5], 2), \octave, 4, \degree, Pseq([\,3,4,\,7,6]))
			])
		],
		\end: [nil]
	)
],0,1).play;
)

~tone.free; ~drum.free; ~tone2.free;