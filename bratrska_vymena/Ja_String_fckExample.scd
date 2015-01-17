(
SynthDef(\SpringA, {|out, freq, gate = 1, amp, dt|
	var aEnv, osc, flt, num;
	var m0, m1, m2, m3, m4, d, k, t;
	aEnv = EnvGen.kr(Env.asr(0.05*dt,amp,0.95*dt),gate,doneAction:2);

	k = Rand(0.1,0.3);
	d = Rand(0.005,0.01);
	t = Pulse.ar(freq,0.5);
	m0 = Spring.ar(ToggleFF.ar(t), 1 * k, 0.01);
	m1 = Spring.ar(m0, 0.5 * k, d);
	m2 = Spring.ar(m0, 0.6 * k, d);
	m3 = Spring.ar([m1,m2], 0.4 * k, d);
	m4 = Spring.ar(m3 - m1 + m2, 0.1 * k, d);

	flt = CombL.ar(t, 0.1, LinLin.ar(m4, -10, 10, 1/8000, 1/100), 12);
	flt = LPF.ar(flt, 2800, aEnv);

	Out.ar(out, flt)
}).add;
)

(
Pdef(\seqSpringA,
	Pbind(\instrument, \SpringA, \out, 0, \amp, 0.3, \dur, 5, \dt, 0.9,
		// \freq, Pseq([211,210,209], inf)
		\degree, Pseq([6,2,6,3], inf),
		\octave, 5
	)
).play(quant:2);
)
Pdef(\seqSpringA).stop;

//use of Spring help example, but how to better control that??? :0