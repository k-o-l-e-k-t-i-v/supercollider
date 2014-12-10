// honde husty, klobouk dolu, vic komentaru pls

s.scope(2);
FreqScope();

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

SynthDef(\DrumB, { |out = 0, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.4*sustain, 0.2*sustain, 0.35, 0.4*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1800,2000),freq,0.01],[0.03*sustain, 0.97*sustain],\exp));
	osc = SinOsc.ar([fEnv*1.01,fEnv*(-1.01)],0,amp)*LFPulse.ar([fEnv+10,fEnv-10],0,0.5,1);
	tone = osc * aEnv;
	tone = FreeVerb.ar(tone*0.5,0.45,0.25,0.5, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 100);
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

SynthDef(\DrumD, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),freq,1],[0.09*sustain, 0.6*sustain],\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+10,fEnv-10],pi,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 400);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumE, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv, num;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.1*sustain, 0.1, 0.85*sustain),gate);
	num = 5;
	osc = Mix.fill(num, {|i|
		fEnv = EnvGen.kr(Env([Rand(600/num*i,900/num*i),freq,0.01],[0.05*sustain, 0.91*sustain],\exp));
		SinOsc.ar([fEnv-i,fEnv+i],(1/num)*pi*i,amp/num)
	});
	tone = osc * aEnv;
	tone = AllpassC.ar(tone*0.5,sustain*0.1,sustain*0.5,sustain*2, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 100);

	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\SinA, { |out = 0, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv,fEnv, num;
	num = 5;
	osc = Mix.fill(num, {|i|
		fEnv = Line.kr(1,0.6,(0.85+(0.01*i))*sustain);
		SinOsc.ar([freq+(i*0.001), freq-(i*0.001)],0,1/num)*SinOsc.ar([16,16.01]+(0.005*i),0.005*i,0.9,fEnv)});
	aEnv = EnvGen.ar(Env.adsr(0.1*sustain,0.3*sustain,0.6,0.6*sustain),gate,doneAction:2);
	osc = osc * aEnv * amp;
	Out.ar(out, osc);
}).add;

SynthDef(\SinB, { |out = 0, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv, num;
	aEnv = EnvGen.kr(Env([0,1,0.3,0.5,0.2,0.4,0],[0.5*sustain,0.01*sustain,0.19*sustain,0.01*sustain,0.29*sustain],\welch),gate,amp,doneAction:2);
	num = 21;
	osc = Mix.fill(num, {|i| SinOsc.ar([freq+(0.005*i),freq-(0.005*i)],0.0001*i,1/num*VarSaw.kr([63,64],0.0001*i,0.1,0.7,0.3))});
	osc = LPF.ar(osc,freq+800,osc);
	osc = AllpassC.ar(osc,0.2,0.2,1,1,osc)*aEnv;
	Out.ar(out, osc);
}).add;

SynthDef(\LongSinC, { |out, freq = 150, sustain = 1, amp = 0.2, pan = 1|
	var tone, env, num;
	num = 15;
	env = EnvGen.ar(Env.linen(0.3*sustain,0.4*sustain,0.3*sustain, amp, \sin));
	tone = Mix.fill(num, { |i|
		SinOsc.ar(freq+Rand(-15.0,15.0),0.05*i,SinOsc.kr(4,0,0.9/num,0.1/num))*SinOsc.kr(i/2,0.003*i,i/num*0.2,0.8)
	});
	tone = tone * env;
	DetectSilence.ar(tone , doneAction:2);
	Out.ar(0, Pan2.ar(tone,SinOsc.kr(pan)));
}).add;

SynthDef(\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*4,freq*6),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\welch));
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


(
Pdef(\seqPAF_1, {
	Pbind(\instrument, \DrumA, \octave, Pseq([2,3,3], inf),
		\degree, Pseq([Pseq([5,5,3,3],4), Pseq([5,7,6,3],1)], inf),
		\amp, 0.8,
		\dur, Pseq([Pn(0.0625,4), Rest(0.125), Pn(0.125,2), Rest(0.125)], inf),
		\legato, Pseq([Pseq([1.1, 1.1, 0.9, 0.1],6),Pseq([0.5, 0.1, 0.3, 0.1])] , inf)
	)
}).play(quant:1);
Pdef(\seqPAF_1).fadeTime = 2;
)
Pdef(\seqPAF_1).stop;

(
Pdef(\seqPAF_2, {
	Ppar([
		Pbind(\instrument, \DrumA, \octave, 4, \degree, Pseq([3,7,5], inf),
			\amp, 0.5,
			\dur, Pseq([0.5,0.5,1, Rest(1),0.5,1,1,  Rest(0.5)], inf),
			\legato, Pseq([0.9, 1.1, 0.1, 0.7], inf)
		),
		Pbind(\instrument, \DrumB, \octave, 2, \degree, Pseq([7,3,7,5], inf),
			\amp, 0.7,
			\dur, 0.25,
			\legato, Pseq([1.1, 2.1, 0.5, 0.9], inf)
		),
		Pbind(\instrument, \DrumC, \octave, 2, \degree, Pseq([7,3,5,4,5,5,7], inf),
			\amp, 0.7,
			\dur, Pseq([Rest(4),Pn(0.5,4),Rest(2),1,1], inf),
			\legato, Pseq([2.9, 2.6, 1.9, 1.1, 0.5], inf)
		)
	], inf)
}).play(quant:1);
Pdef(\seqPAF_2).fadeTime = 2;
)
Pdef(\seqPAF_2).stop;

(
Pdef(\seqPAF_3, {
	Ppar([
		Pbind(\instrument, \DrumD, \octave, 2, \degree, Pseq([3,7], inf),
			\amp, 0.7,
			\dur, 1,
			\legato, Pseq([0.9, 1.1, 0.1,0.7], inf)
		),
		Pbind(\instrument, \DrumB, \octave, 3, \degree, Pseq([7,3,7,5], inf),
			\amp, 0.5,
			\dur, 0.5,
			\legato, Pseq([1.1, 2.1, 0.5, 0.9 ], inf)
		),
		Pbind(\instrument, \DrumC, \octave, 2, \degree, Pseq([7,3,5,4,5,5], inf),
			\amp, 0.3,
			\dur, Pseq([Pn(0.5,4),Rest(1)], inf),
			\legato, Pseq([0.9, 0.6, 0.9, 0.1], inf)
		)
	], inf)
}).play(quant:1);
Pdef(\seqPAF_3).fadeTime = 2;
)
Pdef(\seqPAF_3).stop;

(
Pdef(\seqPAF_4, {
	Ppar([
		Pbind(\instrument, \DrumC, \octave, Pseq([2,3,3], inf), \degree, Pseq([5,5,3,3], inf),
			\amp, 0.7,
			\dur, Pseq([Pn(0.0625,4), Rest(0.125), Pn(0.125,2), Rest(0.125)], inf),
			\legato, Pseq([1.1, 1.1, 0.9, 0.1], inf)
		),
		Pbind(\instrument, \DrumD, \octave, Pseq([2,2,3], inf), \degree, Pseq([5,5,3,3], inf),
			\amp, 0.7,
			\dur, Pseq([Pn(0.5,2), Rest(0.25), Pn(0.5,2), Rest(0.5)], inf),
			\legato, Pseq([2.1, 1.1, 0.5, 1.1], inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.8,
			\octave, Pseq([2,2,3,3,3,2], inf),
			\dur, Pseq([5,3.5,1.5,5,2.5], inf),
			\degree, Pseq([5,7,4,7,4], inf),
			\legato, Pseq([0.7,0.9, 0.1, 1.2, 0.5], inf)
	)], inf);
}).play(quant:1);
Pdef(\seqPAF_4).fadeTime = 2;
)
Pdef(\seqPAF_4).stop;

(
Pdef(\seqPAF_5,
	Ppar([
		Pbind(\instrument, \SinB, \amp, 0.5,
			\dur, Pseq([1,2,2,3,Rest(5)],inf),
			\legato, Pseq([2,3,3,9,1],inf),
			\degree, Pseq([6,5,6,4,1], inf),
			\octave, Pseq([Pn(3,5),Pn(4,5),Pn(5,5), Pn(3,5)], inf)
		),
		Pbind(\instrument, \LongSinC, \amp, 0.5,
			\dur, Pseq([2,2,2,2,Rest(5)],inf),
			\legato, Pseq([3,3,3,8,1],inf),
			\degree, Pseq([6,5,9,7,1], inf),
			\octave, Pseq([Pn(4,5),Pn(6,5),Pn(7,5), Pn(3,5), Pn(5,2),Pn(6,2)], inf)
		),
		Pbind(\instrument, \DrumA, \octave, 3, \degree, 4, \amp, 0.7,
			\dur, Pseq([0.5,0.5,Pseq([Rest(1.5),0.5], 2), Rest(2), Pn(0.25,2),Rest(4.5)], inf),
			\legato, Pseq([Pn(1,2), 0.1, 1.4], inf)
	)], inf)

).play(quant:1);
Pdef(\seqPAF_5).fadeTime = 4;
)
Pdef(\seqPAF_5).stop;

(
Pdef(\seqPAF_6_Fader30,
	Pmono(
		\fader, \out, 0, \in, 30, \dur, 0.0625,
		\mute, Pseg(Pseq([0,1], inf),Pseq([0.0625,0.0625,0.125], inf), \step, inf),
		\amp, Pseg(Pseq([0.1,1,0.1], inf),Pseq([3.5,0.5], inf),\sin, inf)
	)
).play;

Pdef(\seqPAF_6_Drum, {
	Ppar([
		Pbind(\instrument, \DrumA, \amp, 0.9, \octave, 3,
			\degree, Pseq([Pn(5,8),Pn(4,8)], inf),
			\legato, Pseq([0.6,0.8], inf),
			\dur, Pseq([0.5], inf)
		),
		Pbind(\instrument, \DrumC, \amp, 0.9, \octave, 2, \degree, Pseq([Pn(7,8),Pn(6,8)], inf),
			\legato, Pseq([0.9,1.0,0.7,1.1,0.9], inf),
			\dur, Pseq([0.125, 0.25, 0.25], inf)
		),
		Pbind(\instrument, \DrumB, \amp, 0.3, \dur, Pseq([1], inf), \legato, 0.3)
	],inf)
}).play;

Pdef(\seqPAF_6_Saw, {
	Ppar([
		Pbind(\instrument, \SawA, \out, 30,
			\dur, Pseq([Pn(15,3), 20], inf),
			\octave, Pseq([Pn(5,4),Pn(6,2)], inf),
			\degree, Pseq([5,4,7,3], inf),
			\amp, Pseq([0.5,0.8],inf),
			\legato, 1.2
		),
		Pbind(\instrument, \SawA,
			\dur, Pseq([Pn(0.125,4), 0.25,0.25, Rest(5)], inf),
			\octave, Pseq([Pn(4,16),Pn(6,2)], inf),
			\degree, Pseq([5,7,2,3], inf),
			\amp, Pseq([0.5,0.7],inf),
			\legato, 2.9
		)
	],inf);
}).play;
)
(
Pdef(\seqPAF_6_Saw).stop;
Pdef(\seqPAF_6_Drum).stop;
Pdef(\seqPAF_6_Fader30).stop;
)

(
Pdef(\seqPAF_7, {
	Ppar([
		Pbind(\instrument, \SawA, \amp, 0.5, \legato, 1.2, \octave, Pseq([2,1,1,2,2,3], inf), \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\dur, Pseq([10],inf)
		),
		Pbind(\instrument, \DrumA, \amp, 0.7, \legato, 0.9, \octave, 3, \degree, Pseq([3,Pn(6,4)],inf),
			\dur, Pseq([0.25],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.4, \legato, 0.6, \octave, 2, \degree, Pseq([Pn(4,2),Pn(11,8)],inf),
			\dur, Pseq([Rest(0.125),0.25,0.125],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\seqPAF_7).fadeTime = 4.0;
)
Pdef(\seqPAF_7).stop;

(
Pdef(\seqPAF_8, {
	Pbind(\instrument, \SawA, \amp, 0.9,
		\octave, Pseq([2,3,3,3], inf),
		\dur, Pseq([Pn(0.0625, 64),0.5],inf),
		\degree, Pseq([
			Pn(2, 64),3,
			Pn(2, 64),\,
			Pn(2, 64),5,
			Pn(2, 64),\,
			Pn(2, 64),11
		],inf),
		\legato, Pseq([Pn(1.9,64),1.3],inf)
	)
}).play(quant:1);
Pdef(\seqPAF_8).fadeTime = 1;
)
Pdef(\seqPAF_8).stop;

(
Pdef(\seqPAF_9, {
	Ppar([
		Pbind(\instrument, \SinB, \amp, 0.5, \octave, 6,
			\legato, Pseq([Pn(1.0,11),Pn(1.3,2)], inf),
			\degree, Pseq([
				Pseq([Pn(4,11),Pn(3,2)],3),
				Pseq([Pn(5,11),Pn(3,2)],1),
				Pseq([Pn(5,11),Pn(4,2)],3),
				Pseq([Pn(4,11),Pn(4,2)],2)], inf),
			\dur, Pseq([Pn(0.0625,11),6.5, Rest(2.125)], inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.8, \legato, 1.6, \octave, 1,
			\degree, Pseq([Pn(4,4),Pn(2,8)],inf),
			\dur, Pseq([0.25,0.125,0.125],inf)
	)],inf);
}).play(quant:1);
Pdef(\seqPAF_9).fadeTime = 2.0;
)
Pdef(\seqPAF_9).stop;

(
Pdef(\seqPAF_10_Drum, {
	Ppar([
		Pbind(\instruent, \DrumC,
			\out, 30,
			\amp, 0.5,
			\octave, Pseq([Pn(4,64), Pn(3,16)],inf),
			\degree, Pseq([2,2,2,3,2,2,2,5], inf),
			\lagato, Pseq([Pn(0.2,8), 0.6], inf),
			\dur, Pseq([Pn(0.125, 8), Pn(0.25,4)], inf),
		),
		Pbind(\instrument, \DrumA, \amp, 0.7, \legato, 0.9,
			\octave, 2, \degree, Pseq([3,Pn(6,4)],inf),
			\dur, 0.125
	)], inf);
}).play(quant:1);

Pdef(\seqPAF_10_Fader30,
	Pmono(
		\fader, \out, 0, \in, 30, \dur, 0.0625,
		\mute, Pseg(Pseq([0,1], inf),Pseq([0.0625], inf), \step, inf),
		\amp, Pseg(Pseq([0.5,0.9,0.2], inf),Pseq([0.5,0.25], inf),\sin, inf)
	)
).play;
)
(
Pdef(\seqPAF_10_Drum).stop;
Pdef(\seqPAF_10_Fader30).stop;
)
