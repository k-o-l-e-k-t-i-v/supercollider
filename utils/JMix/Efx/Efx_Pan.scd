// out of order

SynthDef(\Efx_Pan, { |bus, freq, mult|
	var tone, efx, numCh, monoBus, chR, chL;

	monoBus = Bus.audio(s,1);

	numCh = bus.numChannels;
	efx = In.ar(bus, numCh);
	efx = Mix.new(efx);

	// tone = Splay.ar(tone,0);

	// InBus.ar(bus.index,1);
	// InBus.newFrom(bus,0,1);
	// bus = monoBus;
	// monoBus.newFrom(bus,0,1);


/*
	tone = In.ar(bus, 2);
	chR = tone[0];
	chL = tone[1];
	tone = chR + chL;
	*/
	// ReplaceOut.ar(monoBus ,Pan2.ar(efx, SinOsc.kr(freq, 0, mult)));



	ReplaceOut.ar( bus, Pan2.ar( efx, SinOsc.kr(freq, 0, mult), 1/numCh));
	},
	metadata: (
		specs: (
			freq: ControlSpec(0.1, 20.0, \lin, 0.1, 1, "Hz"),
			mult: ControlSpec(0.1, 1.0, \lin, 0.05, 1)
		)
	)
)
