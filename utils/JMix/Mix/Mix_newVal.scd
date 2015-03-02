SynthDef(\Mix_NewVal, { | bus, val, time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), val], [time], \sin), doneAction: 2))
});