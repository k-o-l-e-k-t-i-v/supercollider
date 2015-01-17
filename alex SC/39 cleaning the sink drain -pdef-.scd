(

SynthDef(\long1, {
	arg gate=1, freq=120, sustain=2, pend=20, amp=0.8;
	var sig, sig2, env;

	env=EnvGen.kr(Env.adsr
		(0.1*sustain,0.4*sustain,0.4*sustain,0.1*sustain,curve:-4),
		gate,doneAction:2);

	sig=Mix.fill(10, {arg i; VarSaw.ar([freq+(i/pend),freq-(i/pend*2)],width:0.5)});
	sig=Limiter.ar(sig,amp);
	sig=sig*env;

	Out.ar(0,sig);
}).play;
)


(

SynthDef(\bum, {
	arg gate=1,freq=65, sustain=0.7, amp=0.8;
	var sig, env, envf;

	env=EnvGen.kr(Env.adsr(0.1*sustain,0.8*sustain,0.1*sustain,0*sustain,curve:5),
		gate:gate);

	envf=EnvGen.kr(Env.new([freq*5,freq],[sustain/10],\welch));

	sig=Mix.fill(15,{arg i; SinOsc.ar([envf+i,envf-i])})*LFPulse.ar(envf,width:sustain);
	sig=sig*env;
	sig=LPF.ar(sig,200);
	sig=FreeVerb.ar(sig,0.8,0.5,add:sig);
	sig=Limiter.ar(sig,amp);
	DetectSilence.ar(sig,doneAction:2);

	Out.ar(0, sig);

}).play;

)



(

Pdef( \testlong,
	Ppar([
		Pbind( \instrument, \long1,
			\dur, Pseq([Rest(4),Pn(4,inf)],inf),
			\amp, 0.11,
			\legato, 1.1,
			\octave, Pseq([[4,5],[5,3],[4,5],[5,2],5,4],inf),
			\note, 5,
			\pend, 20,
		),
		Pbind( \instrument, \long1,
			\dur,Pseq([Rest(0.5),Rest(1.5)],inf),   ///working on it
			\amp, 0.11,
			\legato, 0.5,
			\octave, Pseq([6,7],inf),
			\note, 5,
			\pend, 20,
		)


	],inf);

).trace.play(quant:1);

Pdef( \testbum,
	Pbind( \instrument, \bum,
		\dur, Pseq([Pn(0.5,6),Pn(0.25,4)],inf),
		\amp, 0.7,
		\legato, Pseq([0.5,0.7], inf),
		\freq, Pseq([Pn(45,6),Pn(65,4)],inf),
	);
).play;
)