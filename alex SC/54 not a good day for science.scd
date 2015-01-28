s.freeAll;
s.scope(2);

(
SynthDef(\melo, {
	arg gate=1, sustain=0.7,amp=1, freq=50,room=0.2,pan=0, fund=20, n=[1,2,3,4];
	var sig, env,fenv;

	freq=fund*n;

	fenv=EnvGen.kr(Env([freq*5,freq], [sustain*0.05],curve:\welch),gate);
	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.2,sustain*0.4),gate,doneAction:2);

	sig=Limiter.ar(Mix.fill(5, {arg i; SinOsc.ar(fenv)}),0.7);
	sig=FreeVerb.ar(Pan2.ar(sig,pan),room);

	Out.ar(0, sig*env*amp);

}).add;

SynthDef(\hi, {
	arg gate=1, sustain=0.7,freq=2000,room=0.2, amp=1,f2=100;
	var sig, env, fenv;

	env=EnvGen.kr(Env.perc(sustain*0.1,sustain*0.9),gate,doneAction:2);
	fenv=EnvGen.kr(Env([0.5,0.01],[sustain*0.5],\welch),gate);
	sig=BPF.ar(WhiteNoise.ar,LFNoise0.kr(f2).range(freq*5,freq),fenv);
	sig=LPF.ar(sig,freq);
	sig=FreeVerb.ar(sig,room)*env;
	Out.ar(0,sig*amp);


}).add;

SynthDef(\sin, {
	arg freq=45,gate=1,sustain=0.7,amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.4,sustain*0.1,sustain*0.1,sustain*0.4),gate,doneAction:2);
	sig=SinOsc.ar([freq,freq+0.254]!5)*env;

	Out.ar(0,sig*amp);
}).add;




)

s.scope(5);

(

Pdef( \looplo,
	Pbind(
		\instrument, \melo,
		\fund, Pseq([
			Pseq([200,400,20],8),

			Pseq([400,200,20],6),
			Pseq([200,200,20],2),

			Pseq([100,200,20],4),
			Pseq([400,200,20],2),
			Pseq([100,100,20],6),

		],inf),
		\n, Pseq([
			Pseq([[1,3,5],[4,6,8]],10),
			Pseq([[2,1,3],[4,6,8]],4),

		],inf),

		\amp,Pseq([0.8,0.8,0.1],inf),
		\dur, Pseq([0.1,0.1,0.25],inf),
		\legato, Pseq([0.8,0.8,2],inf),
		\room,0.5,
		\pan,Pseq([-1,1],inf)

)).play(quant:2);


Pdef( \loophi,
	Pbind(
		\instrument, \hi,
		\freq, 100,
		\f2, 100,
		\dur, 0.45*8,
		\amp,2,
		\legato, 1.1,
		\room,0.1
)).play;


Pdef( \loopsin,
	Pbind(
		\instrument, \sin,
		\freq,Pseq([50,65,75],inf),
		\dur, 0.45*8,
		\amp,0.021,
		\legato,1.1,

)).play;


)
