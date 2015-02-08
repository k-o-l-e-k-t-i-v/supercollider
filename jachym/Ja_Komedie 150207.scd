s.scope(2);
s.plotTree;
(
SynthDef(\Saw, {|out, gate = 1, freq, amp, sustain|
	var aEnv, fEnv, osc, tone;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1,0.7*sustain),gate, doneAction:2);
	fEnv = EnvGen.ar(Env.asr(0.05*sustain, 200,0.05*sustain),gate);
	osc = LFSaw.ar([freq, freq+10],0,0.4,0.6)*Saw.ar([fEnv, fEnv],0.2,0.8);
	tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;
SynthDef(\Saw2, {|out, gate = 1, freq, amp, sustain|
	var aEnv, fEnv, osc, tone;
	aEnv = EnvGen.ar(Env.asr(0.1*sustain, 1,0.9*sustain),gate, doneAction:2);
	// fEnv = EnvGen.ar(Env.asr(0.05*sustain, 200,0.05*sustain),gate);
	osc = LFSaw.ar([freq, freq+10],0,0.4,0.6)*Pulse.ar([35, 40],0.1,0.2,0.8);
	tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;
SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.025*sustain;
	aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]), gate);
	fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.12*sustain,0.78*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	tone = osc * aEnv * amp;
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;
SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(Saw.kr([4,5],LFPulse.kr(16,0.5,0.3))),freq)*LFSaw.ar(40,[0,0.01],0.2,0.8);
	var tone = osc * aEnv * amp;
	Out.ar(out,tone);
}).add;
SynthDef(\testSin, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.ar(Env.asr(0.1*sustain, 1,0.9*sustain),gate, doneAction:2);
	var osc = SinOsc.ar([freq, freq+10],0,0.4,0.6)*Saw.ar([freq/2, (freq+10)/4],0.2,0.8);
	var tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;
)

(
Pdef(\test,
	Ppar([
		Pbind(\instrument, \Saw2, \out, ~ch[0], \group, ~synG, \amp, 1,
			\dur, Pseq([Pn(0.125,32),Rest(0.25)], inf), \legato, Pseq([Pn(0.4,16), 1.9, Pn(0.6,4), 1.2], inf),
			\octave, Pseq([Pn(4,64),Pn(3,16)], inf),
			\degree, Pstutter(Pseq([64,4,32,8],inf),Pseq([3,7,4,6],inf))
		),
		Pbind(\instrument, \Saw, \out, ~ch[1], \group, ~synG, \amp, 1,
			\dur, 8, //Pseq([Pn(0.125,64),0.5], inf),
			\legato, 1.2,
			\octave, 5,
			\degree, Pstutter(Pseq([4,3,4,2],inf),Pseq([8,8,8,4],inf))
		)
	],inf)
).play(quant:2);
)
Pdef(\test).stop;
(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \out, ~ch[2], \group, ~synG, \amp, 1,
		\dur, 0.125, //Pseq([Pn(0.25,4),Rest(0.5),0.5], inf),
		\legato, Pseq([0.17,0.5,0.4,0.3], inf),
		\octave, Pstutter(Pseq([32,8],inf),Pseq([3,6], inf)),
		\degree, Pseq([5,5,5,6b], inf),
)).play(quant:2);
)
Pdef(\DrumSeq1).stop;

(
Pdef(\DrumSeq2,
	Pbind(\instrument, \DrumA5, \out, ~ch[3], \group, ~synG, \amp, 1,
		\dur, 0.0625,//Pseq([Pn(0.25,4),Rest(0.5),0.5], inf),
		\legato, Pseq([0.17,0.5,0.14,0.3], inf),top;
		\octave, 2,
		\degree, Pseq([5,4,5,6b], inf),
)).play(quant:2);
)
Pdef(\DrumSeq2).stop;

(
Pdef(\HatSeq,
	Pbind(\instrument, \Hat, \out, ~ch[4], \group, ~synG, \amp, 1,
		\dur, Pseq([Pn(0.125,2), Rest(0.75),Pn(0.25,4), Rest(1)],inf),
		\legato, Pseq([0.1,0.8,0.1,0.8,0.4,0.2], inf),
		\freq, Pwhite(100,180, inf)
	)
).play(quant:2);
)
Pdef(\HatSeq).stop;

(
Pdef(\SignalSeq,
Pbind(\instrument, \testSin, \out, ~ch[5], \group, ~synG,
	\amp, 1,
	\dur, Pseq([Pn(0.125,4), Rest(1.5)], inf), \legato, 0.4,
	\octave, 3, //Pseq([Pn(3,15),Pn(2,2),Pn(4,17),Pn(2,15),Pn(3,2)], inf),
	\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
)
).play(quant:2);
)
Pdef(\SignalSeq).stop;