

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
	~tc.sched(0, {
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

