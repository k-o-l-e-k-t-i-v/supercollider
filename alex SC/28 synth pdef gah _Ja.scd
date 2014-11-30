(
SynthDef(\gah1,{| freq = 90, freq2 = 60, gate = 1, sustain = 2, ampwh = 1, amp = 0.5|
	var sig, sig2, env, pan;

	pan=SinOsc.kr(1);

	env=EnvGen.ar(Env.asr(0.5*sustain,amp, 0.25*sustain),gate, doneAction:2);

	sig = GrainFM.ar(2, env, sustain, freq, freq2,1, pan, mul:amp);
	sig2 = WhiteNoise.ar(0.2)*Pulse.kr(10,0.1,env);

	sig=sig+HPF.ar(sig2,1200,ampwh);
	Out.ar(0,sig);
}).play;

)
s.scope(2);

(
Pdef(\testgah, {

	Ppar([

		Pbind(\instrument, \gah1, \freq, 98, \freq2, 100, \legato, 0.2, \dur, 0.5),

		Pbind(\instrument, \gah1, \freq, 550, \freq2, 1210, \legato, 0.5, \dur, 3, \ampwh, 1 ),

		// Pbind(\instrument, \gah1, \freq, 12000, \freq2, 1210, \legato, 0.5, \dur, 0.1, \amp, Pseq([0,0,0.5],inf) ),

	],inf);



}).play(quant:1);
)

