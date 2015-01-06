s.scope(2);

(
SynthDef.new(\pn, {
	arg gate=1, freq=440, freq2=44, sustain=0.4;
	var sig, env;

	sig=MdaPiano.ar(freq,gate,vel:20,decay:0.8,release:0.4,sustain:0.8);
	DetectSilence.ar(sig,amp:0.1,doneAction:2);
	sig=Limiter.ar(sig,0.5);

	Out.ar(0,sig);

}).store;
)

(
SynthDef.new(\bum, {
	arg freq=65, gate=1, sustain=0.3, amp=0.5;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.15,sustain*0.15,sustain*0.2,sustain*0.3,curve:4),
		gate:gate, doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq],[sustain*0.1],curve:\welch));

	sig=SinOsc.ar([fenv,fenv+0.225],mul:amp)*env;
	// sig=LPF.ar(sig,300);

	Out.ar(0,sig);

}).store;
)



(
Ppar(\thm,
	Pbind(
		\instrument, \pn,
		\freq2, 20,
		\octave, 5,
		\note,
		Pseq(
			[Pseq([Pn(3,12),Pn([1,3],4),5],6),
				Pseq([Pn(5,12),Pn([1,3],4),3],6),
				Pseq([Pn(3,12),Pn([1,3],4),5],6)],
			inf),

				\dur,  0.35,
				\legato, 0.3,
				\amp, Pseq([Pn(0.8,12),Pn(0.9,4),0.8],inf)
			).play;

			Pbind(
				\instrument, \bum,
				\freq, 95,
				\dur, Pseq([Pn(Rest(2.8),2),Pseq([0.35,Rest(0.35)],inf)],inf),
				\legato, Pseq([1,0.5],inf),
				\amp, Pseq([0.1,0.3],inf),
			).play;

		)
)


