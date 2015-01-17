s.scope(2);

(

SynthDef.new(\lop, {
	arg gate=1, freq=440, sustain=2, amp=1, grr=80;
	var sig, env;

	env=EnvGen.kr(Env.adsr(0.5*sustain,0.1*sustain, 0.1*sustain,0.3*sustain,curve:4),gate,doneAction:2);


	sig=Mix.fill(5, {CombN.ar(SinOsc.ar([freq+0.5,freq+1])*VarSaw.ar(grr),0.2,15,8,5)});
	sig=Limiter.ar(sig, amp);
	sig=sig*env;


	Out.ar(0, sig);
}).store;

)
(
Pdef( \testlop,

	Pbind(\instrument,  \lop,
		\dur, Prand([1,1.5,2.5],inf),
		\legato, 2.4,
		\amp, 0.02,
		\octave, Prand([3,4,5,6],inf),
		\grr, Pseq(Array.fill(10,{arg i; 25*i}),inf),
	);
).trace.play;

Pdef( \554,

	Pbind(\instrument,  \lop,
		\dur, 0.8,
		\legato, Pseq([1,0.9],inf),
		\amp, 0.7,
		\octave, 2,
		\note, 10,
		\grr, 5,
	);
).trace.play;
)