SynthDef(\Efx_LPF, { |bus, freq|
	ReplaceOut.ar(bus, LPF.ar(In.ar(bus, 2),freq))
	},
	metadata: (
		specs: (
			freq: ControlSpec(50, 20000.0, \lin, 10, 400, "Hz")
		)
	)
)