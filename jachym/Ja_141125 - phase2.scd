(
SynthDef(\PulseJerich2, {|out, gate = 1, freq, sustain, amp, lpf|
	var aEnv = EnvGen.kr(Env.adsr(0.01*sustain,0.24*sustain,0.1,0.75*sustain),gate);
	var fEnv = Mix.fill(4, {|i| LFSaw.ar([freq,freq+5],pi/3*i,Rand(0,5));});
	var osc = SinOsc.ar([freq+fEnv,freq+fEnv+10],0,0.7,Saw.ar([4,5,8,10,64,65],0.8,0.2));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone, 800);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out, Pan2.ar(tone, SinOsc.kr(0.125)));
}).add;
)

(
Pdef(\PulseSeq1,
	Pbind(\instrument, \PulseJerich2, \amp, 1, \out, ~ch0, \group, ~synG,
		\dur, Pseq([Pn(0.0625,8),Rest(0.5),Pn(0.0625,4),Rest(0.5)], inf),
		\legato, Pseq([Pn(0.28,16), 0.4, Pn(0.08,16), 0.4], inf),
		\octave, 10,
		\degree, Pseq([Pn(4,8),4b,5,6,7], inf),
		\lpf, Pseq([2500,50,8000,200,8000], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\PulseSeq1).stop;

(
Pdef(\PulseSeq2,
	Pbind(\instrument, \PulseJerich2, \amp, 1, \out, ~ch1, \group, ~synG,
		\dur, Pseq([Pn(0.25,2),Rest(1.5),Pn(0.0625,8),Rest(0.5)], inf),
		\legato, Pseq([Pn(0.48,2), 0.4, Pn(0.9,4), 0.4,0.6,0.8,1], inf),
		\octave, 5,
		\degree, Pseq([Pn(4,8),4b,5,6,7], inf),
		\lpf, Pseq([2500,50,8000,200,8000], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\PulseSeq2).stop;

(
Pdef(\PulseSeq3,
	Pbind(\instrument, \PulseJerich2, \amp, 1, \out, ~ch2, \group, ~synG,
		\dur, Pseq([Pn(0.0625,16),Rest(1)], inf),
		\legato, Pseq([Pn(0.18,2), 0.4, Pn(0.6,4), 0.1,0.2,0.7], inf),
		\octave, Pseq([Pn(7,4),8], inf),
		\degree, Pseq([Pn(4,8),4b,5,6,7], inf),
		\lpf, Pseq([2500,50,8000,200,8000], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\PulseSeq3).stop;

(
Pdef(\PulseSeq4,
	Pbind(\instrument, \PulseJerich2, \amp, 1, \out, ~ch3, \group, ~synG,
		\dur, Pseq([0.25,0.125,0.125,0.25,Rest(0.25)],inf),
		\legato, Pseq([Pn(0.48,2), 0.4, Pn(0.9,4), 0.4,0.6,0.8,1], inf),
		\octave, Pseq([Pn(1,16),Pn(2,8)], inf),
		\degree, Pseq([Pn(4,8),4b,5,6,7], inf),
		\lpf, Pseq([2500,50,8000,200,8000], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\PulseSeq4).stop;