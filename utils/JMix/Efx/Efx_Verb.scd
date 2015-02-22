SynthDef(\Efx_Verb, { |bus, gap, room, wet|
	var in, tone;
	in = In.ar(bus, 2);
	// buf = Buffer.alloc(
	// tone = FreeVerb2.ar(in, DelayC.ar(in, gap*4, gap), wet, room, 0.5);
	tone = FreeVerb2.ar(in, AllpassC.ar(in, 0.25, 0.125 ,gap), wet, room, 0.5);
	ReplaceOut.ar(bus,tone);
	},
	metadata: (
		specs: (
			gap: ControlSpec(0.125, 8, \lin, 0.25, 0.25),
			room: ControlSpec(0, 1, \lin, 0.05, 0.5),
			wet: ControlSpec(0, 1, \lin, 0.05, 0.5)
		)
	)
)
