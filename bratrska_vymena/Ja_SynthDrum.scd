s.scope(2);
(
SynthDef(\DrumA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.15*sustain, 0.8, 0.65*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumB, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.05*sustain, 0.05, 0.8*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumC, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.45*sustain, 0.1, 0.5*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(700,900),freq,0],[0.05*sustain, 0.85*sustain],\exp));
	osc = SinOsc.ar([fEnv-1,fEnv+1],0,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 1200);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumD, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.1*sustain, 0.1, 0.85*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1200,1500),freq,0],[0.05*sustain, 0.91*sustain],\exp));
	osc = Mix.fill(4, {|i| SinOsc.ar([fEnv-i,fEnv+i],0.5*i,amp/2)});
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 1500);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumE, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),freq,1],[0.09*sustain, 0.6*sustain],\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+1,fEnv-1],0.5,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 400);
	Out.ar(out, tone);
}).store;
)



(
Pdef(\testDrumA, {
	Pbind(\instrument, \DrumA, \amp, 1, \legato, 0.9, \octave, 2, \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
		// \dur, Pseq([Pn(5,2),3.5,0.5], inf)
		\dur, 0.5
	)
}).play(quant:1);
Pdef(\testDrumA).fadeTime = 1.0;
)
Pdef(\testDrumA).stop;
(
Pdef(\testDrumA, {
	Ppar([
		Pbind(\instrument, \DrumA, \amp, 0.7, \legato, 0.9, \octave, 2, \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\dur, 0.5
		),
		Pbind(\instrument, \DrumB, \amp, 0.5, \legato, 0.5, \octave, 3, \degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\dur, 0.25
		),
		Pbind(\instrument, \DrumE, \amp, 0.5, \octave, 5, \degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\dur, Pseq([Rest(0.75),0.125,0.125],inf),
			\legato, Pseg(Pseq([0.1,1.9,1,0.1],inf),Pseq([16,10,4],inf),\sin,inf)
		),
		Pbind(\instrument, \DrumC, \amp, 0.5, \legato, 0.5, \octave, 4, \degree, Pseq([Pn(5,12),Pn(3,12)],inf),
			\dur, Pseq([Rest(0.5),0.25,0.25],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\testDrumA).fadeTime = 4.0;
)
Pdef(\testDrumA).stop;

(
Pdef(\testDrumB, {
	Pbind(\instrument, \DrumC, \amp, 1, \octave, 3,
		\legato, Pseq([Pn(1.0,12),1], inf),
		\degree, Pseq([Pn(4,11),2,1], inf),
		\dur, Pseq([Pn(0.125,12), Rest(0.25)], inf)
		// \dur, 0.25
	)
}).play(quant:1);
Pdef(\testDrumB).fadeTime = 1.0;
)
Pdef(\testDrumB).stop;

(
Pdef(\testDrumC, {
	Pbind(\instrument, \DrumA, \amp, 1,
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
Pdef(\testDrumC).fadeTime = 1;
)
Pdef(\testDrumC).stop;
