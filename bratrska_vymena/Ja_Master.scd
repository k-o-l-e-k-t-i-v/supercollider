// inspired from Kraftwerk's SpaceLab
s.scope(2);
s.plotTree;
FreqScope.new(600,200,0);

(
//SynthDefs
SynthDef(\fader, { | out = 0, in, mute = 1, amp = 1 |
	Out.ar(out, In.ar(in, 2) * mute * amp)
}).add;

SynthDef(\sinenv, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;

// Bus
~numChannels = 6;

~mixGroup = Group.new;
~fxGroup = Group.new;
~synthGroup = Group.new;

~master = Bus.audio(s, 2);
~masterAmp = Bus.control(s, 1);
~masterFader = Synth(\fader, [\out, 0, \in, ~master], ~mixGroup);
~masterFader.map(\amp, ~masterAmp);

~numChannels.do { |i|
	("ch" ++ i).asSymbol.envirPut( Bus.audio(s, 2) );
	("chAmp" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	("fader" ++ i).asSymbol.envirPut( Synth(\fader,
		[\out, ~master, \in, ("ch" ++ i).asSymbol.envirGet], ~mixGroup) );
	("fader" ++ i).asSymbol.envirGet.map(\amp, ("chAmp" ++ i).asSymbol.envirGet);
};
)

(
~masterAmp.value = 0.3;
~chAmp0.value = 1.0;
~chAmp1.value = 0.0;
~chAmp2.value = 0.0;
~chAmp3.value = 0.0;
~chAmp4.value = 0.0;
~chAmp5.value = 0.0;
)

(
Pbind( \instrument, \sinenv, \group, ~mixGroup.nodeID,	\bus, ~masterAmp,
	\time, Pseq([10]),
	\target, Pseq([0.5])
).play;
)
(
Pbind( \instrument, \sinenv, \group, ~mixGroup.nodeID,	\bus, ~chAmp0,
	\time, Pseq([30]),
	\target, Pseq([0.0])
).play;
)
(
Pbind( \instrument, \sinenv, \group, ~mixGroup.nodeID,
	\bus, ~chAmp0,
	\target, Pseq([0.8,\,0]),
	\time, Pseq([2,\,10]),
	\dur, Pseq([2,10,0]),
).play;
)

s.freeAll;