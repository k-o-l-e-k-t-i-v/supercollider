SynthDef(\Efx_Blur, { |bus, decay, gap|
	var tone = In.ar(bus, 2);
	ReplaceOut.ar(bus,CombC.ar(tone, gap*2, gap, decay, 1, tone));
	},
	metadata: (
		specs: (
			decay: ControlSpec(0.25, 20, \lin, 0.5, 4),
			gap: ControlSpec(0.125, 2, \lin, 0.125, 0.5)
		)
	)
)
