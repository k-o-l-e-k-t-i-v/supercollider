ProxySpace.push(s);

~tone.play(vol:0.2);
~tone.monitor.fadeTime_(8);
~tone[0] = { Pan2.ar(Saw.ar( Saw.kr(1/4,10,700)) * WhiteNoise.ar(0.6,0.4), SinOsc.kr(1/8,0,0.5) ); };
~tone.scope;
~tone.stop(8);

~drum.play(vol:0.7).quant_(2);
~drum.monitor.fadeTime_(8);
(
~drum[0] = {
	var aEnv = EnvGen.kr(Env.perc(0.05,0.95),\drumTrig.tr);
	var fEnv = EnvGen.kr(Env.perc(0.01,0.09),\drumTrig.tr,18000,levelBias:\freq.kr(80),timeScale:0.5);
	var noiseOsc = SinOsc.kr(1/8,mul:\mulNoiseOsc.kr(0.2,2),add:0.5);
	var osc = LFSaw.ar(fEnv) * BrownNoise.ar(noiseOsc,1-noiseOsc);
	Pan2.ar(osc * aEnv,\pan.kr(0,0.5));
};
~drum[1] = \filter -> {|in|
	var lpfEnv = EnvGen.kr(Env.perc(0.05,0.45),\drumTrig.tr, 12000, \lpfBaseFreq.kr(800,2), 0.5);
	LPF.ar(in, lpfEnv);
};
~drum[10] = \set -> Pbind(\args, [\drumTrig], \drumTrig, 1, \dur, Pseq([Pn(0.5,7), 0.25,0.25, Pn(0.125,16)], inf));
~drum[11] = \set -> Pbind(\args, [\freq],
	\octave, Pseq([Pn([1,3],3), #[2,3,6]], inf),
	\degree, Pseq([3,3,7,3,4], inf),
	\strum, 0.35,
	\dur, 4
);
~drum[12] = \set -> Pbind(\args, [\pan], \pan, Pseq([0.7,-0.7], inf), \dur, 0.5);
~drum[13] = \set -> Pbind(\args, [\lpfBaseFreq], \lpfBaseFreq, Pseq([800,1800,400,4000], inf), \dur, 8).trace;
~drum[14] = \set -> Pbind(\args, [\mulNoiseOsc], \mulNoiseOsc, Pseq([0.2,0.4], inf), \dur, 16);

~drum[30] = \filter -> {|in| OnePole.ar(in,0.9,4)};
~drum[31] = \filter -> {|in| FreeVerb.ar(in,0.4, 0.7)};
~drum[32] = \filter -> {|in| CombC.ar(in,0.25,0.0625,0.5)};
~drum[33] = \filter -> {|in| CompanderD.ar(in,0.7)};
~drum[34] = \filter -> {|in| Limiter.ar(in,0.95)};
)
~drum.removeAt(31);
~drum.stop(8);
~drum.scope;

