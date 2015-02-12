SynthDef(\JMix_Efx_Pan, { |bus, freq|
	var tone, chR, chL;
	tone = In.ar(bus, 2);
	chR = tone[0];
	chL = tone[1];
	tone = chR + chL;
	ReplaceOut.ar(bus,Pan2.ar(tone, SinOsc.kr(freq)));
})