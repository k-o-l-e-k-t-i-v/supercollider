(
SynthDef(\testSin, {|out = 0, gate = 1, freq = 100, amp = 0.2|
	var osc, env;
	env = EnvGen.kr(Env.adsr(0.05,0.35,amp,1),gate, doneAction:2);
	osc = SinOsc.ar([freq,freq], 0, env);
	Out.ar(out, osc);
}).add;
)

(
Pdef(\test1,
	Pbind(
		\instrument, \testSin,
		\out, ~ch0,
		\dur, Pseq([2],inf),
		\freq, 220,
		\group, ~synthGroup.nodeID
	)
).play(quant:1);
)
Pdef(\test1).stop;
(
Pdef(\test2,
	Pbind(
		\instrument, \testSin,
		\out, ~ch1,
		\dur, Pseq([5],inf),
		\freq, 440,
		\group, ~synthGroup.nodeID
	)
).play(quant:1);
)