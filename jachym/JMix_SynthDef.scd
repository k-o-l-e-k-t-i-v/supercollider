(
SynthDef(\JMix_Limiter, { | bus |
	Out.ar(0, Limiter.ar(In.ar(bus,2),0.95));
}).store;
SynthDef(\JMix_Fader, { | in, out, amp, mute |
	Out.ar(out, In.ar(in, 2) * amp * mute)
}).store;
)