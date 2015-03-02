s.plotTree;

m = JMix(4);
m.gui;

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

	Pbind(\instrument, \testSin, \out, m.ch(1), \group, m.synG, \amp, 1,
		\dur, 2, \legato, 1.3,
		\octave, 3, \degree, Pseq([3,3,3,7], inf)
	)
).play(quant:1);
)

(
Pdef(\testSin,
	m.channel(1).fade(0.0,10);
	m.channel(1).efx(3).fade(0,8000,10);

	Pbind(\instrument, \testSin, \out, m.ch(1), \group, m.synG, \amp, 1,
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
m.printMix;

m.close;
m.free;