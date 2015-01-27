// ja_track
s.scopeTree();
(
Tdef(\Track_B, {
	~tc.sched(5, {
		"Ja - play".postln;
		Pdef(\seqXsin).play;
	});
	~tc.sched(30, {
		"Ja - stop".postln;
		Pdef(\seqXsin).stop;
	});
});

////////////////////////

SynthDef(\BaseSin, { |out, gate = 1, freq, amp, sustain = 1, xSel = 1|
	var aEnv1 = EnvGen.ar(Env([0.01,1,0.01],[0.3, 0.7]*sustain,[\sin, \welch]),gate, doneAction:2);
	var aEnv2 = EnvGen.ar(Env([0.01,1,0.3,1,0.01],[0.3, 0.025, 0.025, 0.65]*sustain,[\sin, \step, \exp, \welch]),gate, doneAction:2);
	var osc1 = SinOsc.ar(freq);
	var osc2 = SinOsc.ar(freq) * Saw.ar([15,17],0.2,0.8);
	var osc3 = SinOsc.ar(freq) * Saw.ar([30,34],0.3,0.7);
	var oscSel = Select.ar(xSel,[(aEnv1 * osc1),(aEnv2 * osc2),(osc3*aEnv1)]);
	var tone = oscSel * amp;
	tone = FreeVerb.ar(tone, 0.5,1.5,0.1,1,tone);
	Out.ar(out, tone);
}).add;
SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(SinOsc.kr([4,5],0,SinOsc.kr(16,0,0.3))),freq);
	var tone = osc * aEnv * amp;
	Out.ar(out,tone);
}).add;
SynthDef(\pan, { |in, out, freq|
	Out.ar(out,Limiter.ar(Pan2.ar(In.ar(in, 1), SinOsc.kr(freq)),1));
}).add;

SynthDef(\blur, { |in, out, room|
	ReplaceOut.ar(out,OnePole.ar(FreeVerb.ar(In.ar(in, 2),0.5, room)));
}).add;

//efx
~fxPan1 = Synth(\pan,[\in, 30, \out, 0, \freq, 4],~efxG);
~fxPan2 = Synth(\pan,[\in, 35, \out, 0, \freq, 1],~efxG);

~fxBlur1 = Synth(\blur,[\in, 30, \out, 30, \room, 8],~efxG);
~fxBlur2 = Synth(\blur,[\in, 35, \out, 35, \room, 2],~efxG);

Pdef(\seqXsin,
	Pbind(\instrument, \BaseSin, \out, 30, \amp, 0.3,
		\dur, 1,
		\legato, 1.8,
		\octave, 2,
		\degree, Pstutter(Pseq([4,2], inf), Pseq([4,2], inf)),
		\xSel, Pwrand([0,1,2],[0.7,0.15,0.15],inf)
	)
);

Pdef(\seqHat,
	Pbind(\instrument, \Hat, \out, 35, \amp, 0.3,
		\dur, 2,
		\legato, 0.01,
		\octave, 8,
		\degree, Pstutter(Pseq([4,2], inf), Pseq([4,2], inf))
	)
);

~composition.value(False,True,True).play;
)
