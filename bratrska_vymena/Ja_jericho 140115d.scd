s.scope(2);
(
SynthDef(\SawJerich1, {|out, gate = 1, freq, sustain, amp|
	var aEnv = EnvGen.kr(Env([0,0.75,0.25,1,0], [0.3,0.05,0.15, 0.5]*sustain, [\welch, \sin,\sin,\welch]),gate);
	var fEnv = Mix.fill(20, {|i| SinOsc.ar([64,65],0.01*i,Rand(5,10));});
	var osc = LFSaw.ar(freq,0,[0.4,0.3],SinOsc.ar([sustain/8,sustain/16],0.001,0.4));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone, 500);
	tone = FreeVerb.ar(tone, 0.4, 0.7, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\SinJerich1, {|out, gate = 1, freq, sustain, amp|
	var aEnv = EnvGen.kr(Env([0.01,0.75,0.25,1,0.01], [0.3,0.05,0.15, 0.7]*sustain, [\welch, \sin,\sin,\welch]),gate,doneAction:2);
	var fEnv = Mix.fill(64, {|i| SinOsc.ar(1,sustain/64*i,Rand(0.1,5));});
	var osc = SinOsc.ar([freq+fEnv,freq+fEnv+5],0,[0.3,0.4],0.7)*Pulse.ar([8,16,64,65],[0.15,0.17,0.8],0.8,0.2);
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone, 300);
	tone = AllpassC.ar(tone,0.5,0.125,0.5,1,tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\PulseJerich1, {|out, gate = 1, freq, sustain, amp|
	var aEnv = EnvGen.kr(Env.adsr(0.01*sustain,0.24*sustain,0.1,0.75*sustain),gate);
	var fEnv = Mix.fill(80, {|i| SinOsc.ar(10,pi/80*i,Rand(0,5));});
	var osc = SinOsc.ar([freq+fEnv,freq+fEnv+10],0,0.7,Saw.ar([64,65],0.8,0.2));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone, 800);
	tone = AllpassC.ar(tone/2,0.5,0.25,4.5,1,tone/2);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.0025*sustain;
	aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]), gate);
	fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.12*sustain,0.88*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.2, 0.8, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;
)
Env([0,0.35,0.15,1,0], [0.3,0.05,0.15, 0.5]*1, [\welch, \lin,\sin,\lin]).plot;

(
// Pdef(\seqSaw1).fadeTime = 0.5;
Pdef(\seqSaw1,
	Ppar([
		Pbind(\instrument, \SawJerich1, \out, 0, \amp, 0.55, \dur, 8, \legato, 0.7,
			\octave, 4, \degree, Pseq([Pn(3,2), 6],inf)
		),
		Pbind(\instrument, \SawJerich1, \out, 0, \amp, 0.65, \dur, 2, \legato, 1.4,
			\octave, 1, \degree, Pseq([3,7,7,7, 6,6,5,5,4,4],inf)
		)
	],inf)
).play(quant:1);
)
Pdef(\seqSaw1).stop;

(
Pdef(\seqSaw2).fadeTime = 0.5;
Pdef(\seqSaw2,
	Ppar([
		Pbind(\instrument, \SawJerich1, \out, 0, \amp, 0.5, \dur, Pseq([1,1,0.5,0.25,0.25], inf), \legato, 0.2,
		\octave, 5, \degree, Pseq([Pn(3,2), 6,Pn(2,2), 4],inf)
	),
		Pbind(\instrument, \SawJerich1, \out, 0, \amp, 0.25, \dur, 4, \legato, 0.8,
		\octave, 3, \degree, Pseq([Pn(1,8), 6,Pn(3,2), 4],inf)
	)], inf)
).play(quant:1);
)
Pdef(\seqSaw2).stop;

(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \amp, 0.6, //Pseq([Pn(0.6,14),Pn(0.8,7)], inf) ,
		\dur, 0.5,
		// \dur, Pseq([0.25,0.25,0.5,Rest(0.5),0.25,0.25,Rest(0.5)], inf),
		// \dur, Pseq([Pn(0.25,4), 0.125,0.125], inf),
		// \dur, Pseq([Pn(0.125,7), Rest(0.25), Pn(0.125,8), Prand([Rest(0.25),Rest(0.5),Rest(1)])], inf),
		// \dur, Pseq([Pn(0.25,4), Rest(2), Pn(0.25,4), Rest(1)], inf), \legato, 0.1,
		// \dur, Pseq([Pn(0.25,32), 0.125,0.125], inf),
		// \legato, Pseq([0.15,0.16,0.13,0.15,0.17,0.11,0.17], inf),
		\octave, Pseq([Pn(2,6),Pn(3,2)], inf),
		\degree, Pseq([3,3,3,4,3b], inf),
		\lpf, Pseq([250,50,8000,200,800], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\DrumSeq1).stop;

(
// Pdef(\seqSin1).fadeTime = 2;
Pdef(\seqSin1,
	Pbind(\instrument, \PulseJerich1, \out, 0, \amp, 0.75,
		\dur, Pseq([3.5,0.5,4,8], inf),
		\legato, Pseq([0.1,1.3,0.5,1.7,0.4,0.9], inf), // this is IT, Alex
		\octave, Pseq([Pn(1,4),Pn(2,2)], inf) ,
		\degree, Pswitch([
			Pseq([4,4,5,4]),
			Pseq([4,7,5,4]),
			Pseq([4,2,5,4])
		], Pseq([0,0,1,0,2], inf))
	)
).play(quant:1);
)
Pdef(\seqSin1).stop;

// hezke k.