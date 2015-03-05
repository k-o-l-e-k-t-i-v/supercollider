/*
put this folder to:  Platform.systemExtensionDir / JMix
version 0.16

for new efx just put file to efx folder in form:

SynthDef(\nameOfFile, { |bus, argA, argB|
	ReplaceOut.ar(bus, LPF.ar(In.ar(bus, 2),argA, argB))
	},
	metadata: (
		specs: (
			argA: ControlSpec(50, 20000, \lin, 10, 400)
			argB: ControlSpec(50, 20000, \lin, 10, 400)
			// 50 = minValue of controler
			// 20000 = maxValue of controler
			// 10 = change value of one step
			// 400 = default value of controler
		)
	)
)
*/

m = JMix(4);
m.gui;

// Ndef example /////////////////////////
(
Ndef(\aaa).group = m.inGroup; // important line for mix
Ndef(\aaa, {
	var osc;
	// alex example
	osc = FreeVerb.ar( (SinOsc.ar(45+(0.2..1.2))+BrownNoise.ar(0.11).clip(0.1,0.3))*Decay2.kr(Impulse.kr(0.25),decayTime:2),SinOsc.kr(1),1,1);

	Out.ar(m.ch(0),osc); // important line for mix
}).play;
)

Ndef(\aaa).free;

// Pdef example /////////////////////////
(
SynthDef(\testSin, {|out, gate = 1, freq, amp, sustain|
	var fEnv = Line.kr(freq*0.8,Lag.kr(freq, 1.5*sustain),sustain);
	var aEnv = EnvGen.kr(Env.asr(0.3*sustain, 1, 0.7*sustain), gate,doneAction:2);
	Out.ar(out, LFSaw.ar([fEnv, fEnv+2], 0, amp*aEnv))
}).add;

Pdef(\testSin,
	m.channel(1).unmute;
	m.channel(1).fade(0.1,10);

	m.channel(1).addEfx(3);
	m.channel(1).efx(3).value(0,8000);
	m.channel(1).efx(3).fade(0,1000,10);

	Pbind(\instrument, \testSin, \out, m.ch(1), \group, m.inGroup, \amp, 1,
		\dur, 2, \legato, 1.3,
		\octave, 3, \degree, Pseq([3,3,3,7], inf)
	)
).play(quant:1);
)

(
Pdef(\testSin,
	m.channel(1).fade(0.0,10);
	m.channel(1).efx(3).fade(0,8000,10);

	Pbind(\instrument, \testSin, \out, m.ch(1), \group, m.inGroup, \amp, 1,
		\dur, 2, \legato, 1.3,
		\octave, 3, \degree, Pseq([3,4,5,7], inf)
	)
).play(quant:1);
)

(
Pdef(\testSin).stop;
m.channel(1).freeEfx(3);
m.channel(1).mute;
)
/*
m.addEfx(1,2);
m.addEfx(1,0);
m.addEfx(1,1);
m.freeEfx(1,0);
m.freeEfx(1,1);
m.freeEfx(1,2);
*/

m.printEfx;

m.close;
m.free;