(
SynthDef(\BaseSin, { |out, gate = 1, freq, amp = 1, sustain = 1, xSel = 1|
	var aEnv1 = EnvGen.ar(Env([0.01,1,0.01],[0.3, 0.7]*sustain,[\sin, \welch]),gate, doneAction:2);
	var osc1 = SinOsc.ar([freq,freq+5]);
	var tone = aEnv1 * osc1 * amp;
	Out.ar(out, tone);
}).add;

// Patterns //////////////////////

Pdef(\seqXsin,
	Pbind(\instrument, \BaseSin, \out, 0,
		\dur, 1,
		\legato, 0.8,
		\octave, 2,
		\degree, Pstutter(Pseq([4,1,4,1], inf), Pseq([3,6,4,6], inf)),
	);
);


~startTime = 4;
~tc = TempoClock.new(1, 0, thisThread.seconds - ~startTime);
// "current beats:" + ~tc.beats;


Tdef(\Track_B, {
	~tc.schedAbs(0 , {
		"Ja - play".postln;
		Pdef(\seqXsin).play;
	});
	~tc.schedAbs(5, { "middle".postln;	});
	~tc.schedAbs(10, {
		Pdef(\seqXsin).stop;
		"Ja - stop".postln;
	});
}).play;

)
s.scope(2);
s.plotTree();