(
SynthDef(\TickA, { |out = 0, gate = 1, freq = 100, amp = 1, sustain = 1|
	var env, tone;
	env = EnvGen.ar(Env.asr(1/16*sustain, amp, 15/16*sustain),gate,doneAction:2);
	tone = WhiteNoise.ar(Rand(0.4, 0.8),0.2)!2;
	tone = HPF.ar(tone*env, Rand(4000, 16000));
	tone = AllpassC.ar(tone, 1.55, 0.2, 0.5, env, tone);
	Out.ar(out, tone);
}).store;

SynthDef(\TickB, { |out = 0, gate = 1, freq = 1000, amp = 1, sustain = 1|
	var env, tone;
	env = EnvGen.ar(Env.asr(1/16*sustain, amp, 15/16*sustain),gate,doneAction:2);
	tone = LFSaw.ar([freq-0.005, freq+0.005],0,0.2+WhiteNoise.ar(Rand(0.3, 0.8)));
	tone = HPF.ar(tone, Rand(2000, 16000));
	tone = AllpassC.ar(tone, sustain, 0.2, 0.5, env, tone*env);
	Out.ar(out, tone);
}).store;
)

(
Pdef(\testTickA, {
	Pbind(\instrument, \TickA, \amp, 0.2, \legato, 0.1,\degree, Pseq([4,8], inf),
		\dur, Pseq([Pn(0.125,10), Rest(0.25), Pn(0.0625,2), Rest(0.125), 0.25], inf)
		// \dur, 1
	)
}).play(quant:1);
Pdef(\testTickA).fadeTime = 2.0;
)
Pdef(\testTickA).stop;

(
Pdef(\testTickB, {
	Pbind(\instrument, \TickB, \amp, 0.5, \legato, 0.3, \octave, 10, \degree, Pseq([4,4], inf),
		 \dur, Pseq([Pn(0.25,3), Rest(0.25), Pn(0.5,2), Rest(1)], inf)
		// \dur, 0.25
	)
}).play(quant:2);
Pdef(\testTickB).fadeTime = 2.0;
)
Pdef(\testTickB).stop;

(
Pdef(\monoTickB, {
	Pmono(\TickB, \amp, 0.1, \legato, 0.3, \octave, 9,
		\dur, Pseq([Pn(0.125,8), Rest(0.25), Pn(0.125,4), Rest(1.5)], inf),
		\degree, Pseq([4,8], inf)
	)
}).play(quant:1);
)
Pdef(\monoTickB).stop;

//if you make PmonoArtic instead on Pmonp on the last pattern, it sounds...better? anyways, nice stuff *.*