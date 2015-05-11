p = ProxySpace.push(s);
s.scope;
~tone.play(fadeTime:4, vol:0.6).quant_(8);
(
~tone[0] = { LinSelectX.ar(
	EnvGen.ar(Env.linen(0.125, 2.75,3,curve:\sin), \selTrig.tr), [
		SinOsc.ar(13000,0, SinOsc.kr(1/8, 0, 0.03, 0.18), 0.25),
		SinOsc.ar(SinOsc.kr(60, 0.01, 50, 250),0, 0.1, SinOsc.kr([2,4.1], 0, 0.15, 0.19), 0.2),
	]);
};
~tone[1] = \set -> Pbind(\args, [\selTrig], \dur, 8, \selTrig, 1);
~tone[30] = \filter -> {|in| BPF.ar(in, 800, Saw.kr(1/2, 14, 15)) };
)
~tone.end(8);

~drum.play(fadeTime:8, vol:0.9).quant_(8);
~drum.mold(4);
(
~drum[0] = {
	var f = \freq.kr([80,82,84,88]);
	var aEnv = EnvGen.kr(Env([0, 1, 0],[[0.01,0.05], [1.99, 1.49, 1, 0.5]], \welch), \aTrig.tr);
	var fEnv = EnvGen.kr(Env([f, 18000, f*1.2, f], [0.003, 0.008, 0.15], \exp), \fTrig.tr);
	Pan2.ar( Mix.fill(4, {|i| SinOsc.ar(fEnv,0.05*i,1/4) * BrownNoise.ar(0.2, SinOsc.kr([16, 16.01], 0, 0.8))}) * aEnv, \pan.kr(0));
};
~drum[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1,
	\dur, Pswitch([
		Pn(2,2),
		Pseq([1,1,2]),
		Pseq([0.5,0.5,1,2]),
	], Pseq([0,1,0,2], inf))
);
~drum[2] = \set -> Pbind(\args, [\freq], \dur, 1, \octave, 2, \degree, Pseq(#[[1,1b,2,2b], [2,2b,3,3b]], inf));
~drum[3] = \set -> Pbind(\args, [\fTrig], \fTrig, 1,
	\dur, Pswitch([
		Pseq([Pn(0.125, 2), 0.75]),
		Pseq([Pn(0.0625, 4), 0.75]),
		Rest(8),
	], Pn(Pseq([Pn(0,3),1],8) ++ 2, inf))
);
~drum[30] = \filter -> {|in| AllpassC.ar(in,0.02,0.005,0.05) };
~drum[32] = \filter -> {|in| LPF.ar(in, \lpfFreq.kr(1800, 6)) };
~drum[33] = \set -> Pbind(\args, [\lpfFreq], \dur, 8, \lpfFreq, Pseq([800,1800], inf));
)
~drum.end(16);

~circSaw.play(fadeTime:2, vol:0.3).quant_(8);
(
~circSaw[0] = {
	var aEnv = EnvGen.ar(Env.perc(0.49, 0.01, curve:[8,-4]), \aTrig.tr);
	Pan2.ar(WhiteNoise.ar(0.35, 0.65) * LFPulse.ar(\freq.kr(60, 2),0,0.2,0.7,0.3) * aEnv, \pan.kr(0,0.125));
};
~circSaw[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([1,1,Rest(14)], inf));
~circSaw[2] = \set -> Pbind(\args, [\freq], \freq, Pseq([600, 680], inf), \dur, 8);
~circSaw[32] = \filter -> {|in| GVerb.ar(in, 30, 8, 0.1)};
)
~circSaw.end(8);

