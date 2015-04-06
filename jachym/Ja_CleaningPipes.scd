(
SynthDef(\test, {|out, gate = 1 ,freq, ffreq, amp, sustain|
	var aEnv = EnvGen.ar(Env.adsr(0.2*sustain, 0.3*sustain, 0.4, 0.5*sustain), gate, doneAction:2);
	var fEnv = EnvGen.kr(Env.perc(0.02,0.02,ffreq), gate);

	var osc1 = LFSaw.ar(freq + fEnv, 0, BrownNoise.ar(0.4, 0.5), 0.1);
	var osc2 = LFPulse.ar(64, 0.05, 0.9, SinOsc.kr(64,0.1,0.7));
	var osc3 = BrownNoise.ar(0.2, 0.8);

	var tone = Mix.ar([osc1*3.9, osc2*0.9, osc3*0.9]) * aEnv * amp;
	tone = FreeVerb.ar(tone, 0.13, 0.1, 0.9, 1);

	Out.ar(out, tone);
}).add;
)
(
Pdef(\pat, {
	Pbind(\instrument, \test, \out, 30,
		\amp, 0.9,
		\dur, Pstutter(Pseq([32, 1], inf), Pseq([Prand([0.0625, Rest(0.0625)]), Rest(4)], inf)),
		\legato, Pwhite(0.9,1.9, inf),
		\octave, 2,
		\degree, Prand([1,7], inf),
		\ffreq, 1600
	);
}).play;
)
Pdef(\pat).stop;

(
Ndef(\efx1, { Out.ar(32, CombC.ar(In.ar(30,1), 0.125, 0.0625, 0.25)) }).play;
Ndef(\efx2, { Out.ar(34, LPF.ar(In.ar(32,1), Saw.kr(35, 420, 1630))) }).play;
Ndef(\efx3, { Out.ar(0, GVerb.ar(In.ar(34,1), 15, 0.5, 0.5, 0.1, 32, 0.3)) }).play;
)


//my interpreter crashed 3 times until i managed to play this. this version of SC looks stabe - not :(