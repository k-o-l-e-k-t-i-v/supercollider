s.scope(2);
(
SynthDef(\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp);
	tone = osc * aEnv;
	tone = AllpassC.ar(tone,0.5,0.0625,sustain/2, 1);
	tone = LPF.ar(tone,fEnv + 300);
	Out.ar(out, tone);
}).store;
)


(
Pdef(\testSawA, {
		Pbind(\instrument, \SawA, \amp, 1, \legato, 0.9, \octave, 2, \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
		// \dur, Pseq([Pn(5,2),3.5,0.5], inf)
		\dur, 0.5
	)
	}).play(quant:1);
Pdef(\testDrumA).fadeTime = 1.0;
)
Pdef(\testDrumA).stop;

(
Pdef(\seqSawA, {
	Ppar([
		Pbind(\instrument, \SawA, \amp, 0.7, \legato, 1.5, \octave, 1, \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\dur, Pseq([2],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.4, \legato, 0.9, \octave, 2, \degree, Pseq([1,Pn(4,63),1],inf),
			\dur, Pseq([0.25],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.3, \legato, 0.3, \octave, 2, \degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\seqSawA).fadeTime = 4.0;
)
Pdef(\seqSawA).stop;

(
Pdef(\testSawB, {
	Pbind(\instrument, \SawA, \amp, 1, \octave, 2,
		\legato, Pseq([Pn(1.0,12),1], inf),
		\degree, Pseq([Pn(4,11),2,1], inf),
		\dur, Pseq([Pn(0.25,12), Rest(0.25)], inf)
		// \dur, 0.25
	)
}).play(quant:1);
Pdef(\testSawB).fadeTime = 1.0;
)
Pdef(\testSawB).stop;

(
Pdef(\testSawC, {
	Pbind(\instrument, \DrumC, \amp, 1,
		\octave, Pseq([2,2,2,3], inf),
		\dur, Pseq([Pn(0.0625, 64),0.5],inf),
		\degree, Pseq([
			Pn(2, 64),3,
			Pn(2, 64),\,
			Pn(2, 64),5,
			Pn(2, 64),\,
			Pn(2, 64),11
		],inf),
		\legato, Pseq([Pn(0.9,64),1.3],inf)
	)
}).play(quant:1);
Pdef(\testSawC).fadeTime = 1;
)
Pdef(\testSawC).stop;
