// ja_track
s.plotTree();

// problem with first evaulation
// ERROR: SynthDef (pan,blur) not found FAILURE IN SERVER /s_new SynthDef not found

(
~jCh = Bus.audio(s,2);
~jChMute = Bus.control(s,1);
~jChAmp = Bus.control(s,1);

~synG = Group.new;
~efxG = Group.new(~synG,\addAfter);
~mixG = Group.new(~efxG,\addAfter);

SynthDef(\faderAmp, { | bus, mute = 1 , amp = 1 |
	Out.ar(0, In.ar(bus, 2) * mute * amp)
}).add;

SynthDef(\changeAmp, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;

// SynthDefs //////////////////////

SynthDef(\BaseSin, { |out, gate = 1, freq, amp = 1, sustain = 1, xSel = 1|
	var aEnv1 = EnvGen.ar(Env([0.01,1,0.01],[0.3, 0.7]*sustain,[\sin, \welch]),gate, doneAction:2);
	var aEnv2 = EnvGen.ar(Env([0.01,1,0.3,1,0.01],[0.3, 0.025, 0.025, 0.65]*sustain,[\sin, \step, \exp, \welch]),gate, doneAction:2);
	var osc1 = SinOsc.ar(freq);
	var osc2 = SinOsc.ar(freq) * Saw.ar([15,17],0.2,0.8);
	var osc3 = SinOsc.ar(freq) * Saw.ar([30,34],0.3,0.7);
	var oscSel = Select.ar(xSel,[(aEnv1 * osc1),(aEnv2 * osc2),(osc3*aEnv1)]);
	var tone = oscSel * amp;
	Out.ar(out, tone);
}).add;

// efx //////////////////////

SynthDef(\pan, { |in, out, freq|
	Out.ar(out,Pan2.ar(In.ar(in, 1), SinOsc.kr(freq)));
}).add;

SynthDef(\blur, { |in, out, room|
	ReplaceOut.ar(out,OnePole.ar(FreeVerb.ar(In.ar(in, 2),0.5, room)));
}).add;

// Patterns //////////////////////

Pdef(\seqXsin,
	Pbind(\instrument, \BaseSin, \out, ~jCh, \group, ~synG,
		\dur, 1,
		\legato, 1.8,
		\octave, 2,
		\degree, Pstutter(Pseq([4,1], inf), Pseq([3,6], inf)),
		\xSel, Pswitch([
			Pseq([0,0,0,0]),
			Pseq([0,0,0,1]),
			Pseq([0,0,0,2]),
		], Pseq([0,0,1], inf))
	);
);

// TimeLine //////////////////////

Tdef(\Track_B, {
	// s.waitForBoot();
	// s.bootSync();
	~tc.sched(0, {
		~jFader = Synth(\faderAmp, [
			\bus, ~jCh,
			\mute, ~jChMute.asMap,
			\amp, ~jChAmp.asMap
		],~mixG);
		~jChMute.value = 1.0;
		~jChAmp.value = 0.0;
		~jPan = Synth(\pan, [\in, ~jCh, \out, ~jCh, \freq, 0.5],~efxG);
		~jBlur = Synth(\blur, [\in, ~jCh, \out, ~jCh, \room, 1.5],~efxG);
	});
	~tc.sched(1, {
		"Ja - play".postln;
		Synth(\changeAmp, [\bus, ~jChAmp, \target, 0.5, \time, 5],~mixG);
		Pdef(\seqXsin).play;

	});
	~tc.sched(20, {
		Pdef(\seqXsin).stop;
		Synth(\changeAmp, [\bus, ~jChAmp, \target, 0.0, \time, 2],~mixG);
	});
	~tc.sched(23, {
		"Ja - stop".postln;
		~jFader.free;
		~jPan.free;	~jBlur.free;
		~synG.free;	~efxG.free;	~mixG.free;
	});
});

~composition.value(True,True,True).play;
)
