(
SynthDef(\k, {
	arg gate=1, freq=85,sustain=1,amp=1,wide,rqq=0.001;
	var sig, env,rq;
	rq=EnvGen.kr(Env.new([0.1,0.005,2,0.01,0.001,0.5,3],[sustain*0.1,sustain*0.1,sustain*0.1,sustain*0.1,sustain*0.2,sustain*0.4]),gate);

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.2,0.7,sustain*0.7),gate);
	sig=BPF.ar(PinkNoise.ar(amp),freq,rq);
	sig=sig*env;
	sig=FreeVerb.ar(sig,room:2);
	DetectSilence.ar(sig,doneAction:2);



	Out.ar(0,sig);



}).add;
)


(
Pdef(\lopk,
	Pbind(
		\instrument, \k,
		\dur, Pseq([Pn(0.2,6),4,Rest(3)],inf),
		\legato, 0.4,
		\freq, [950,450,1075,850,440,850,110,65,45],
		\strum,0.01,
		// \rqq,0.1,
		\amp, 1
)).play;
)