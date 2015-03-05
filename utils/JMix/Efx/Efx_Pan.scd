SynthDef(\Efx_Pan, { |bus, freq, mult|
	var tone, efx;
	tone = In.ar(bus, 2);
	efx = Mix.new(tone);
	ReplaceOut.ar(bus,Pan2.ar(efx, SinOsc.kr(freq, 0, mult),1));
	},
	metadata: (
		specs: (
			freq: ControlSpec(0.1, 8.0, \lin, 0.1, 1),
			mult: ControlSpec(0.1, 1.0, \lin, 0.05, 1)
		)
	)
)
