//gril party




SynthDef(\ripple, {
	arg gate=1, sustain=1, freq=40,f2, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq], [sustain*0.05],\welch),gate);

	sig=BPF.ar(GrayNoise.ar(amp),fenv,SinOsc.kr(f2).range(0.001,1))*env;
	sig=Limiter.ar(Pan2.ar(sig,SinOsc.kr(f2)),0.7)*env*amp;
	sig=FreeVerb.ar(sig,mix:0.5,room:0.5,damp:1);

	Out.ar(0,sig);
}).add;


(
Pdef(\loprip1,
	Pbind(
		\instrument, \ripple,
		\dur, 0.5,
		\freq,Pseq([700,Pn(400,2),300],inf),
		\amp, 0.6,
		\legato,0.4,
		\f2,1,
)).play(quant:2);
)
Pdef(\lopup1).stop;



ProxySynthDef(\bum2, {
	arg sustain, amp, voln, f2;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!2,
		add:HPF.ar(WhiteNoise.ar(voln).clip(0.05,0.1),Saw.kr(2).range(11000,f2))

	)*env*amp;
}).add;

(
~b1.quant=1;
~b1.play;
~b1.mold(4);
~b1[0]=Pbind(
	\instrument, \bum2,
	\dur, Pseq([0.25,0.25,0.25,0.25, Rest(0.25), 0.25, Rest(0.5)],inf),
	\legato, 1.2,
	\voln, Pseq([
		Pseq([Pn(0,7)],2),
		Pseq([0,0.2,0,0,0,0.1,0],4),
		Pseq([0,0.2,0,0.1,0,0.3,0],4),
		Pseq([0,0.6,0,0,0,0.5,0],2)],inf),
	\f2, Pseq([Pn(4000,14), Pn(8000,7)],inf),
	\amp, 0.6,
	\octave,2,
	\degree, Pseq([2,6,4,2,7,6,4],inf),
);
~b1[30]=\filter -> {arg in; FreeVerb.ar(in,room:0.25,damp:1)};


)