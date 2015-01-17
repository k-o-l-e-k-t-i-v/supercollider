s.scope(2);

(


Ndef(\1).fadeTime=2;
Ndef(\1).quant=1;

Ndef(\1, {
	var freq, beat, sig;

	freq=Select.kr(Duty.ar(1,level:[60,65,700,75,800,85,2000,40,1200]));
	beat=Select.kr(Duty.kr(Dseq([0.5,0.2].lag(0.5),inf),0,Dseq([0,2,2,1],inf)),
		[SinOsc.ar([freq,freq+15]), Saw.kr([4/3*4,4/3]), VarSaw.ar([30,freq])]);

	sig=VarSaw.ar(freq)*beat;
	sig=Limiter.ar(sig, 0.081);


}).play;

)


(
SynthDef(\lo, {

	arg freq=70, gate=1,sustain=0.5, amp=0.5;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2, sustain*0.1, sustain*0.4,sustain*0.3,curve:4),gate,doneAction:2);
	sig=BPF.ar(LFPulse.ar,[freq, freq], SinOsc.kr(LFNoise0.kr(0.2).range(25,100).round(5)).range(0.01,1),amp);
	sig=env*sig;


	Out.ar(0, sig);

}).store;
)

(
Pdef( \looplo,
	Pbind(
		\instrument, \lo,
		\dur, Pseq([0.11,0.25],inf),
		\legato, Pseq([0.8, 0.6],inf),
		\freq, Pseq([Pseq([75,60],4),Pwhite([150,165],4)],inf),
		\amp, 5
	).play;
)
)


(

SynthDef(\hi, {
	arg gate=1, freq=700, sustain=0.4, amp=0.9;
	var sig, env, fr;

	fr=EnvGen.kr(Env([freq*3, freq], [sustain*0.5],curve:\welch));
	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.1,sustain*0.6,curve:-4),gate,doneAction:2);

	sig=Mix.fill(3, {arg i; SinOsc.ar([fr,fr+i],[0,1.5pi]).lag(0.1)*VarSaw.ar(fr/100)});
	sig=LPF.ar(sig, 8000,amp);
	sig=sig*env;

	Out.ar(0, sig);
}).store;
)

(
Pdef( \lophi,

	Pbind(
		\instrument, \hi,
		\dur, 0.2,
		\legato, Pseq([0.5,0.3],inf),
		\freq, Pseq([600,Prand([200, 400, 600],2),60],inf),
		\amp,1,
	).play;

))




(
SynthDef.new(\pic, {
	arg freq=65, gate=1, sustain=0.3, amp=0.5;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.15,sustain*0.15,sustain*0.2,sustain*0.3,curve:4),
		gate:gate, doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq],[sustain*0.1],curve:\welch));

	sig=Pulse.ar([fenv,fenv+0.225],mul:amp)*env;
	// sig=LPF.ar(sig,300);

	Out.ar(0,sig);

}).store;
)

s.scope(2);

(
Pdef( \loppic,
	Pbind(

		\instrument, \bum,
		\dur, 0.2,
		\legato, Pseq([0.1,0.2],inf),
		\freq, Pseq([420, 320, Prand([2000,4000,1000],3),85],inf),
		\amp,0.5,
	).play;
)
)


(SynthDef(\um, {

	arg gate=1, freq=50, dur=2,sustain=2, amp=0.9;
	var sig, env, fr;

	env=EnvGen.kr(Env.adsr(sustain*0.5,sustain*0.1,sustain*0.2,sustain*0.2),gate, doneAction:2);
	fr=Sweep.kr(env,0.1).range(freq, freq*10);

	sig=GrainFM.ar(2,
		trigger:env,
		dur:dur,carfreq:fr,
		modfreq:SinOsc.ar([freq,freq+0.654]),
		mul:amp);
	sig=Limiter.ar(sig, 0.1);

	Out.ar(0, sig);
}).store;
)


(
Pdef( \loopum,
	Pbind(
		\instrument, \um,
		\dur, 0.2,
		\legato, Pseq([0.8,0.6],inf),
		\amp, 1,
		\freq, Pseq([110, Prand([88, 44,66],2),55,66],inf),
	).play;

)
)


(
SynthDef(\pic, {

	arg gate=1, freq=2000, sustain=0.1, amp=2;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.5,sustain*0.1,sustain*0.2,sustain*0.2),gate, doneAction:2);
	sig=HPF.ar(WhiteNoise.ar,freq,amp)*env;




