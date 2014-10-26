(
SynthDef(\TickA, { |amp = 0.1, dt = 0.08|
	var env, tone;
	env = EnvGen.ar(Env.perc(1/16*dt, 15/16*dt, amp));
	tone = WhiteNoise.ar(Rand(0.5, 1.5)*env);
	tone = HPF.ar(tone, SinOsc.kr(1, 0, 600, 1400));
	tone = AllpassC.ar(tone, 0.15, 0.1, 0.5, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(0, tone);
}).store;

)