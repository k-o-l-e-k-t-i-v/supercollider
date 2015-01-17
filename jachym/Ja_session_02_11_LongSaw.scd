(
SynthDef(\SawA, {|out, gate = 1, freq, ffreq, width, dt, amp|
	var aEnv, fEnv, osc, flt;
	aEnv = EnvGen.kr(Env.asr(0.1*dt, amp, 0.9*dt),gate, doneAction:2);
	fEnv = EnvGen.kr(Env.adsr(0.01*dt, 0.2*dt, 0.7, 0.7*dt), levelScale: ffreq);
	osc = Mix([LFSaw.ar(freq,[1,1.0005],SinOsc.kr([1,2,4,8],0,0.5,0.5)), Pulse.ar(freq/2,width)]);
	flt = LPF.ar(osc,fEnv + 100, aEnv);
	Out.ar(out, flt);
}).add;
)

(
Pdef(\seqSaw,
	Pbind(\instrument, \SawA, \out, 0, \amp, 0.2,
		\width, Pseq([0.3,0.4,0.5,1], inf),
		\degree, Pseq([6,5,3,4], inf),
		\octave, Pstutter(4,Pseq([3,4,5], inf)),
		\dur, Pseq([7.5, 0.5, 3.5, 0.5, 4],inf),
		\dt, Pseq([10,3,5,3,7], inf),
		\ffreq, Pseg([Pseq([2500,400,2500]), Pseq([20,30])],inf)
	)
).play(quant:2);
)

Pbindef(\seqSaw, \degree, Pseq([3,3,3,5], inf));
Pbindef(\seqSaw, \degree, Pseq([Prand([10, 9]),4,Prand([7, 6]),5], inf));
Pbindef(\seqSaw, \amp, Pseg([Pseq([0.2,0]),Pseq([20])]));

Pdef(\seqSaw).stop;