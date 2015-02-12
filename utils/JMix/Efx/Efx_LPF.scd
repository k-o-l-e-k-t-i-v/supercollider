SynthDef(\Efx_LPF, { |bus, freq|
	ReplaceOut.ar(bus, LPF.ar(In.ar(bus, 2),freq))
	},
	metadata: (
		credit: "test",
		tags: [\pitched, \acid, \phat, \subtractive]
	)
)