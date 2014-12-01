// https://c2.staticflickr.com/8/7265/7808392716_dd3612345c_z.jpg

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

SynthDef(\DrumE, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),freq,1],[0.09*sustain, 0.6*sustain],\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+1,fEnv-1],0.5,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 400);
	Out.ar(out, tone);
}).store;

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
Pdef(\seqDrum, {
	Ppar([
		Pbind(\instrument, \DrumA, \amp, 0.5, \legato, 0.9, \octave, 2, \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\dur, 0.5
		),
		Pbind(\instrument, \DrumB, \amp, 0.3, \legato, 0.3, \octave, 2, \degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\dur, Pseq([Rest(0.25),Pn(0.125,4)],inf),
		),
		Pbind(\instrument, \DrumE, \amp, 0.5, \octave, 5, \degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\dur, Pseq([Rest(0.75),0.125,0.125],inf),
			\legato, Pseg(Pseq([0.1,1.9,1,0.1],inf),Pseq([16,10,4],inf),\sin,inf)
		)
	],inf);
}).play(quant:1);
Pdef(\seqDrum).fadeTime = 4.0;
)
Pdef(\seqDrum).stop;

(
Pdef(\seqSawA, {
	Ppar([
		Pbind(\instrument, \SawA, \amp, 0.7, \legato, 1.5, \octave, 1, \degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\dur, Pseq([2],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.4, \legato, 0.9, \octave, 3, \degree, Pseq([4,4,4,3],inf),
			\dur, Pseq([0.25],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.5, \legato, 0.3, \octave, 3, \degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\seqSawA).fadeTime = 4.0;
)
Pdef(\seqSawA).stop;