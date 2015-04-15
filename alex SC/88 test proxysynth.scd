p=ProxySpace.push(s);

p.clock=TempoClock.default;

(
ProxySynthDef(\name1, { arg freq, amp, pan, sustain, t_gate=1, out=0;
	var sig, env, fenv;

	env=EnvGen.kr(Env.perc(releaseTime:sustain),t_gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*4,freq],sustain*0.04),t_gate,timeScale:sustain);
	sig=Pan2.ar(SinOsc.ar(fenv)*env,pan);
	Out.ar(out,sig*amp);

}).add;




ProxySynthDef(\k, { arg freq, lag,amp; Saw.ar([freq,freq]).lag(lag)*amp}).add;
)

(
~d.play;

~d[0]=Pbind(\instrument, \name1,
	\dur, 0.8,
	\legato, 0.8,
\freq, 65,
	\amp, 1,
	\pan, Pseq([Pseries(-1,0.25,4), Pseries(1,-0.25,4)],inf)
);
)
(
~d.play;
~d[0]=Pbind(\instrument, \k,
	\dur, 2,
	\octave, Pseq([4,6,5],inf),
	\degree, [1,9,2,4,5],
	\strum,0.25,
	\legato, [0.5,1,0.2,1.2],
	\amp, 1,
	\lag, 0.02).trace;
)
~d[30]=\filter-> { arg in; FreeVerb.ar(in,2,add:in)};

~d.removeAt[30];
~d.clear;
currentEnvironment.free;