(
SynthDef(\LongSinB, {|out, gate = 1, freq, ffreq, width, dt, amp|
	var aEnv, fEnv, osc, flt;
	aEnv = EnvGen.kr(Env.asr(0.1*dt, amp, 0.9*dt),gate, doneAction:2);
	fEnv = EnvGen.kr(Env.adsr(0.01*dt, 0.2*dt, 0.7, 0.7*dt), levelScale: ffreq);
	osc = Mix([SinOsc.ar(freq*[1,1.0005],0,SinOsc.kr([2,4])), LFSaw.ar(freq/2,0,SinOsc.kr([2,4]))]);
	flt = LPF.ar(osc,fEnv + 100, aEnv);
	Out.ar(out, flt);
}).add;
)

(
Pdef(\seqLSin,
	Pbind(\instrument, \LongSinB, \out, 0, \amp, 0.45,
		\degree, Pseq([6,5,6,4], inf),
		\octave, Pstutter(4, Pseq([3,4,5], inf)),
		\dur, Pseq([7.5, 0.5, 3.5, 0.5],inf),
		\dt, Pseq([10,3,5,3], inf),
		\ffreq, Pseg(Pseq([850,1600,850], inf), Pseq([25,25],inf))
	)
).play(quant:2);
)
Pdef(\seqLSin).stop;

Pbindef(\seqLSin, \degree, Pseq([3,4,3,2,Prand([5,7])], inf));
Pbindef(\seqLSin, \amp, Pseg([Pseq([0.2,0]),Pseq([20])]));