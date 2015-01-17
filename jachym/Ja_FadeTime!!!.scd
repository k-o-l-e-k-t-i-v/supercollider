(
SynthDef(\SinA, {|out = 0, gate = 1, freq = 90, amp = 0.3, sustain = 0.5|
	Out.ar(out, SinOsc.ar([freq,freq],0,EnvGen.kr(Env.asr(0.75*sustain,amp, 0.25*sustain),gate, doneAction:2)));
}).add;
)

(
Pdef(\tone1, {
	Pbind(\instrument, \SinA, \out, 0, \amp, 0.5, \octave, Pseq([3,4],inf), \legato, 1.35,
		\degree, Pseq([3,4,3,2,3,3],inf),
		\dur, Pseq([0.5,0.25,0.25, Rest(0.125)],inf)
	)
}).play(quant:1);
Pdef(\tone1).fadeTime = 10; //// im idiot, no more any master, fadeTime on Pdef`s (have to be \amp in synth)
)
