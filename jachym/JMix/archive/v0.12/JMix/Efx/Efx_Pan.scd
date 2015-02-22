SynthDef(\Efx_Pan, { |bus, freq, mult|
	var tone, chR, chL;
	tone = In.ar(bus, 2);
	chR = tone[0];
	chL = tone[1];
	tone = chR + chL;
	ReplaceOut.ar(bus,Pan2.ar(tone, SinOsc.kr(freq, 0, mult)));
	},
	metadata: (
		specs: (
			freq: ControlSpec(0.1, 20.0, \lin, 0.1, 1, "Hz"),
			mult: ControlSpec(0.1, 1.0, \lin, 0.05, 1)
		)
	)
)
