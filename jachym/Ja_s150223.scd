m = JMix(4);
m.gui;
(
SynthDef(\pulseC, {|bus, gate = 1, freq, amp, sustain|
	var osc, aEnv, tone;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain,1,0.7*sustain, [-6,2]),gate, doneAction:2);
	osc = SinOsc.ar(freq!2,0 , 0.8,0.2) * BrownNoise.ar(0.2,0.8);
	tone = osc * aEnv * amp;
	Out.ar(bus, tone);
}).add;
)

(
Pdef(\phase1,
	Ptpar([
		0,Pfindur(12,
			Pbind(\instrument, \pulseA, \bus, m.ch(0), \group, m.synG, \amp, 1,
				\dur, Pseq([Pn(0.125,8), Rest(2)],inf),
				\legato, 0.8,
				\octave, 5,
				\degree, Pswitch([
					Pseq([3,3b]),
					Pseq([3,3,3b,7]),
					Pseq([7,4,7,3])
				], Pseq([0,1,0,2], inf))
			)
		),
		0, Pfindur(16,
			Pmono(\pulseB, \bus, m.ch(1), \group, m.synG, \amp, 1,
				\dur, 6,
				\legato, 0.3,
				\octave, 4,
				\degree, Pswitch([
					Pseq([3,4]),
					Pseq([3,3,3,6,6,4]),
					Pseq([7,4,7,3])
				], Pseq([0,1,2,0,2], inf))
			)
		),
	], inf)
).play;
)
Pdef(\phase1).stop;