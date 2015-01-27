s.scope(2);
s.plotTree();

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

SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(SinOsc.kr([4,5],0,SinOsc.kr(16,0,0.3))),freq);
	var tone = osc * aEnv * amp;
	Out.ar(out,tone);
}).add;

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

SynthDef(\pan, { |in, out, freq|
	Out.ar(out,Limiter.ar(Pan2.ar(In.ar(in, 1), SinOsc.kr(freq)),1));
}).add;

SynthDef(\blur, { |in, out, room|
	ReplaceOut.ar(out,OnePole.ar(FreeVerb.ar(In.ar(in, 2),0.5, room)));
}).add;
)

(
//efx
Pdef(\fxPan, Pmono(\pan, \in, [30,35,40], \out, [0,0,0], \freq, [4,1,0.25])).play;
Pdef(\fxBlur, Pmono(\blur, \in, [30,35,45], \out, [30,35,0], \freq, [8,2,4])).play;
)

(
//patterns
Pdef(\xSin,
	Pbind(\instrument, \BaseSin, \out, 30, \amp, 1.7,
		\dur, 2, \legato, 1.9,
		\octave, 1, \degree, Pstutter(Pseq([6,2], inf), Pseq([3,6], inf)),
		\xSel, Pwrand([0,1,2],[0.8,0.15,0.05],inf)
	)
).play(quant:1);
)
(
Pdef(\HatSeq,
	Pbind(\instrument, \Hat, \out, 35, \amp, 0.3,
		\dur, Pseq([Pn(0.25,16), Pxrand([Pseq([Pn(0.125,8),Pn(0.25,8),Pn(0.03125,4)]),Prand([Rest(1),Rest(2)])])],inf),
		\legato, Pseq([0.1,0.8,1.1,1.8,1.4,0.9], inf),
		\freq, Pwhite(6000,12000, inf)
	)
).play(quant:1);
)
(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \out, 40, \amp, Pseq([0.12,0.18,0.25,0.4], inf),
		\dur, Pseq([Pn(0.125, 8), Rest(3), Pn(0.125, 8), Prand([Rest(3), Rest(7), Rest(11)])], inf),
		\legato, Pseq([Pn(0.2,6), 0.6, Pwhite(0.7,1.3)], inf),
		\octave, Pstutter(Pseq([8,9,8,4],inf),Pseq([8,7,8,9], inf)),
		\degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
)).play(quant:1);
)
(
Pdef(\DrumSeq2,
	Pbind(\instrument, \DrumA5, \out, 45, \amp, 0.6,
		\dur, Pseq([0.5,0.25,0.25,Rest(1)], inf),
		\legato, 0.05,
		\octave, 2,
		\degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
)).play(quant:1);
)

(
Pdef(\xSin).stop;
Pdef(\DrumSeq1).stop;
Pdef(\HatSeq).stop;
Pdef(\DrumSeq2).stop;
Pdef(\fxPan).stop;
Pdef(\fxBlur).stop;
)