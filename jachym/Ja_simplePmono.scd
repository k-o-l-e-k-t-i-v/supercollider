(
SynthDef(\baseSine, { |freq = 160, side = 0|
	Out.ar(0, Pan2.ar(SinOsc.ar(freq,0,0.4),side));
}).add;
)

(
Pdef(\seq).fadeTime = 1;
Pdef(\seq, {
	Ppar([
		Pmono(
			\baseSine, \dur, 0.1, \freq, 160,
			\side, Pseq([Pseries(-1,0.1,20),Pseries(1,-0.1,20)],inf)
		),
		Pmono(
			\baseSine, \dur, 0.1,\freq, 420,
			\side, Pseq([Pseries(1,-0.1,20),Pseries(-1,0.1,20)],inf)
	)],inf)
}).play;
)

Pdef(\seq).stop;