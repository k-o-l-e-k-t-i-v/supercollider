s.plotTree();

(
SynthDef(\Sin, {|out, freq|
	var tone = SinOsc.ar([freq,freq+5]);
	Out.ar(out, tone);
}).add;

SynthDef(\faderAmp, { | out, in, amp = 1 |
	Out.ar(out, In.ar(in, 2) * amp)
}).add;

SynthDef(\changeAmp, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;

~chanel = Bus.audio(s, 2);
~chanelAmp = Bus.control(s, 1);

Pdef(\seq,
	Pmono(\Sin, \out, ~chanel, \dur, 0.5,
		\octave, 3, \degree, Pseq([3,3,3,6], inf)
	);
);

~tc = TempoClock.default;
Tdef(\Track_X, {
	~tc.sched(0, {
		Pdef(\seq).play;
		~faderObject = Synth(\faderAmp,[\out, 0, \in, ~chanel, \amp, ~chanelAmp.asMap]);
		~chanelAmp.value = 0.1;
	});

	~tc.sched(3, { ~chanelAmp.value = 0.6;
		"3sec - immidiatly change chanelAmp = 0.6".postln
	});

	~tc.sched(4, { ~chanelAmp.value = 0.1; });

	~tc.sched(6, { Synth(\changeAmp,[\bus, ~chanelAmp, \target, 0.6, \time, 2]);
		"6sec - start fadeing Up duration 2 sec... ".postln
	});
	~tc.sched(8, { "8sec - end fadeing ... ".postln; });

	~tc.sched(10, { Synth(\changeAmp,[\bus, ~chanelAmp, \target, 0.0, \time, 7]);
		"10sec - start fadeing Down duration 7 sec... ".postln
	});

	~tc.sched(17, {
		"17sec - end fadeing ... ".postln;

		Pdef(\seq).stop;
		~faderObject.free;
	});
}).play;
)

