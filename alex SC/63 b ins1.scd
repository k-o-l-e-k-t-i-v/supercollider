(

SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*3,freq], [sustain*0.05],\welch),gate);
	sig=Mix.fill(5, {SinOsc.ar(fenv*(1..10))});
	sig=FreeVerb.ar(sig,mix:0.5,room:2,damp:1);
	sig=Limiter.ar(sig,0.7)*env*amp;

	Out.ar(0,sig);
}).add;

SynthDef(\dribble, {
	arg gate=1, sustain=1, freq=40, amp=1,lag;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	sig=BPF.ar(BrownNoise.ar(amp),freq:freq+SinOsc.kr(freq*2).range(40,20),
		rq:SinOsc.kr(freq).range(0.01,0.1));
	sig=sig+Mix.fill(4,{LFSaw.ar(freq!4,mul:0.5).lag(lag)});
	sig=Limiter.ar(sig,0.2);
	sig=FreeVerb.ar(sig,room:1.5,damp:1,add:sig);

	sig=DelayN.ar(sig,0.4,delaytime:0.2);
	Out.ar(0, sig*amp*env);
}).add;


SynthDef(\woosh, {
	arg gate=1, sustain=0.2, freq=3000, amp=1;
	var sig, env,fenv;


	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain],\welch),gate);

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(5000).range(0.2,0.8));
	sig=HPF.ar(sig,16000);
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig*env,SinOsc.kr(0.5));

	sig=DelayN.ar(sig,0.8,delaytime:0.6);

	Out.ar(0,sig*amp);
}).add;


SynthDef(\tictum, {
	arg gate=1, sustain=0.2, freq=1000, amp=1;
	var sig, env,fenv;


	 env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*10,freq], [sustain*0.8],\welch),gate);

	sig=BPF.ar(LFSaw.ar(20).lag(0.002),fenv,0.5,mul:SinOsc.kr(50).range(0.2,0.8));
sig=HPF.ar(CombN.ar(sig,maxdelaytime:0.1,delaytime:0.1,decaytime:sustain*0.5),800);
	sig=FreeVerb.ar(sig,room:2,damp:0.8,add:sig);
	sig=Pan2.ar(sig,SinOsc.kr(0.5));

	sig=DelayN.ar(sig,sustain/2,delaytime:0.6);

	Out.ar(0,sig*amp);
}).add;

SynthDef(\uup, {
	arg gate=1, sustain=0.1, freq=14000, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate);
	fenv=EnvGen.kr(Env([freq*3,freq], [sustain*0.05],\welch),gate);
	sig=HPF.ar(WhiteNoise.ar(amp),freq)*env;
	sig=FreeVerb.ar(sig,room:2,damp:0);

	DetectSilence.ar(sig,amp:0.051,doneAction:2);
	Out.ar(0,sig);
}).add;


SynthDef(\tiiing, {
	arg gate=1, sustain=0.1, freq=18000, amp=1,pan;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.2,0.5,sustain*0.6),gate);

	sig=SinOsc.ar(freq)*env;
	sig=FreeVerb.ar(sig,room:1,damp:0)*amp;
	sig=Pan2.ar(sig,pos:pan);

	DetectSilence.ar(sig,amp:0.01,doneAction:2);
	Out.ar(0,sig);
}).add;
)

s.scope(2);


(
Pdef( \loopall,

	Ppar([
		Pbind(
			\instrument, \bum,
			\dur, 4,
			\legato, Pseq([Pn(0.25,3),Pn(0.5,4),Pn(0.7,2),Pn(0.5,5)],inf),
			\freq, Pseq([Pn(45,3),Pn(65,2),Pn(55,2)],inf),
			\amp, 0.8
		),
		Pbind(
			\instrument, \dribble,
			\dur, 4,
			\legato, Pseq([Pn(0.5,3),Pn(0.3,4)],inf),
			\freq, [55,55.5,55.8],
			\lag, Pseq([Pn(0.02,3),Pn(0.001,2),Pn(0.01,2)],inf),
			\amp, 0.5,
		),
		Pbind(
			\instrument, \woosh,
			\dur, 4,
			\legato, Pseq([Pn(0.4,3),Pn(0.3,4)],inf),
			\freq, Pseq([
				Pseq([Pn(3000,3),Pn(8000,4)],2),
				Pseq([Pn(2000,3),Pn(7000,4)],2)],inf),
			\amp, Pseq([Pn(0.5,3),Pn(0.8,4)],inf),
		),
		Pbind(
			\instrument, \tictum,
			\dur, Pseq([Rest(2),4],inf),
			\legato, 0.8,
			\freq,
			Pseq([
				Pseq([Pn(1000,3),Pn(800,4)],1),
				Pseq([Pn(2000,3),Pn(700,4)],1)],inf),
			\amp, Pseq([Pn(0.5,3),Pn(0.7,4)],inf),
		),
		Pbind(
			\instrument, \uup,
			\dur, Pseq([Rest(2),1,1],inf),
			\legato, Pseq([
				Pseq([1,0.1,0.02],1),
				Pseq([1,0.2,0.3],2)],inf),
			\freq, 14000,
			\amp, 0.8
		),
		Pbind(
		\instrument, \tiiing,
		\dur, Pseq([
				Pseq([Rest(12),Pn(1,4)],1),
				Pseq([Rest(6),Pn(0.5,6),Pn(1,4),Pn(0.5,4),1],1),
				Pseq([Rest(10),Pn(0.5,6),Pn(1,3)],inf),],inf),
		\legato, Pseq([1,0.1,0.2,0.1,0.15],inf),
		\freq, 18000,
		\amp, 1.5,
		\pan, Pseq([0,Pseq([-1,1],2)],inf),
	)
	],inf);
).play;
)



