(
SynthDef(\DrumA, { |freq = 50, amp = 0.3, at = 0.01, dt = 0.3, rt = 0.35, room = 2|
	var env, tone;
	env = EnvGen.ar(Env.perc(at, dt, amp),doneAction:2);
	tone = (SinOsc.ar([freq,freq+2]) + SinOsc.kr(160,0,0.5))*env;
	tone = CombC.ar(tone, 0.01, XLine.kr(0.0001, 0.01, 20), 0.2);
	tone = FreeVerb.ar(Splay.ar(tone,0.33,room));
	Out.ar(0, Splay.ar(tone));
}).add;

SynthDef(\SawA, {|freq = 50, amp = 0.3, at = 0.01, dt = 0.3, rt = 0.35, room = 2|
	var osc, env, tone;
	env = EnvGen.ar(Env.linen(at, dt, rt, amp, \sin),doneAction:2);
	osc = SinOsc.ar(freq+SinOsc.kr(4),0,LFSaw.kr(4,0,0.3,0.5));
	tone = osc * env;
	tone = FreeVerb.ar(Splay.ar(tone,0.33,room));
	Out.ar(0, Splay.ar(tone));
}).add;


SynthDef(\contSaw, {|freq = 200, amp = 0.1, ffreq = 180, room = 0.33|
	var osc1, osc2, tone;
	osc1 = LFSaw.ar([freq,freq/2],0,amp);
	osc2 = SinOsc.kr(8,0.5pi,0.25,0.75)*LFSaw.kr(4,0,0.4,0.8);
	tone = Splay.ar(osc1*osc2);
	tone = FreeVerb.ar(tone,0.33,room);
	tone = LPF.ar(tone,SinOsc.kr(0.2,0,10, ffreq));
	Out.ar(0, tone);
}).add;

SynthDef(\SignalA, { |chnl, freq = 800, amp = 0.2, at = 0.05, rt = 0.125|
	var osc1, env, tone;
	osc1 = SinOsc.ar([freq,freq+2]);
	env = EnvGen.ar(Env.perc(at, rt, amp),doneAction:2);
	tone = osc1 * env;
	tone = FreeVerb.ar(tone, 0.6,5);

	Out.ar(chnl, tone);
}).add;

SynthDef(\echo, { |chnl=0, maxdeltime=0.2, deltime=0.2, dectime=2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;

SynthDef(\Tick, { |freq = 400, amp = 0.1, at = 0.01, rt = 0.07|
	var env, tone;
	env = EnvGen.ar(Env.perc(at, rt, amp));
	tone = SinOsc.ar(freq)*WhiteNoise.ar(env);
	TDelay.ar(tone,0.25);
	tone = HPF.ar(tone, SinOsc.kr(1,0,600,1400));
	DetectSilence.ar(tone, doneAction:2);
		Out.ar(0, tone);
}).add;

)
(
Pdef(\seqSig, {
	var seq, eff;
	seq = Pbind(
		\instrument, \SignalA, \dur, Pseq([5, 10, 5, 5],inf), \chnl, 30, \amp, 0.4,
		\freq, Pstutter(2, Pxrand([400, 420, 410, 395],inf))
	);
	eff = Pfx(seq, \echo, \chnl, 30, \maxdeltime, 6, \deltime, 0.75, \dectime, 6)
}).play(quant:5);
)

Pdef(\seqSig).stop;

(
Pdef(\seqTick, {
	Pbind(\instrument, \Tick, \amp, 0.15,
		\freq, 850,
		\dur, Pstutter(Pseq([8,2, 4, 1],inf), Pseq([0.125,0.25],inf)),
		\rt, Pseq([0.13, 0.04],inf),
		\at, Pxrand([0.015, 0.015, 0.01], inf),

	)
}).play(quant:1);
)
Pdef(\seqTick).stop;

(
Pdef(\seqDrumB, {
	Pbind(\instrument, \DrumA, \amp, 0.1,
		\freq, 50,
		\dur, Pstutter(Pseq([16,1,1],inf), Pseq([0.25,0.5,1],inf)),
		\dt, Pseq([0.1, 0.3],inf),
		\rt, Pxrand([0.15, 0.15, 0.1], inf),
		\room, Pseq([0.1,0.2,0.3,0.5], inf)
	)
}).play(quant:1);
)
Pdef(\seqDrumB).stop;

(
Pdef(\seqContSaw).fadeTime = 2;
Pdef(\seqContSaw, {
	Pmono(\contSaw,
		\dur, 5,
		\amp,  Pseq([Pseries(0.0,0.05,5),Pseries(0.25,-0.05,5)],inf),
		\midinote, Prand([
			Pseq([67,65,69,63]),
			Pseq([67,65,67,65]),
			Pseq([57,55,57,65])
		],inf),
		\ffreq, Pseq([Pseries(800,-20,5),Pseries(700,20,5)],inf),
		\room, Pseq([0.5,0.7,0.9,1.5], inf),
		// \detune, 1.001
	)
}).play;
)
Pdef(\seqContSaw).stop;

(
Pdef(\seqDrumA, {
	Pbind(\instrument, \DrumA, \amp, 0.01,
		\freq, 50,
		\dur, Pstutter(Pseq([6,2,14,1],inf),Pseq([0.25,0.5,0.25,1],inf)),
		\dt, Pseq([0.1, 0.3],inf),
		\rt, Pxrand([0.15, 0.15, 0.1], inf),
		\room, Pseq([0.1,0.2,0.3,0.5], inf)
	)
}).play(quant:1);
)
Pdef(\seqDrumA).stop;

(
Pdef(\seqDrumB, {
	Ppar([
		Pbind(\instrument, \DrumA, \amp, 0.01, \freq, 120, \dt, 3.5,
			\dur, Pseq([2, 2, 1],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.05, \freq, 90, \dt, 3.5,
			\dur, Pseq([1, 2, 2], inf),
			\room, Pseq([0.1,0.2,0.3,0.5], inf)
		)
	],inf)

}).play(quant:2);
)
Pdef(\seqDrumB).stop;

(
Pdef(\seqSawA, {
	Pbind(\instrument, \SawA, \amp, 0.12,
		\dur, 0.5,
		\dt, Pseq([1.1, 2.5],inf),
		\midinotes, Pseq([67,65,69,63]/2,inf)

	)
}).play(quant:1);
)
Pdef(\seqSawA).stop;