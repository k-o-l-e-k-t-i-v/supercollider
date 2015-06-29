p=ProxySpace.push(s);

(
ProxySynthDef(\bur, {
	arg amp, sustain, freq, gate=1;
	var sig, env;
	env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	sig=BPF.ar(
		PinkNoise.ar(1!4),
		freq:[freq, freq+[2,4,6,8], freq+[20,40,60]],
		rq:LFNoise0.kr(20).range(0.0001,0.001));
	sig*env*amp;
}).add;
ProxySynthDef(\ll, {
	arg sustain, gate=1, amp, freq;
	var sig, env, fenv,fn;
	env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*5, freq], [sustain*0.04],\welch),gate);
	fn=EnvGen.kr(Env.new([0.001, 0.5], [sustain*0.4],\welch),gate);
	sig=Mix.fill(20, {arg i; SinOsc.ar(fenv+i,add:GrayNoise.ar(fn).clip(0.1,0.4)*LFSaw.kr(\f2.kr))})*env;
	sig*env*amp;}).add;


)

(
~w.play;
~w.fadeTime=1;
~w.quant=1;
~w[0]=Pbind(\instrument, \bur,
	\dur, 2,
	\octave, 6,
	\degree,[2,6,8,4,6,8],
	\strum ,2,
	\amp, 30

);

// ~w[30]=\filter->{arg in; GVerb.ar(in,1.2,3)};
)

~w.clear;

(
~r.play;
~r.fadeTime=1;
~r.quant=1;
~r[0]=Pbind(\instrument, \ll,
	\dur, 4,
	\freq, [65,67],
	\legato, 0.2,
	\f2, 2,
	\amp, 1
);
~r[30]=\filter->{arg in; FreeVerb.ar(in, room:0.6

)};
)