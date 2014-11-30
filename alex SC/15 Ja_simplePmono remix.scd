(
SynthDef(\baseLine, { |freq = 160, amp = 0.2, side = 0, gate=1|
	var env, tone;
	env=EnvGen.ar(Env.adsr, gate, doneAction:2);
	tone=Pan2.ar(SinOsc.ar(freq,0,amp),side)*env;
	Out.ar(0, tone);
}).add;
)



(
Pdef(\seq).fadeTime = 1;
Pdef(\seq, {
	PmonoArtic(
		\baseLine, \dur, Pseq([Pn(1,4),Pn(0.2,2),0.5],inf), \legato, 0.1,
		\side, 0
	)
}).play;
)

Pdef(\seq).stop;