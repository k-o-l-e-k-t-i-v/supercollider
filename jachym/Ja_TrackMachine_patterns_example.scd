// it has slow start

(
SynthDef(\test1,
	{ arg out=0, freq=440, sustain;
		var env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
		Out.ar(out, SinOsc.ar([freq,freq+5], 0, env))
}).add;
SynthDef(\test2,
	{ arg out=0, freq=440, sustain;
		var env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
		Out.ar(out, LFSaw.ar([freq,freq+5], 0, env))
}).add;

// s.sync;

~seqSin = Pbind(
	\instrument, \test1,
	\dur, Pseq([1], inf),
	\legato, 1.9,
	\degree, Pseries(0, 1, inf),
	\octave, 4,
	\amp, 0.3
);
~seqSaw = Pbind(
	\instrument, \test2,
	\dur, Pseq([0.25], inf),
	\degree, Pseries(1, 0.5, inf),
	\legato, 1.2,
	\octave, 2,
	\amp, 0.3
);

// 1st number is start time in phase(seconds) for pattern, 2nd number how long(seconds) will pattern play
~phase1 = Ptpar([
	0,Pfindur(10,~seqSin),
	5,Pfindur(5,~seqSaw)
]);
~phase2 = Ptpar([
	4,Pfindur(2,~seqSin),
	2,Pfindur(8,~seqSaw)
]);

// just // for skip phase
Pseq([
	~phase1,
	~phase2,
]).play;

)
