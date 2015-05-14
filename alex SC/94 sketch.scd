p=ProxySpace.push(s);
s.plotTree;

(
ProxySynthDef(\pulse, {
	arg sustain, amp;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\n.kr,[WhiteNoise.ar(0.35!2),PinkNoise.ar(0.7).softclip(0.5,1), BrownNoise.ar(0.3)]);

	env=EnvGen.kr(Env([0,1,0],[0.25,0.75],\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr,\f2.kr],[sustain*0.1],\welch),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(fenv,iphase:0.7)*BPF.ar(noise,fenv,add:noise*0.5)*env*amp;
}).add;
)

(
~d.play(fadeTime:2);
~d.quant=2;

~d[0]=Pbind(\instrument, \pulse,
	\dur, 8,
	\legato, 0.7,
	\freq, 10,
	\f2, 1,//Penv([0,200,10],[Pkey(\dur)*0.01,Pkey(\dur)*0.99]),
	\n, Pseq([0,1,2],inf),
	\amp, 0.3);
~d[1]=\filter-> {arg in; GVerb.ar(in,roomsize:50,revtime:2,
	spread:SinOsc.kr(\mix.kr).range(10,20))};
~d[2]=\set->Pbind(\args, [\mix], \mix, 0.5);
~d[3]=\filter->{arg in; LPF.ar(in,400)+in};
)
