

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
