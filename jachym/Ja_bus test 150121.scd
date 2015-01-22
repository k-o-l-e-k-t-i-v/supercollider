s.plotTree;
(
~synG = Group.new;
~efxG = Group.new(~synG, \addAfter);
~mixG = Group.new(~efxG, \addAfter);
)

(
SynthDef(\ampFader, { | out = 0, bus, mute = 1, amp = 0.0 |
	Out.ar(out, In.ar(bus, 2) * mute * amp)
}).add;
SynthDef(\fShift, { | bus target dur |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [dur], \sin), doneAction: 2))
}).add;
)

(
~ch = Bus.audio(s,2);
~chAmp = Bus.control(s, 1);
~chAmpFader = Synth(\ampFader, [\out,0,\bus,30,\amp, ~chAmp.asMap], ~mixG);
)


(
SynthDef(\testSin, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.ar(Env.asr(0.1*sustain, 1,0.9*sustain),gate, doneAction:2);
	var osc = SinOsc.ar([freq, freq+10],0,1);
	var tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;
)
(
Pdef(\test,
	Pbind(\instrument, \testSin, \out, 30, \group, ~synG,
		\amp, 1,
		\dur, 1, \legato, 1.4,
		\octave, 3,
		\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
	)
).play;
)

Synth(\fShift,[\bus,~chAmp, \target, 0.4, \dur, 8],~mixG);
~chAmp.set(0.0);
~chAmp.set(0.3);
Synth(\fShift,[\bus,~chAmp, \target, 0.0, \dur, 5],~mixG);

(
Pbind(\instrument, \fShift, \group, ~mixG,	\bus, ~chAmp,
	#[\target,\dur], Pseq([[0.5,2],[0.3,5],[0.0,2]])
).play;
)

(
Pdef(\test).stop;
~chAmpFader.free;
)