// 1) at first open JMix_SynthDef and run(store) SynthDef on yours disk
// 2) put JMix.sc to your Platform.systemExtensionDir\classes\ (or Platform.userExtensionDir\classes\)
//           and recompile the class library by (Ctr+Shift+L)
// 3) first and second step have to be done just once on begin(or later after update). If you start new coding, just use JMix(numChannel) and play

m = JMix(6); // create new object, (num of prepared channels)
s.plotTree;
m.gui; // create new control window

(
SynthDef(\testSin, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.ar(Env.asr(0.1*sustain, 1,0.9*sustain),gate, doneAction:2);
	var osc = SinOsc.ar([freq, freq+10],0,0.4,0.6)*SinOsc.ar([freq/2, (freq+10)/4],0,0.2,0.8);
	var tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;

Pdef(\test,
	Ppar([
		Pbind(\instrument, \testSin, \out, m.chBus(0), \group, m.synG,
			// use JMix.chBus(numOfChannel) like output bus for playing and optionaly JMix.synG like target group of yours sound Synth
			\amp, 1,
			\dur, 0.25, \legato, 0.13,
			\octave, 1,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,6],inf))
		),
		Pbind(\instrument, \testSin, \out, m.chBus(1), \group, m.synG,
			\amp, 1,
			\dur, Pseq([Pn(0.0625,24), Rest(2.5)], inf), \legato, 0.05,
			\octave, 9,
			\degree, Pstutter(Pseq([32,2,16,4],inf),Pseq([3,2,3,1],inf))
		),
		Pbind(\instrument, \testSin, \out, m.chBus(2), \group, m.synG,
			\amp, 1,
			\dur, Pseq([0.125, 0.125, 0.25, Rest(7.5)], inf), \legato, 2.02,
			\octave, 2,
			\degree, Pstutter(Pseq([16,8,4,8],inf),Pseq([3,2,3,4],inf))
		),
		Pbind(\instrument, \testSin, \out, m.chBus(3), \group, m.synG,
			\amp, 1,
			\dur, Pseq([Pn(0.125,16), Rest(2)], inf), \legato, Pseq([Pn(0.09,15),Pn(0.39,2)],inf),
			\octave, Pseq([Pn(3,15),Pn(2,2),Pn(4,17),Pn(2,15),Pn(3,2)], inf),
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
	],inf)
).play(quant:1);
)
Pdef(\test).stop;


m.free; // close and clean JMix

// solution for Ndef (maybe - to Alex this few minutes worked)
// http://new-supercollider-mailing-lists-forums-use-these.2681727.n2.nabble.com/Ndef-Synth-and-Bus-td6759231.html
// https://github.com/supercollider/supercollider/commit/1536a83e72b522e19041958eed319805d1c7272e
(
Ndef(\s1, { SinOsc.ar ! 2 }).play(m.chBus(0));
Ndef(\s1).group = m.synG;
// Ndef(\s1).parentGroup_(m.synG);
)

