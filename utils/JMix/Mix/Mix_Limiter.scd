SynthDef(\Mix_Limiter, { | bus |
	Out.ar(0, Limiter.ar(In.ar(bus,2),0.95));
});