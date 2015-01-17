(
SynthDef(\drums, {|out = 10, bassLevel = 0 , snareLevel = 0, hatLevel = 0, tomLevel = 0, pan1 = 0, pan2 = 0, pan3 = 0, pan4 = 0|

	var env1, env2, env3, env4, bass, snare, hat, tom, bassOut, snareOut, hatOut, tomOut, mixer;
	env1 = EnvGen.kr(Env.perc(0.001, 0.2, 2, -4), 1, doneAction:2);
	env2 = EnvGen.kr(Env.perc(0.001, 0.5, 1, -1), 1, doneAction:2);
	env3 = EnvGen.kr(Env.perc(0.002, 0.3, 1, -2), 1, doneAction:2);
	env4 = EnvGen.kr(Env.perc(0.001, 0.1, 1, -5), 1, doneAction:2);


	bass = GVerb.ar(CombC.ar(SinOsc.ar(70) * Crackle.ar(0.9, 0.75) + FreqShift.ar(EnvGen.ar(Env.perc(0.001,1.5)),100), 1, 38.midicps.reciprocal,3), 10, 0.5, mul:0.4);
	bassOut = Pan2.ar(bass*env1, pan1, bassLevel);

	snare = CombC.ar(SinOsc.ar([120,60]) - WhiteNoise.ar(0.5, 0.5),1, 57.midicps.reciprocal,2);
	snareOut = Pan2.ar(Mix(snare)*env4, pan2, snareLevel);

	hat = CombC.ar(Klank.ar(`[ [ 6563, 9875 ],
		[ 0.6, 0.5 ],
		[ 0.002, 0.003] ], PinkNoise.ar(1)),2, 45.midicps.reciprocal,2);
	hatOut = Pan2.ar(FreqShift.ar(GVerb.ar(hat*env3,0.5,0.75,mul:0.4),100), pan2, hatLevel);

	tom = CombC.ar(SinOsc.ar(220,0,100).distort,1, 43.midicps.reciprocal, 2);
	tomOut = Pan2.ar(tom*env4, pan4, tomLevel);

	mixer = Limiter.ar(Mix.new([bassOut, snareOut, hatOut, tomOut]).softclip.distort, 0.3);


	Out.ar(out, mixer);

}).store;

);


//This is where you should sequence the drum machine, there is also a pattern using this default synth for patterns by supercollider. What you have to do here is pay attention to the Out parameters, 0 is directly out and other buses are for the filters;

(
a = Pseq ([1, 1, 0, 1, 0, 0, 1, 1]);
b = Pseq ([1, 0, 1, 1, 0, 0]);
c = Pseq ([0, 1, 0, 1, 0, 1, 1, 0, 1]);
d = Pseq ([0, 0, 1, 0, 1]);

Pdef(\drumsI, Ppar(
	[
		Pbind(
			\instrument, \drums,
			\tempo, 17.5/60,
			\dur, Pseq([1/14,1/14, 1/4, 1/12,1/12,1/12,1/12], inf);,
			\bassLevel, Pseq ([a], inf),
			\snareLevel, Pseq ([b], inf),
			\hatLevel, Pseq ([c], inf),
			\tomLevel, Pseq ([d], inf),
			\out, Prand([0, 10, 0 , 0, 12, 14, 16, 14, 10, 18, 20],inf),
			\pan2, Prand([1,0.5, 0.2, 0, -0.2, -0.5, -1],inf),
			\pan3, Prand([1,0.5, 0.2, 0, -0.2, -0.5, -1],inf)),

		Pbind(\tempo, 17.5/60,
			\freq, Pseq([60, 55.5, 63, 62, 59.5].midicps*0.5,inf), \dur, Pseq([1/7,1/4,1/4,1/3],inf), \amp, 0.25, \legato, Pseq([0.2, 0.8, 0.2, 0.2, 1.3, 0.1, 0.05, 0.2, 0.5],inf), \out, Prand([30,30,0],inf))
	])
);
);

// play the sequence and you will only get a part of the it (the other parts are going out through buses that have nothing yet);
(
Pdef(\drumsI).play;
);

// then you design the filters I was talking about (simple examples);

(
{Out.ar(0,FreqShift.ar(GVerb.ar(In.ar(10,2), 60, 0.05,mul:15), 70).distort.distort)}.play;

{Out.ar(0,GVerb.ar(In.ar(30,2), 60, 0.05,mul:65).distort.distort)}.play;
);