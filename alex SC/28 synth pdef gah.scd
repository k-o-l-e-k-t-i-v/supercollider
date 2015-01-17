(
SynthDef(\gah,{

	arg freq=90, freq2=60, gate=1, sustain=2, ampwh=0, amp=0.5;
	var sig, sig2, env, num=12, pan;

	pan=SinOsc.kr(1);

	env=EnvGen.ar(Env.asr(0.5*sustain,amp, 0.25*sustain),gate, doneAction:2);

	sig=GrainFM.ar(2,env, sustain, freq, freq2,1, pan, mul:amp);

	sig=sig+HPF.ar(WhiteNoise.ar(0.2)*Pulse.kr(4/3*17,0.01),12000,ampwh);

	Out.ar(0,sig*env);
	}).play;

)
s.scope(2);

(
Pdef(\testgah, {

	Ppar([

		Pbind(\instrument, \gah, \freq, 60, \freq2, 100, \legato, 0.5, \dur, Pseq([0.25,1.25],inf), \amp, 0.5),

		Pbind(\instrument, \gah, \freq, 65, \freq2, 25, \legato, 1, \dur, Pseq([Rest(1.25),1],inf), \amp, 0.5, \ampwh, 0.7 ),

		// Pbind(\instrument, \gah, \freq, 12000, \freq2, 1210, \legato, 0.5, \dur, 0.1, \amp, Pseq([0,0,0.5],inf) ),

		],inf);



}).play(quant:1);
)

