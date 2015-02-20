SynthDef(\Efx_CombC, { |bus, decay, gap|
	var tone = In.ar(bus, 2);
	ReplaceOut.ar(bus,CombC.ar(tone, gap*2, gap, decay, 1, tone));
})