s.plotTree;

t = TempoClock.new(1,0).permanent_(true);
t.beats;

ProxySpace.push(s, \track1, t);

(
ProxySynthDef(\saw, {|gate = 1, sustain, freq, amp|
	var aEnv = EnvGen.ar(Env.adsr(0.85,0.15,0.3,2.4), gate, levelScale: amp, timeScale: sustain, doneAction:2);
	Saw.ar([freq,freq+15], 0.7 + BrownNoise.kr(0.05,0.25)) * LFPulse.ar([60,62]) * aEnv;
}).add;
ProxySynthDef(\signal, {|gate = 1, sustain, freq, amp|
	var aEnv = EnvGen.ar(Env.adsr(0.15,0.85,0.8,1.4), gate, levelScale: amp, timeScale: sustain, doneAction:2);
	GrayNoise.ar(0.55,0.45) * LFTri.ar([freq,freq+20],[0,0.2,0.4,0.5], SinOsc.kr(0.5,0,0.4,0.6)) * aEnv;
}).add;
)

~tone.play.fadeTime_(4);
~tone[0] = { Pan2.ar(SinOsc.ar(60,[0,0.5], SinOsc.kr(1/8, 0, 0.03, 0.12)), LFSaw.kr([0.5,0.51])); }
~tone.stop(20);

~sig.play.quant_(5).fadeTime_(0.5);
(
~sig[0] = Pbind(\instrument, \signal, \amp, 0.15,
	\dur, Pn(Pseq([Pn(0.25,4),4, Rest(1)], 4) ++ Rest(8), inf),
	\legato, 0.125,
	\octave, Pstutter(Pseq([8,2], inf), Pseq([6,5], inf)),
	\degree, Pseq([2,3,4,5], inf));
~sig[30] = \filter -> {|in| LPF.ar(in, SinOsc.kr([4,15],0,3000,8000)) };
~sig[32] = \filter -> {|in| GVerb.ar(in, 220, 0.125, Saw.kr(0.5,0.15,0.2))};
)
~sig.removeAt(36);
~sig.free(10);
~sig.scope;

~saw.play.quant_(5).fadeTime_(0.75);
(
~saw[0] = Pbind(\instrument, \saw, \amp, 0.15,
	\dur, Pseq([Pn(0.0625,64), 2, Rest(6)], inf),
	\legato, Pseq([Pn(0.05,22) ++ Pseries(0.05,0.05,10) ++ Pwrand([0.6,0.8,1.0,1.1],[0.2,0.5,0.2,0.1],inf)], inf),
	\octave, Pstutter(Pseq([64, 16, 12, 4], inf), Pseq([2,3,2,4], inf)),
	\degree, 5);
~saw[30] = \filter -> {|in| CombC.ar(in, 0.75, 0.0625, SinOsc.kr(1/64,0,2,5.25))};
~saw[32] = \filter -> {|in| LPF.ar(in, SinOsc.kr([35,40],0,1300,2800)) };
~saw[34] = \filter -> {|in| Vibrato.ar(in, 2200, 0.02, 0.8, 0, 0.08, 0.3) };
)
~saw.removeAt(36);
~saw.free(5);
~saw.scope;

