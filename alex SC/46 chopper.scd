s.scope(2);
(

SynthDef(\wrum, {
	arg gate=1, freq=65, freq2=5, amp=0.6, sustain=2;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.4,sustain*0.3,curve:-4),gate);

	sig=VarSaw.ar(freq2)*
	Mix.fill(5, {arg i; BPF.ar(BrownNoise.ar,[freq-i,freq+i],SinOsc.kr(freq2).range(0.01,0.1))});

	sig=FreeVerb.ar(sig,0.8,2,0,add:sig);
	sig=sig*env*amp;
	DetectSilence.ar(sig,0.001,doneAction:2);

	Out.ar(0,sig);

}).add;
)

(
Pdef (\lowrum,
	Pbind(
		\instrument, \wrum,
		\dur, 5,
		\legato, 0.3,
		\freq, 85,
		\freq2, 15,
		\amp, 0.9,
)).trace.play(quant:2);

)

{Limiter.ar(LFSaw.ar([450,450.02]).lag(0.02)+LFSaw.ar([470,470.02]).lag(0.02)+LFSaw.ar([500,500.03]).lag(0.02),0.6)}.play;
{Limiter.ar(VarSaw.ar([450,450.02])+VarSaw.ar([470,470.02])+VarSaw.ar([500,500.03]),0.6)}.play;
{Limiter.ar(SinOsc.ar([450,450.0257])+SinOsc.ar([470,470.029984])+SinOsc.ar([500,500.032142]),0.6)}.play;


(

SynthDef(\ump, {
	arg gate=1, freq=65, freq2=5, amp=0.6, sustain=2;
	var sig, env;
	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.4,sustain*0.3,curve:-7),gate,doneAction:2);
	sig=Mix.fill(10,
		{arg i;SinOsc.ar([freq,freq+i/12])+SinOsc.ar([freq-2,(freq-2)-i/13.5])+SinOsc.ar([freq-4,freq-4-i/14.8])});
	sig=Limiter.ar(sig, 1);
	sig=FreeVerb.ar(sig,0.5,0.8,0);
	sig=sig*env*amp;


	Out.ar(0,sig);

}).add;
)


(
Pdef(\loopump,
	Pbind(
		\instrument, \ump,
		\freq, Pseq([Pn(60,4),75,90,Prand([90,105],2)],inf),
		\amp,1.3,
		\dur, 1,
		\legato, Pseq([0.8,0.5],inf),
)).play(quant:2);
)



(
SynthDef(\long, {
	arg gate=1, freq=110, sustain=3,amp=0.8;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.4,sustain*0.1,sustain*0.1,sustain*0.4),gate);
    sig=Mix.fill(8,
		{arg i; LFSaw.ar([freq,freq*i],mul:amp).lag(0.2)});
	sig=FreeVerb.ar(sig*env,0.5,1,0);
	sig=Limiter.ar(sig,0.5);

	DetectSilence.ar(sig,doneAction:2);
	Out.ar(0,sig);


}).add;
)



(
Pdef(\looplong,
	Pbind(
		\instrument, \long,
		// \freq, Pseq([110,110,220,440,110],inf),
		\octave, Pseq([Pn(4,2),5,Prand([4,7,6],2)],inf),
		\degree, Pseq([[1,3]],inf),
		\amp,1.5,
		\dur, Prand([1.5,2,1.75],inf),
		\legato, 2,
)).trace.play(quant:2);
)

(
Pdef(\looplong2,
	Pbind(
		\instrument, \long,
		\octave,  Pseq([3,5,Prand([4,8],1),7,4],inf),                                        //Pseq([[4,5],[5,6],5,[4,6],5,7],inf),
		\degree, Pseq([[1,5],[2,6],[1,3,5],[2,4,6]],inf),
		\amp,0.51,
		\dur,Prand([3,2.75,1.55],inf),
		\legato, Prand([2,1.75,1.5],inf)
)).trace.play(quant:2);
)

(

SynthDef(\mm, {
	arg gate=1, freq=65, freq2=5, amp=0.6, sustain=0.5,top=4,time=0.1;
	var sig, env,fenv, osc;

	osc=Saw;
	// osc=Select.kr(Stepper.kr(Impulse.kr(1),max:3),[SinOsc,LFPulse,VarSaw,Saw]);

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.4,sustain*0.3,curve:-4),gate);
	fenv=EnvGen.kr(Env([freq*top,freq/1.2],[sustain*time],\welch),gate);
	sig=Mix.fill(10,
		{arg i;osc.ar([fenv,fenv+i/12],mul:amp).lag(0.02)});
	sig=FreeVerb.ar(sig,0.8,0.1);
	sig=Limiter.ar(sig, 0.9);
	sig=sig*env;
	DetectSilence.ar(sig,doneAction:2);


	Out.ar(0,sig);

}).add;
)

(
Pdef(\loopmm,
	Pbind(
		\instrument, \mm,
		\freq, Pseq([Pn(75,6),Pn(60,3),Pn(90,3),Prand([145,130,105],1)],inf),
		\top, Pseq([4,4,8,9],inf),
		\time, 1.5,
		\dur, Pseq([Pseries(0.5,(-0.1),5),0.1,0.15,0.15],inf),
		\legato, Pseq([Pn(0.8,2),0.4,0.7],inf),
		\amp,1,

	)
).trace.play(quant:2);
)

(

Pdef(\loopmm2,
	Pbind(
		\instrument, \mm,
		\freq, Pseq([Pn(75,6),Pn(60,3)],inf),
		\top, Pseq([4,4,2],inf),
		\time, 0.05,
		\dur, 0.45,
		\legato, Pseq([Pn(0.8,2),0.4],inf),
		\amp,1,
	)
).play(quant:2);
)


(
SynthDef(\test, {
	arg gate=1, freq=440, trig=1, sustain=0.7;
	var sig, env, ffreq;

	env=EnvGen.kr(Env.adsr(sustain*0.2, sustain*0.3, sustain*0.1, sustain*0.4),gate, doneAction:2);
	ffreq=Decay2.kr(trig,sustain*0.1,sustain*0.9).range(8,80);
	// ffreq=Select.kr(Stepper.kr(trig,trig,max:3),[800,200,300,100]);

	sig=SinOsc.ar(ffreq)*env;
	sig=Limiter.ar(sig, 0.4);


	Out.ar(0, sig);

}).play;
)


(
Pdef (\looptest,
	Pbind(
		\instrument, \test,
		// \trig, 1,
		\dur, 0.5,
		\freq, 440,
		\legato, 0.8,
)).play;
)










