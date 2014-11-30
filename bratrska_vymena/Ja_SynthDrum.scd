s.scope(2);
(
SynthDef(\DrumA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.15*sustain, 0.8, 0.65*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,2,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumB, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),200,1],[0.08*sustain, 0.4*sustain],\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+1,fEnv-1],0,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 500);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumC, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.85*sustain, 0.1*sustain,0.6, 0.05*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),200,1],[0.10*sustain, 0.2*sustain],\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*Pulse.ar([fEnv+1,fEnv-1],0.1,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 500);
	Out.ar(out, tone);
}).store;
)



(
Pdef(\testDrumA, {
	Pbind(\instrument, \DrumC, \amp, 1, \legato, 0.9, \octave, 2, \degree, Pseq([Pn(2,16),Pn(3,16)],inf),
		// \dur, Pseq([Pn(5,2),3.5,0.5], inf)
		\dur, 0.5
	)
}).play(quant:1);
Pdef(\testDrumA).fadeTime = 1.0;
)
Pdef(\testDrumA).stop;

(
Pdef(\testDrumB, {
	Pbind(\instrument, \DrumA, \amp, 0.5, \octave, 3,
		\legato, Pseq([Pn(1.0,11),Pn(2.3,2)], inf),
		\degree, Pseq([Pn(4,11),Pn(3,2)], inf),
		\dur, Pseq([Pn(0.0625,12), Rest(2.125)], inf)
		// \dur, 0.25
	)
}).play(quant:1);
Pdef(\testDrumB).fadeTime = 4.0;
)
Pdef(\testDrumB).stop;

(
Pdef(\testDrumC, {
	Pbind(\instrument, \DrumA, \amp, 1,
		\octave, Pseq([2,2,2,3], inf),
		\dur, Pseq([Pn(0.0625, 64),0.5],inf),
		\degree, Pseq([
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

(
Pdef(\monoDrumA, {
	Pmono(\DrumA, \amp, 0.1, \octave, 4,
		\dur, Pseq([Pseq([0.0625,0.125],8) , 1], inf),
		\degree, Pseq([4,5], inf)
	)
}).play(quant:1);
Pdef(\monoDrumA).fadeTime = 10.0;
)
Pdef(\monoDrumA).stop;