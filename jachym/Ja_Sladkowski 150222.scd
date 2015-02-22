m = JMix(4);
m.gui;
s.plotTree;

(
SynthDef(\pulseA, {|bus, gate = 1, freq, amp, sustain, pulse, xOsc|
	var oscA, oscB, aEnv, fEnv, tone, num;
	aEnv = EnvGen.ar(Env.asr(0.1*sustain,1,0.9*sustain, [-3,3]),gate, doneAction:2);
	num = 4;
	fEnv = Lag.kr(freq, 1.6 * sustain);
	oscA = Mix.fill(num, {|i| Saw.ar(fEnv!2, 0.2,0.8) * LFPulse.ar([35,40], i*0.05, 0.3, 1-pulse, pulse)*1/num});
	oscB = BrownNoise.ar(0.6,0.4) * LFSaw.ar(fEnv!2,0,0.8,0.2);
	tone = SelectX.ar(xOsc, [oscA, oscB]);
	tone = tone * aEnv * amp;
	Out.ar(bus, tone);
}).add;
SynthDef(\pulseB, {|bus, gate = 1, freq, amp, sustain, pulse, xOsc|
	var oscA, oscB, oscC, aEnv, fEnv, tone, num;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain,1,0.9*sustain, [8,3]),gate, doneAction:2);
	num = 20;
	oscA = Mix.fill(num, {|i| SinOsc.ar(freq!2,0.1*i, 0.8,0.2) * LFPulse.ar([8,10], 0, 0.7)*1/num});
	oscB = BrownNoise.ar(0.6,0.4) * LFSaw.ar(freq!2,0,0.8,0.2);
	oscC = SinOsc.ar(freq!2,0,SinOsc.kr(0.0625,0,0.95,0.05));
	tone = SelectX.ar(xOsc, [oscA, oscB, oscC]);
	tone = tone * aEnv * amp;
	Out.ar(bus, tone);
}).add;
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
		24,Pfindur(36,
			Pbind(\instrument, \pulseA, \bus, m.ch(0), \group, m.synG, \amp, 1,
				\dur, 2,
				\legato, 1.3,
				\octave, 6,
				\degree, Pswitch([
					Pseq([3,3,3,6,6,5]),
					Pseq([3,3,3,7,7,4]),
					Pseq([7,4,7,3])
				], Pseq([0,1,0,0,1,2], inf)),
				\pulse, Pn(Pseries(0.1,0.05,8), inf),
				\xOsc, Pwrand([0,1], [0.7,0.3], inf)
			)
		),
		0, Pfindur(54,
			Pmono(\pulseB, \bus, m.ch(1), \group, m.synG, \amp, 1,
				\dur, 1,
				\legato, 0.3,
				\octave, 2,
				\degree, Pswitch([
					Pseq([3,3,3,6,6,5]),
					Pseq([3,3,3,7,7,4]),
					Pseq([7,4,7,3])
				], Pseq([0,1,0,0,1,2], inf)),
				\pulse, Pn(Pseries(0.1,0.05,8), inf),
				\xOsc, Pwrand([0,1,2], [0.8,0.15,0.05], inf)
			)
		),
		6, Pfindur(42,
			Pbind(\instrument, \pulseC, \bus, m.ch(2), \group, m.synG, \amp, 1,
				\dur, Pseq([Pn(0.25,2), Rest(3.5)], inf),
				\legato, 1.3,
				\octave, 3,
				\degree, Pswitch([
					Pseq([3,3,3,6,6,5]),
					Pseq([3,3,3,7,7,4]),
					Pseq([7,4,7,3])
				], Pseq([0,1,0,0,1,2], inf))
			)
		),
		18, Pfindur(42,
			Pbind(\instrument, \pulseC, \bus, m.ch(3), \group, m.synG, \amp, 1,
				\dur, Pseq([Pn(0.25,2), Rest(4.5), Pn(0.125,4), Rest(11.5)], inf),
				\legato, 0.1,
				\octave, 7,
				\degree, Pseq([3,3,3,3b,3b,5], inf)
			)
		)
	],inf)
).play;
)
Pdef(\phase1).stop;