s.plotTree;

(
~mixGroup = Group.new;
~synthGroup = Group.new;

~chAmp = Bus.control(s, 1);
~fader = Synth(\fader, [\out,0,\in,30,\amp, ~chAmp.asMap], ~mixGroup);
)

(
SynthDef(\testSin, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.ar(Env.asr(0.1*sustain, 1,0.9*sustain),gate, doneAction:2);
	var osc = SinOsc.ar([freq, freq],0,1);
	var tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;
SynthDef(\fader, { | out = 0, in, mute = 1, amp = 0.3 |
	Out.ar(out, In.ar(in, 2) * mute * amp)
}).add;
SynthDef(\sinenv, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;
)

(
Pdef(\test,
	Pbind(\instrument, \testSin, \out, 30, \group, ~synthGroup.nodeID,
		\amp, 1,
		\dur, 1, \legato, 1.4,
		\octave, 3,
		\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
	)
).play;
)

Synth(\sinenv,[\bus,~chAmp, \target, 0.4, \time, 8],~mixGroup);
~chAmp.set(0.1);
~chAmp.set(0.3);
Synth(\sinenv,[\bus,~chAmp, \target, 0.0, \time, 15],~mixGroup);

(
Pdef(\test).stop;
~fader.free;
)