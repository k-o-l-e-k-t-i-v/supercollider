(
// s.scope(2);
s.plotTree();

~synG = Group.new;
~efxG = Group.new(~synG, \addAfter);

SynthDef(\BaseSin, { |out, gate = 1, freq, amp, sustain = 1, xSel = 1|
	var aEnv1 = EnvGen.ar(Env([0.01,1,0.01],[0.3, 0.7]*sustain,[\sin, \welch]),gate, doneAction:2);
	var aEnv2 = EnvGen.ar(Env([0.01,1,0.3,1,0.01],[0.3, 0.025, 0.025, 0.60]*sustain,[\sin, \step, \exp, \welch]),gate);
	var osc1 = SinOsc.ar(freq);
	var osc2 = SinOsc.ar(freq) * Saw.ar([15,17],0.2,0.8);
	var osc3 = SinOsc.ar(freq) * Saw.ar([30,34],0.3,0.7);
	var oscSel = Select.ar(xSel,[(aEnv1 * osc1),(aEnv2 * osc2),(osc3*aEnv1)]);
	var tone = oscSel * amp;
	Out.ar(out, tone);
}).add;

SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(Saw.kr([4,5],SinOsc.kr(16,0,0.3))),freq)*LFSaw.ar(40,[0,0.01,0.02,0.05],0.2,0.8);
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
	Out.ar(out,OnePole.ar(FreeVerb.ar(In.ar(in, 2),0.5, room)));
}).add;
)
//efx
(

~fxPan1 = Synth(\pan,[\in, 30, \out, 0, \freq, 4],~efxG);
~fxPan2 = Synth(\pan,[\in, 35, \out, 0, \freq, 1],~efxG);
~fxPan3 = Synth(\pan,[\in, 40, \out, 0, \freq, 0.25],~efxG);
~fxPan4 = Synth(\pan,[\in, 50, \out, 0, \freq, 8],~efxG);

~fxBlur1 = Synth(\blur,[\in, 30, \out, 30, \room, 8],~efxG);
~fxBlur2 = Synth(\blur,[\in, 35, \out, 35, \room, 2],~efxG);
~fxBlur3 = Synth(\blur,[\in, 45, \out, 0, \room, 4],~efxG);
~fxBlur4 = Synth(\blur,[\in, 50, \out, 50, \room, 0.8],~efxG);
)

(
//patterns
Pdef(\xSin,
	Ppar([
		Pbind(\instrument, \BaseSin, \out, 30, \group, ~synG, \amp, Pseq([0.3,0.25,0.15], inf),
			\dur, Pseq([4,0.5,3.5,8], inf),
			\legato, Pseq([1.9,1.2], inf),
			\octave, Pstutter(Pseq([4,2,4], inf), Pseq([2,4,3], inf)),
			\degree, Pstutter(Pseq([6,2], inf), Pseq([3,6], inf)),
			\xSel, Pwrand([0,1,2],[0.8,0.15,0.05],inf)
		),Pbind(\instrument, \BaseSin, \out, 40, \group, ~synG, \amp, 0.2,
			\dur, 2,
			\legato, Pseq([1.9,1.2], inf),
			\octave, Pstutter(Pseq([8,6,12], inf), Pseq([4,3,5,4], inf)),
			\degree, Pstutter(Pseq([6,2], inf), Pseq([3,6], inf)),
			\xSel, Pwrand([0,1,2],[0.2,0.7,0.1],inf)
	)], inf)
).play(quant:1);
)
Pdef(\xSin).stop;
(
Pdef(\HatSeq,
	Pbind(\instrument, \Hat, \out, 35, \group, ~synG, \amp, 0.55,
		\dur, Pseq([Pn(0.125,2), Rest(0.75),Pn(0.25,4), Rest(1)],inf),
		\legato, Pseq([1.1,1.8,1.1,1.8,1.4,0.2], inf),
		\freq, Pwhite(1000,18000, inf)
	)
).play(quant:1);
)
Pdef(\HatSeq).stop;
(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \out, 40, \group, ~synG, \amp, 0.1,
		\dur, 4,//Pseq([Pn(0.125,8),0.25,0.25, Rest(0.5), 0.5, Rest(1.5), Pn(0.125,8),0.25,0.25, Rest(0.5), Pn(0.25,4), Rest(1)], inf),
		\legato, Pseq([1.2,0.3,1,0.6,1,0.3,1,0.1,0.2,0.9,0.1,1], inf),
		\octave, Pstutter(Pseq([2,3,4,1],inf),Pseq([4,5], inf)),
		\degree, Pseq([5,7,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
)).play(quant:2);
)
Pdef(\DrumSeq1).stop;
(
Pdef(\DrumSeq2,
	Pbind(\instrument, \DrumA5, \out, 45, \group, ~synG, \amp, 0.6,
		\dur, Pseq([Pn(0.125,3), Rest(0.125),0.25,0.25], inf),
		\legato, 0.15,
		\octave, 4,
		\degree, Pseq([4,4,4,7,5,6b], inf),
		\lpf, Prand([175,350,700,1400,2800], inf)
)).play(quant:2);
)
Pdef(\DrumSeq2).stop;

(
Pdef(\DrumSeq3,
	Pbind(\instrument, \DrumA5, \out, 50, \group, ~synG, \amp, 0.2,
		\dur, Pseq([1,0.25,0.25, Rest(0.5)], inf),
		\legato, Pseq([0.2,0.3,0.1,1,0.6], inf),
		\octave, Pwrand([4,2,3],[0.2,0.7,0.1],inf),
		\degree, Pseq([5,5,3,1,1], inf),
		\lpf, Pseq([400,350,100,600,350], inf)
)).play(quant:2);
)
Pdef(\DrumSeq3).stop;
(
// clean
~fxPan1.free; ~fxPan2.free; ~fxPan3.free;
~fxBlur1.free; ~fxBlur2.free; ~fxBlur3.free;
)
