m = JMix(6);
m.gui;

(
SynthDef(\PulseA, { |bus, gate, amp, freq, sustain|
	var oscA, oscB, aEnv, tone;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1, 0.7*sustain), gate, doneAction:2);
	oscA = SinOsc.ar(freq!2, 0, 1) * LFPulse.ar(freq!2, 0, 0.5, 0.2, 0.8);
	tone = oscA * aEnv * amp;
	Out.ar(bus, tone);
}).add;
)
// Saw.kr([35,40],0.5,0.5)

(
Pdef(\phase26,
	Pbind(\instrument, \PulseA, \bus, m.ch(0), \group, m.synG, \amp, 1,
		\dur, 4,
		\legato, Pseq([1.2,0.8], inf),
		\octave, 5,
		\degree, 1
	)
).play(quant:2);
)

/*
Pswitch(
	[
		Pseq([3,3,3,7]),
		Pseq([3,3,3,7])
	], Pseq([0,1], inf)
)
*/