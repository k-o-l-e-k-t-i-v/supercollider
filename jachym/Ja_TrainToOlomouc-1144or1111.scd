(
SynthDef(\DrumA, { |out = 0, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.6, 0.5*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(600,700),freq,0.01],[0.03*sustain, 0.97*sustain],\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone*0.5,0.8,0.5,0.5, 1,tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumC, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.03*sustain, 0.45*sustain, 0.5, 0.52*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1700,1900),freq,0.01],[0.05*sustain, 0.95*sustain],\exp));
	osc = SinOsc.ar([fEnv-10,fEnv+10],0,amp)*Pulse.ar([fEnv+10,fEnv-10],0.9,1);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 100);
	tone = FreeVerb.ar(tone*0.5,2,0.5,0.5, 1, tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\TickA, { |out = 0, gate = 1, amp = 1, sustain = 1|
	var aEnv, fEnv, tone;
	aEnv = EnvGen.ar(Env.asr(3/16*sustain, amp, 13/16*sustain),gate);
	fEnv = EnvGen.ar(Env([Rand(12000, 16000),0.001], [1/32*sustain],\exp));
	tone = WhiteNoise.ar(Rand(0.4, 0.8),0.2)!2;
	tone = HPF.ar(tone*aEnv, fEnv);
	tone = FreeVerb.ar(tone*0.5,0.8,0.5,0.5, 1,tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp/4);
	tone = osc * aEnv;
	tone = AllpassC.ar(tone*0.5,sustain*0.1,sustain*0.0625,sustain/2, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 300);
	DetectSilence.ar(tone,time:sustain*0.1,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\fader, { | out = 0, in = 0, mute = 1, amp = 1 |
	Out.ar(out, In.ar(in, 2) * mute * amp);
}).add;
)
)

(
Pdef(\Fader30,
	Pmono(
		\fader, \out, 0, \in, 30, \dur, 0.0625,
		\mute, Pseg(Pseq([0,1], inf),Pseq([0.0625,0.0625,0.125], inf), \step, inf),
		\amp, Pseg(Pseq([0.1,1,0.1], inf),Pseq([3.5,0.5], inf),\sin, inf)
	)
).play;
)
Pdef(\Fader30).stop;

(
Pdef(\drumSeq, {
	Ppar([
		Pbind(\instrument, \DrumA, \amp, 0.7, \octave, 2,
			\degree, Pseq([Pn(5,8),Pn(4,8)], inf),
			\legato, Pseq([0.6,0.8], inf),
			\dur, Pseq([2], inf)
		),
		Pbind(\instrument, \DrumC, \amp, 0.9, \octave, 2, \degree, Pseq([Pn(7,8),Pn(6,8)], inf),
			\legato, Pseq([0.9,1.0,0.7,1.1,0.9], inf),
			\dur, Pseq([Rest(1.25),0.125,0.125,Rest(0.25),0.125,0.125], inf)
		),
		Pbind(\instrument, \TickA, \amp, 0.1, \dur, Pseq([0.85,0.15,0.35,0.15, Rest(1.5)], inf), \legato, 0.1)
	],inf)

}).play(quant:1);
Pdef(\drumSeq).fadeTime = 4;
)
Pdef(\drumSeq).stop;

(
Pdef(\SawSeq, {
	Ppar([
		Pbind(\instrument, \SawA, \out, 30,
			\dur, Pseq([Pn(15,3), 20], inf),
			\octave, Pseq([Pn(5,4),Pn(4,2)], inf),
			\degree, Pseq([5,4,7,3], inf),
			\amp, Pseq([0.5,0.8],inf),
			\legato, 1.2
		),
		Pbind(\instrument, \SawA,
			\dur, Pseq([Pn(0.125,4), 0.25,0.25, Rest(5)], inf),
			\octave, Pseq([Pn(2,16),Pn(4,2)], inf),
			\degree, Pseq([5,4,7,3], inf),
			\amp, Pseq([0.5,0.7],inf),
			\legato, 2.9
		)
	],inf);
}).play(quant:4);
Pdef(\SawSeq).fadeTime = 10;
)
Pdef(\SawSeq).stop;

