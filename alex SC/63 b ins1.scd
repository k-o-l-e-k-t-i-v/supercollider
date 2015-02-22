(

SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*3,freq], [sustain*0.05],\welch),gate);
	sig=Mix.fill(5, {SinOsc.ar(fenv*(1..10))})*env*amp;
	sig=Limiter.ar(FreeVerb.ar(sig,room:1,damp:0),0.7);

	Out.ar(0,sig);
}).add;

SynthDef(\dribble, {
	arg gate=1, sustain=1, freq=40, amp=1,lag;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	sig=BPF.ar(BrownNoise.ar(amp),freq:freq+SinOsc.kr(freq*2).range(40,20),
		rq:SinOsc.kr(freq).range(0.01,0.1));
	sig=sig+Mix.fill(4,{LFSaw.ar(freq,mul:0.5).lag(lag)});
	sig=Limiter.ar(sig,0.2);
	sig=FreeVerb.ar(sig,room:1,damp:1,add:sig);

	sig=DelayN.ar(sig,0.4,delaytime:0.2);
	Out.ar(0, sig*amp);
}).add;


SynthDef(\woosh, {
	arg gate=1, sustain=0.2, freq=3000, amp=1;
	var sig, env,fenv;


	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain],\welch),gate);

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(5000).range(0.2,0.8));
	sig=HPF.ar(sig,16000);
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig,SinOsc.kr(0.5));

	sig=DelayN.ar(sig,0.8,delaytime:0.6);

	Out.ar(0,sig*amp);



}).add;
)

s.scope(2);


(
Pdef( \loopall,

	Ppar([
		Pbind(
			\instrument, \bum,
			\dur, 4,
			\legato, Pseq([Pn(0.25,3),Pn(0.5,4)],inf),
			\freq, [45,47,48],
			\amp, 0.2
		),
		Pbind(
			\instrument, \dribble,
			\dur, 4,
			\legato, Pseq([Pn(0.5,3),Pn(0.3,4)],inf),
			\freq, [55,55.5,55.8],
			\lag, Pseq([Pn(0.02,3),Pn(0.001,4)],inf),
			\amp, 0.5,
		),
		Pbind(
			\instrument, \woosh,
			\dur, 4,
			\legato, Pseq([Pn(0.7,3),Pn(0.3,4)],inf),
			\freq, Pseq([Pn(3000,3),Pn(8000,4)],inf),
			\amp, Pseq([Pn(2,3),Pn(0.5,4)],inf),
	)],inf);
).play;
)

