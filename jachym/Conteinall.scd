ProxySpace.push(s);

~tone.play(vol:0.8);
~tone.quant = 8;
~tone.mold(6);
// ~tone.fadeTime = 2;
~tone.monitor.fadeTime = 8;
(
~tone[0] = {
	var aEnv = EnvGen.kr(Env.perc(2.75,1.25), \mytrig.tr);
	var osc = Saw.kr([440,880, 1660, 3200, 6400], LFSaw.kr(SinOsc.kr(40, 0,10,35),0,0.4), 0.2) * BrownNoise.ar(0.25, 0.75);
	Pan2.ar(aEnv * osc,0);
};
~tone[1] = \set -> Pbind(\mytrig, 1, \dur, 8);// Pseq([8,8,4,2,2], inf));
~tone[10] = \filter -> {|in| LPF.ar(in, 2600)};
~tone[11] = \filter -> {|in| CombC.ar(in,0.5,0.25, 0.5)};
// ~tone[12] = \filter -> {|in| GVerb.ar(in,18, 0.23)};
~tone[13] = \filter -> {|in| Limiter.ar(in,0.95)};
);
~tone.stop(8);
~tone.scope;

~tone2.play(vol:0.5).quant_(1);
~tone2.fadeTime = 8;
~tone2.monitor.fadeTime = 4;
(
~tone2[0] = {
	var selEnv = Select.kr(\tone_selEnv.kr(0),
		[
			EnvGen.ar(Env([0.2,0.65,0.65,0.2],[1.0,0.5,0.25,0.25], \sin), \selTrig.tr),
			EnvGen.ar(Env([0.2,0.65,0.65,0.2],[0.25,0.75,3], \sin), \selTrig.tr)
		]
	);

	var osc = LinSelectX.ar(selEnv,
		[
			Saw.ar(10002,SinOsc.kr(1/8, 0, 0.13, 0.58), 0.25),
			VarSaw.ar(SinOsc.kr([1600,1600.1], 0.01, 50, 250),0,0.5, 0.1, SinOsc.kr([8,4], 0, 0.15, 0.59), 0.4),
		]
	);
	Pan2.ar(osc * BrownNoise.ar(0.05,0.95), \panTone.kr(0));
};
~tone2[30] = \filter -> {|in| BPF.ar(in, 800, Saw.kr(1/2, 14, 15)) };
~tone2[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)

(
Pdef(\tone2, Pbind(\type, \set, \args, [\tone_selEnv, \selTrig, \toneTrig],
	\dur, 2,
	\toneTrig, 1,
	\selTrig, Pseq([1,1,0], inf)
)).play;
)
Pdef(\tone).stop;

~tone2.stop(18);
~tone2.free;

~tone3.play(vol:0.1);
~tone3.monitor.fadeTime = 6;
(
~tone3[0] = { Pan2.ar(SinOsc.ar(6000, Saw.kr(4, 0.5, 0.5)), \panTone2.kr(0, 2)) };
~tone3[1] = \set -> Pbind(\panTone2, Pseq([0.9,-0.9], inf), \dur, 2);
~tone3[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)
~tone3.stop(8);

s.scope;
