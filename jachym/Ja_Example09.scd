(
SynthDef(\baseSin, { |freq = 440, vol = 0.5, dt = 0.5|
	var tone, env;
	env = EnvGen.ar(Env([0, vol, 0],[0.1*dt, 0.9*dt]),doneAction:2);
	tone = SinOsc.ar(freq, 0, env);

	Out.ar(0, tone ! 2);
}).add;

SynthDef(\beat1, { |freq = 665, dt = 0.2, vol = 0.2, ffreq = 1100|
	var tone, env, noise;
	env = EnvGen.ar(Env([0,vol,0], [0.1 *dt, 0.9*dt]), doneAction: 2);
	noise = ((LFSaw.kr(freq/4)) * SinOsc.kr(freq/4, 0, 0.35, 0.6)).range(0.6,1.1);
	tone = SinOsc.ar([freq, freq + 2],[0, 0.1pi, 0.2pi],env*noise);
	tone = HPF.ar(tone, ffreq);

	Out.ar(0, tone ! 2);
}).add;

SynthDef(\tone1, { |freq = 100, dt = 6, vol = 0.02, sg = 0|
	var tone, env;
	env = EnvGen.ar(Env([0,vol, vol*0.4, vol*0.8, 0],[0.1*dt, 0.3*dt, 0.1*dt, 0.5*dt]),doneAction:2);
	tone = SinOsc.ar(freq, 0, env);

	Out.ar(sg, tone);
}).add;
)

TempoClock.default.tempo = 60/60;


(
Pdef(\seqDrum1, {
	Pswitch([
		Pbind(
			\instrument, \baseSin,
			\freq, 870,
			\vol, 0.03,
			\dur, Pseq([0.5],2),
			\dt, Pseq([0.05, 0.12])
		),
		Pbind(\instrument,\baseSin,
			\freq, 855,
			\vol,0.05,
			\dur, Pseq([0.25],4),
			\dt, Pseq([0.25, 0.04, 0.15, 0.18])
		)
	],Pseq([Pn(0,4),1,Pn(0,4),1,1],inf));
}).play(quant:4);
)

Pdef(\seqDrum1).stop;

(
Pdef(\segDrum2).fadeTime = 0.5;
Pdef(\seqDrum2, {
	Pswitch([
		Pbind(
			\instrument, \tone1,
			\freq, Pseq([120, 136, 108, 136,0]),
			\dur, Pseq([Pn(0.5,4),1]),
			\dt, Pseq(2/[1, 2, 3, 0.9, 0]),
			\vol, 0.07,
			\sg, Pseq([0,1],3)
		),
		Pbind(
			\instrument, \tone1,
			\freq, Pseq([108, 136, 128, 136, 0]),
			\dur, Pseq([Pn(0.5,4),1]),
			\dt, Pseq(2/[1, 2, 3, 0.9, 0]),
			\vol, 0.09,
			\sg, Pseq([0,1],3)
		)],
		Pseq([Pn(0,3),1],inf)
	);
}).play(quant:4);
)
Pdef(\seqDrum2).stop;

(
Pdef(\seqSurf1, {
	Pswitch([
		Pbind(
			\instrument, \beat1,
			\freq, Pseq([420,322,420,324,485,326]),
			\dur, Pseq([6, 4, 5.5, 3.5, 7, 4]),
			\vol, Pseq([0.1,0.15],3),
			\dt, Pseq([8.85, 6.75, 7.65, 5.85, 9.3, 10.65]),
			\detune, 1.01,
			\ffreq, Pseq([1100,900,700,500,800,1000]),

		),
		Pbind(\instrument,\beat1,
			\freq, 98,
			\dur, Pseq([0.20, 0.15, 0.15, 0.7, 0.15, 0.15, 0.5],2),
			\dt, Pseq([0.25, 0.2, 0.2, 0.55 ,0.2,0.2, 1],2),
			\vol,0.45
		)
	],Pseq([0,1],inf));
}).play(quant:4);
)

Pdef(\seqSurf1).stop;




/// C:\Program Files (x86)\SuperCollider-3.6.6\HelpSource\Tutorials\Getting-Started\00-Getting-Started-With-SC.schelp