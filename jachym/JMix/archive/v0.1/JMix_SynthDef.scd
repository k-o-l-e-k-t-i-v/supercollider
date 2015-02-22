// how to move SynthDef direct to JMix????????????
(

// JMix_Synth ////////////////////

SynthDef(\JMix_Limiter, { | bus |
	Out.ar(0, Limiter.ar(In.ar(bus,2),0.95));
}).store;
SynthDef(\JMix_Fader, { | in, out, amp, mute |
	Out.ar(out, In.ar(in, 2) * amp * mute)
}).store;

////// JMix_EFX Synth ///////////////////////////////////////////////////////////

SynthDef(\JMix_Efx_Pan, { |bus, freq|
	var tone, chR, chL;
	tone = In.ar(bus, 2);
	chR = tone[0];
	chL = tone[1];
	tone = chR + chL;
	ReplaceOut.ar(bus,Pan2.ar(tone, SinOsc.kr(freq)));
}).store;
SynthDef(\JMix_Efx_LPF, { |bus, freq|
	ReplaceOut.ar(bus, LPF.ar(In.ar(bus, 2),freq))
}).store;
SynthDef(\JMix_Efx_HPF, { |bus, freq|
	ReplaceOut.ar(bus, HPF.ar(In.ar(bus, 2),freq))
}).store;
SynthDef(\JMix_Efx_Blur, { |bus, room|
	var tone = In.ar(bus, 2);
	ReplaceOut.ar(bus,OnePole.ar(FreeVerb.ar(tone,0.5, room,0.7,1,tone),0.7,1));
}).store;
SynthDef(\JMix_Efx_CombC, { |bus, decay, gap|
	var tone = In.ar(bus, 2);
	ReplaceOut.ar(bus,CombC.ar(tone, gap*2, gap, decay, 1, tone));
}).store;
SynthDef(\JMix_Efx_DBass, { |bus, freq|
	var tone, freqs, amps, rings;
	tone = In.ar(bus, 2);
	freqs = (#[1, 2, 3, 4]);
	amps = (#[0.5, 0.3, 0.15, 0.05]);
	rings = (#[1, 0.65, 0.3, 0.15]);
	tone = tone * BrownNoise.ar(0.5,0.5);
	ReplaceOut.ar(bus, DynKlank.ar(`[freqs, amps, rings], tone, freq))
}).store;

)