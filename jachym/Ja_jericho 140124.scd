// use Ja_Mixer to play

s.scope(2);
s.plotTree;

(
SynthDef(\SinJerich1, {|out, gate = 1, freq, sustain, amp,lpf|
	var aEnv = EnvGen.kr(Env([0.01,0.75,0.25,1,0.01], [0.3,0.05,0.15, 0.7]*sustain, [\welch, \sin,\sin,\welch]),gate,doneAction:2);
	var fEnv = Mix.fill(64, {|i| SinOsc.ar(freq,sustain/64*i,Rand(0.1,5));});
	var osc = SinOsc.ar([freq+fEnv,freq+fEnv+5],0,[0.3,0.4],0.7)*Pulse.ar([35,40,164,165],[0.15,0.17,0.8],0.8,0.2);
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone, lpf);
	DetectSilence.ar(tone, doneAction:2);
	tone = Pan2.ar(tone,SinOsc.kr(1));
	Out.ar(out, tone);
}).add;

SynthDef(\PulseJerich1, {|out, gate = 1, freq, sustain, amp|
	var aEnv = EnvGen.kr(Env.adsr(0.01*sustain,0.24*sustain,0.1,0.75*sustain),gate);
	var fEnv = Mix.fill(80, {|i| SinOsc.ar(10,pi/80*i,Rand(0,5));});
	var osc = SinOsc.ar([freq+fEnv,freq+fEnv+10],0,0.7,Saw.ar([8,9,64,65],0.8,0.2));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone, 800);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.0025*sustain;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain,0.3*sustain,0.5,0.65*sustain), gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(4700,6100),freq,freq*0.5],[0.09*sustain,0.91*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15)) * LFSaw.ar([1,2,4,10],0,0.2,0.8);
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv + lpf);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\LFSaw2x, { |out, gate = 1, freq, sustain, amp, lpf|
	var aEnv = EnvGen.ar(Env([0,1,1,0],[0.25*sustain,0.5*sustain,0.25*sustain],\step), gate);
	var osc = LFSaw.ar([1,2,4,8]) * LFSaw.ar([freq,freq+0.1,freq+0.2,freq+0.3]);
	var tone = osc * aEnv * amp;
	tone = OnePole.ar(tone,SinOsc.ar(0.1).range(-0.9,0.9));
	tone = LPF.ar(tone,lpf);
	tone = AllpassC.ar(tone,0.133,0.133,1);
	tone = FreeVerb.ar(tone,0.133,1);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out, Splay.ar(tone));
}).add;
)

(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \amp, 1, \out, ~ch0, \group, ~synG,
		\dur, 0.25, //Pseq([Pn(Pseq([0.75,0.25]),8),Pn(Pseq([0.5,0.5]),4)],inf),
		\legato, Pseq([0.25,0.26,0.23,0.25,0.27,0.11,0.77], inf),
		\octave, Pseq([2,2,2,3], inf), //Pseq([Pn(2,32),Pn(3,4)], inf),
		\degree, Pseq([3,3,3,4,3b,3,3,7], inf),
		\lpf, Pseq([450,150,8000,600,1000], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\DrumSeq1).stop;

(
Pdef(\DrumSeq2,
	Pbind(\instrument, \PulseJerich1, \amp, 1, \out, ~ch1, \group, ~synG,
		\dur, 0.5, //Pseq([Pn(0.125,32),Pn(0.25,4),Pn(0.125,8),Pn(0.5,2)], inf),
		\legato, Pseq([Pn(0.8,16), 2.4], inf),
		\octave, 4,
		\degree, Pseq([Pn(4,8),4b,5,6,7], inf),
		\lpf, Pseq([2500,5000,8000,200,8000], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\DrumSeq2).stop;

(
Pdef(\DrumSeq3,
	Pbind(\instrument, \PulseJerich1, \amp, 1, \out, ~ch2, \group, ~synG,
		\dur, Pseq([Pn(0.5,64), Pn(0.25,8),Pn(0.5,64), Pn(0.125,16), Rest(4)], inf),
		\legato, 0.2,
		\octave, 5,
		\degree, Pseq([4,4,4,3b,4,4,7,4,3,2,4], inf),
		\lpf, Pseq([2500,5000,800], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\DrumSeq3).stop;

(
Pdef(\DrumSeq4,
	Pbind(\instrument, \SinJerich1, \amp, 1, \out, ~ch3, \group, ~synG,
		// \dur, Pseq([Pn(0.25,16),0.5,1.5,3.5, Prand([Rest(1),Rest(2),Rest(4)])],inf),
		\dur, Pseq([8,6,2,8,3.5,0.5], inf),
		// \dur, Pseq([0.25,0.25,0.5,Rest(0.5),0.25,0.25,Rest(0.5)], inf),
		// \dur, Pseq([Pn(0.25,4), 0.125,0.125], inf),
		// \dur, Pseq([Pn(0.125,7), Rest(0.25), Pn(0.125,8), Prand([Rest(0.25),Rest(0.5),Rest(1)])], inf),
		// \dur, Pseq([Pn(0.25,4), Rest(2), Pn(0.25,4), Rest(1)], inf), \legato, 0.1,
		// \dur, Pseq([Pn(0.25,32), 0.125,0.125], inf),
		\legato, 1.2, //Pseq([0.15,0.16,0.13,0.15,0.17,0.11,0.17], inf),
		\octave, 5,
		\degree, Pseq([4,4,4,3b,4,4,7,4,3,2,4], inf),
		\lpf, Pseq([2500,5000,800], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\DrumSeq4).stop;

(
Pdef(\DrumSeq5,
	Pbind( \instrument, \LFSaw2x, \amp, 1, \out, ~ch4, \group, ~synG,
		\dur, 1,
		\legato, 1.4,
		\octave, Pseq([Pn(7,16),Pn(4,4)], inf),
		\degree, Pseq([3,3,3,4,3,3,5,7], inf),
		\lpf, Pn(Pseries(100,50,10),inf),
	)
).play;
)
Pdef(\DrumSeq5).stop;