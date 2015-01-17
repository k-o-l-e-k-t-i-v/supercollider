s.plotTree;
s.scope(2);
FreqScope();

(
SynthDef(\DrumA2, { |bus, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain,0.25*sustain, 0.15, 0.7*sustain,curve:-4),gate);
	fEnv = EnvGen.kr(Env([Rand(700,900),freq],[sustain*0.04],\exp));
	osc = SinOsc.ar([fEnv+0.1,fEnv-0.1],0,0.5)*LFPulse.ar([fEnv-0.5,fEnv+0.5],sustain*0.1,0.3,0.4,1.6);
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + 10);
	tone = BPF.ar(tone,fEnv/2,50,1);
	tone = FreeVerb.ar(tone,0.2,0.7,0.5, 1,tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(bus, tone);
}).add;

SynthDef(\DrumA3, { |bus, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.05*sustain,1,0.95*sustain,curve:-8),gate);
	fEnv = EnvGen.kr(Env([Rand(2700,3100),freq,freq*0.5],[0.02,0.7*sustain],\exp));
	osc = SinOsc.ar([fEnv+0.1,fEnv-0.1],0,SinOsc.kr(4,0.05,0.95,0.05));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + 400);
	tone = FreeVerb.ar(tone,0.5,0.3,0.1, 1,tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(bus, tone);
}).add;

SynthDef(\Saw1, { |bus, gate = 1, amp, freq, sustain, oscSpeed = 0.5|
	var aEnv1, aEnv2, osc1, osc2, osc3, tone;
	aEnv1 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.45, 0.5*sustain,curve:4),gate, doneAction:2);
	osc1 = LFSaw.ar([freq,freq], 0, SinOsc.kr(oscSpeed*0.5,0,0.15,0.165));
	osc1 = FreeVerb.ar(osc1,0.8,2.7,0.9,1,osc1);
	aEnv2 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.65, 0.45*sustain,curve:-2));
	osc2 = LFSaw.ar([freq-0.01,freq+0.01], 0.5*pi, SinOsc.kr(oscSpeed,0,0.15,0.165));
	osc2 = FreeVerb.ar(osc2,0.8,5.7,0.5,1,osc2);
	osc3 = Saw.ar([64.01,64], SinOsc.kr(oscSpeed*4,0,0.15,0.165));
	tone = (osc1+(osc2*aEnv2)+osc3) * aEnv1 * amp;
	Out.ar(bus, tone);
}).add;

)
(
Pdef(\seqDrumA2_b,
	Pbind(
		\instrument, \DrumA3,
		\amp, 0.5,
		\dur, 0.5,
		// \dur, Pseq([0.5, Rest(1.5)], inf),
		\legato, Pseq([0.5,0.7], inf),
		\octave, 4,
	);
).play(quant:1);
)
Pdef(\seqDrumA2_b).stop;
(
Pdef(\seqDrumA2_c,
	Pbind(
		\instrument, \DrumA2,
		\amp, 0.5,
		\dur, Pseq([Pn(0.125,3),Rest(0.625)], inf),
		\legato, Pseq([0.3,0.6], inf),
		\octave, 5,
		\degree, Pseq([4,Pxrand(#[11,9,7]),4,5], inf),

	);
).play;
Pdef(\seqDrumA2_c).quant_([1,0.25]);
)
Pdef(\seqDrumA2_c).stop;
(
Pdef(\seqSaw1,
	Ppar([
		Pbind(
			\instrument, \Saw1,
			\amp, 0.55,
			\dur, Pseq([Pn(2,4), 10], inf),
			\legato, 1.9,
			\octave, Pseq([Pn(5,8), Pn(6,8)], inf),
			// \degree, Pseq([4,#[4,4b,7],4,5], inf),
			\degree, Pseq([4,Pxrand(#[4,4b,7]),4,5], inf),
			\oscSpeed, Pseq([Pn(2,16), Pn(4,8)], inf)
		),
		Pbind(
			\instrument, \Saw1,
			\amp, 0.75,
			\dur, Pseq([8,10], inf),
			\legato, 1.3,
			\octave, Pseq([Pn(3,4), Pn(4,4)], inf),
			\degree, Pseq([4,7,4,5], inf),
			\oscSpeed, Pseq([1,2], inf)
	)], inf);
).play(quant:1);
)
Pdef(\seqSaw1).stop;