(
SynthDef(\LongSinB, {|out, gate = 1, freq, ffreq, width, dt, amp|
	var aEnv, fEnv, osc, flt;
	aEnv = EnvGen.kr(Env.asr(0.1*dt, amp, 0.9*dt),gate, doneAction:2);
	fEnv = EnvGen.kr(Env.adsr(0.01*dt, 0.2*dt, 0.7, 0.7*dt), levelScale: ffreq);
	osc = Mix([SinOsc.ar(freq,[1,1.0005],SinOsc.kr([2,4])), LFSaw.ar(freq/2,1)]);
	flt = LPF.ar(osc,fEnv + 100, aEnv);
	Out.ar(out, flt);
}).add;
)

(
Pdef(\seqLSin,
	Pbind(\instrument, \LongSinB, \out, 0, \amp, 0.25,
		\degree, Pseq([6,5,6,4,Prand([7,9,11])], inf),
		\octave, Pstutter(5,Pseq([5,6], inf)),
		\dur, Pseq([7.5, 0.5, 3.5, 0.5, 4],inf),
		\dt, Pseq([10,3,5,3,7], inf),
		\ffreq, Pseg(Pseq([600,1800,600],inf), Pseq([20,10],inf))
	).trace;
).play(quant:2);
)
Pdef(\seqLSin).stop;

Pbindef(\seqLSin, \degree, Pseq([3,4,3,2,Prand([5,7])], inf));