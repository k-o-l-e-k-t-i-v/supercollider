
//  2) composerTrack_A - own scheduling of single track //////////////////////////////////
(
SynthDef(\BaseSin, { |out, gate = 1, freq, amp, sustain = 1, xSel = 1|
	var aEnv1 = EnvGen.ar(Env([0.01,1,0.01],[0.3, 0.7]*sustain,[\sin, \welch]),gate, doneAction:2);
	var aEnv2 = EnvGen.ar(Env([0.01,1,0.3,1,0.01],[0.3, 0.025, 0.025, 0.65]*sustain,[\sin, \step, \exp, \welch]),gate, doneAction:2);
	var osc1 = SinOsc.ar(freq);
	var osc2 = SinOsc.ar(freq) * Saw.ar([15,17],0.2,0.8);
	var osc3 = SinOsc.ar(freq) * Saw.ar([30,34],0.3,0.7);
	var oscSel = Select.ar(xSel,[(aEnv1 * osc1),(aEnv2 * osc2),(osc3*aEnv1)]);
	var tone = oscSel * amp;
	Out.ar(out, tone);
}).add;

Pdef(\xSin,
	Pbind(\instrument, \BaseSin, \out, 0, \amp, 0.4,
		\dur, 2, \legato, 1.9,
		\octave, 1, \degree, Pstutter(Pseq([6,2], inf), Pseq([3,6], inf)),
		\xSel, Pwrand([0,1,2],[0.8,0.15,0.05],inf)
	)
);

Tdef(\Track_A, {
	~tc.sched(0, {
		"composerTrack_A - sec0 - play".postln;
		Pdef(\xSin).play;
	});
	~tc.sched(30, {
		"composerTrack_A - sec30 - stop".postln;
		Pdef(\xSin).stop;
	});
});
);
//  2) composerTrack_A - end of file /////////////////////////////////////////////////////

