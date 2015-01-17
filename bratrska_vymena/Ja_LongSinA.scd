s.scope(2);
(
SynthDef(\LongSinA, { |out, gate = 1, freq, ffreq, dt = 5, amp = 0.2|
	var fEnv, aEnv, flt, osc;
	aEnv = EnvGen.kr(Env.asr(1/6*dt, amp, 5/6*dt), gate, doneAction:2);
	fEnv = EnvGen.kr(Env.perc(0.3*dt, 0.7*dt), levelScale: ffreq);
	osc = Mix([
		SinOsc.ar(freq * [1,1.005]),
		LFSaw.ar(freq * [1.005,1.01] / 2, [0.5,0.55],0.6),
		Pulse.ar(freq * [1.005,1.01] / 4, 0.5,0.8)
	]);
	flt = LPF.ar(osc, fEnv + 100, aEnv);
	flt = FreeVerb.ar(flt,0.33,5,0.5,1,flt);
	Out.ar(out, flt);
}).add;
)

(
Pdef(\seqLSin,
	Pbind(
		\instrument, \LongSinA, \amp, 0.2,
		\dur, Pseq([7.5, 0.5, 3.5, 0.5, 4], inf),
		\dt, Pseq([10,3,6,3,8], inf),
		\degree, Pseq([7, 6, 5, 3, 4],inf),
		\octave, Pseq([Pn(4, 5) , Pn(5, 5), Prand([4,6])],inf),
		\ffreq, Pseg(Pseq([100,2000,300]), Pseq([20,20]),\sin,inf)
	)
).play(quant:8)
)
Pdef(\seqLSin).stop;

Pbindef(\seqLSin, \degree, Pseq([7, 6, 7, 5, 9],inf));
Pbindef(\seqLSin, \degree, Pseq([4, Prand([10,12,13]), 7, 5, Prand([2,3,4])],inf),);
Pbindef(\seqLSin, \amp, Pseg(Pseq([0.2,0]),30));

// pmono example of same synth
/*
(
Pdef(\seqLSin2).fadeTime = 5.0;
Pdef(\seqLSin2,
	Pmono(\LongSinA, \amp, 0.3,
		\dur,Pseq([7, Pn(0.125, 8)], inf),
		\dt, 6,
		\degree, Pseg(Pseq([Prand([7,11]),6,5,3]),Pseq([7,0.5,0.5],inf),\sin,inf),
		\octave, 5,//Pseq([Pn(4, 5),Pn(5, 5)],inf),
		\ffreq, Pseg(Pseq([100,2000,300]), Pseq([20,20]),\sin,inf)
	).trace
).play(quant:8)
)
Pdef(\seqLSin2).stop;
*/
