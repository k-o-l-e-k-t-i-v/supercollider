(
SynthDef(\rq1, {
	arg gate=1, freq=85,sustain=1,amp=1,wide,rqq=0.001;
	var sig, env,rq;
	rq=EnvGen.kr(Env.new([0.1,0.005,2,0.01,0.001,0.5,3],[sustain*0.1,sustain*0.1,sustain*0.1,sustain*0.1,sustain*0.2,sustain*0.4]),gate);

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.2,0.7,sustain*0.7),gate);
	sig=BPF.ar(PinkNoise.ar(amp),freq,rq);
	sig=sig*env;
	sig=FreeVerb.ar(sig,room:1);
	DetectSilence.ar(sig,doneAction:2);
	Out.ar(0,sig);
}).add;
)

(
SynthDef(\rq2, {
	arg gate=1, freq=85,sustain=1,amp=1,wide,rqq=0.001;
	var sig, env,rq, fenv;

	rq=EnvGen.kr(Env.new([0.0001,0.2,0.6,0.0001],[sustain*0.2,sustain*0.1,sustain*0.7]),gate);
	fenv=EnvGen.kr(Env.new([freq*4,freq],[sustain*0.02]),gate);

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.2,0.7,sustain*0.7),gate,doneAction:2);

	sig=BPF.ar(BrownNoise.ar(1),freq,rq)+(SinOsc.ar(freq+fenv!2)*0.0052);
	sig=sig*env*amp;

	// sig=FreeVerb.ar(sig*amp,room:0.5);
	// /*DetectSilence.ar(sig,doneAction:2);*/
	Out.ar(0,sig);
}).add;
)

(
Pdef(\looprq1,
	Pbind(
		\instrument, \rq1,
		\dur, Pseq([Pn(0.25,6),4,Rest(3)],inf),
		\legato, 0.4,
		\freq, [950,45,175,50,40,850,110,65,45],
		\strum,0.001,
		// \rqq,0.1,
		\amp, 1
)).play;
)


(
Pdef(\loop2rq1,
	Pbind(
		\instrument, \rq1,
		\dur, 4,
		\legato, 0.4,
		\freq, [950,45,175,50,40,850,110,65,45],
		\strum,0.001,
		// \rqq,0.1,
		\amp, 1
)).play;
)


(
Pdef(\loop1rq2,
	Pbind(
		\instrument, \rq2,
		\dur, Pseq([0.5],14),
		\legato, 0.2,
		\freq, [145,220,55,65,45],
		\strum,0.1,
		// \rqq,0.1,
		\amp, 2
)).play;
)































