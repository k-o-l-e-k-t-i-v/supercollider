p=ProxySpace.push(s);
p.clock=TempoClock.default;

(
ProxySynthDef(\name1, { arg freq, amp, pan; Pan2.ar( SinOsc.ar(freq,add:BrownNoise.ar(0.051))*amp,pan)}).add;
ProxySynthDef(\k, { arg freq, lag,amp; Saw.ar([freq,freq]).lag(lag)*amp}).add;
)

(
~d.play;

~d[0]=Pbind(\instrument, \name1,
	\dur, 0.25,
	// \strum, 0.5,
	\octave, [4,3],
	\degree, 4,
	\amp, 0.21,
	\pan, Pseq([-1,1],inf)
).trace;
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