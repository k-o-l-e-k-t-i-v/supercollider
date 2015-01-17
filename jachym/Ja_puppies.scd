s.scope(2);
(
SynthDef(\DrumA3, { |bus, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv, fMod;
	fMod = 0.05;
	aEnv = EnvGen.kr(Env.asr(0.05*sustain,1,0.95*sustain,curve:-8),gate);
	fEnv = EnvGen.kr(Env([Rand(700,1100),freq,freq*0.5],[fMod,0.7*sustain],\exp));
	osc = Pulse.ar([fEnv+0.1,fEnv-0.1],fMod*4,SinOsc.kr(4,0.05,0.95,0.05));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + 200);
	tone = FreeVerb.ar(tone,0.9,0.3,0.1, 1,tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(bus, tone);
}).add;
)

(
Pdef(\drum,
	Pbind(\instrument, \DrumA3, \amp, 0.6, \octave, Pseq([Pn(2,4), Prand([4,5,6], inf)], inf), \degree, Pseq([4, 7, 9, 11b], inf),
		\dur, Pseq([Pn(0.125,4), Pn(0.25,2)], inf), \legato, 0.8
	)
).play(quant:1);
Pdef(\drum).fadeTime = 4;
)
Pdef(\drum).stop;
s.freeAll;


//awww myyyy gaaaawwwdddd! <3 <3 <3