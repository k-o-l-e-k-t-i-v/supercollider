// concept for composing at 3. 4files have to be open, every can write to his one, supercolide reload saved changes. Master task just play it.
// - 1) masterFile,
// - 2) composerTrack_A
// - 3) composerTrack_B
// - 4) composerTrack_C

(

//  1) masterFile - main task to play all 3 part at same time ////////////////////////////
(
~tc = TempoClock.default;

Tdef(\master,
	Tdef(\Track_A).fork;
	Tdef(\Track_B).fork;
	Tdef(\Track_C).fork;
).play;
);
//  1) masterFile - end of file //////////////////////////////////////////////////////////



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



//  3) composerTrack_B - own scheduling of single track //////////////////////////////////
(
SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(SinOsc.kr([4,5],0,SinOsc.kr(16,0,0.3))),freq);
	var tone = osc * aEnv * amp;
	Out.ar(out,tone);
}).add;

Pdef(\seqHat,
	Pbind(\instrument, \Hat, \out, 0, \amp, 0.3,
		\dur, Pseq([Pn(0.25,16), Pxrand([Pseq([Pn(0.125,8),Pn(0.25,8),Pn(0.03125,4)]),Prand([Rest(1),Rest(2)])])],inf),
		\legato, Pseq([0.1,0.8,1.1,1.8,1.4,0.9], inf),
		\freq, Pwhite(6000,12000, inf)
	)
);

Tdef(\Track_B, {
	~tc.sched(10, {
		"composerTrack_B - sec10 - play".postln;
		Pdef(\seqHat).play;
	});
	~tc.sched(20, {
		"composerTrack_B - sec20 - stop".postln;
		Pdef(\seqHat).stop;
	});
});
);
//  3) composerTrack_B - end of file /////////////////////////////////////////////////////




//  4) composerTrack_A - own scheduling of single track //////////////////////////////////
(
SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.025*sustain;
	aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]), gate);
	fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.12*sustain,0.78*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.3, 0.8, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

Pdef(\seqDrum,
	Pbind(\instrument, \DrumA5, \out, 0, \amp, Pseq([0.12,0.18,0.25,0.4], inf),
		\dur, Pseq([Pn(0.125, 8), Rest(3)], inf),
		\legato, Pseq([Pn(0.2,6), 0.6, Pwhite(0.7,1.3)], inf),
		\octave, Pstutter(Pseq([8,9,8,4],inf),Pseq([8,7,8,9], inf)),
		\degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
	)
);

Tdef(\Track_C, {
	~tc.sched(15, {
		"composerTrack_C - sec15 - play".postln;
		Pdef(\seqDrum).play;
	});
	~tc.sched(25, {
		"composerTrack_C - sec25 - stop".postln;
		Pdef(\seqDrum).stop;
	});
});
)
//  4) composerTrack_C - end of file /////////////////////////////////////////////////////


)
