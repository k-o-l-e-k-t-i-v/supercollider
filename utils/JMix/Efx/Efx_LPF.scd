SynthDef(\Efx_LPF, { |bus, freq|
	ReplaceOut.ar(bus, LPF.ar(In.ar(bus, 2),freq))
	},
	metadata: (
		credit: "JaTest",
		tags: [\pitched, \acid, \phat, \subtractive],
		specs: (
			freq: ControlSpec(10, 20000.0, \lin, 50, 400, "Hz")
		)
	)
)