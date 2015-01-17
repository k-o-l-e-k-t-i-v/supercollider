s.scope(2);
(
SynthDef(\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp);
	tone = osc * aEnv;
	tone = AllpassC.ar(tone*0.5,sustain*0.1,sustain*0.0625,sustain/2, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 300);
	DetectSilence.ar(tone,time:sustain*0.1,doneAction:2);
	Out.ar(out, tone);
}).store;

(
SynthDef(\SawB, { |out = 0, gate = 1, sustain = 1, freq = 150, amp = 0.2|
	var osc, tone, num, fEnv, aEnv;
	num = 2;
	aEnv = EnvGen.kr(Env.asr(0.35*sustain, 0.3, 0.65*sustain,4),gate, doneAction:2);
	fEnv = LFSaw.kr([Rand(freq*2-0.8,freq*2+0.2),Rand(freq*2-0.2,freq*2+0.8)],0,0.8,0.2);
	// osc = Mix.fill(num, { |i| VarSaw.ar(fEnv, 0 ,0.01*i, 1/LFPulse.kr(65.1,0.005*i,0.7,0.3),0.2)*Pulse.ar(freq*1.5,0.2,1/num,0.3)});
	osc = Mix.fill(num, { |i| LFSaw.ar(fEnv,0.1*i, SinOsc.kr(freq,0,SinOsc.kr(freq/2,0,0.8/num),0.2/num))*LFPulse.ar(freq*1.5,0.01*i,0.8,0.7/num,0.3/num)});
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv+1800);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(2,0,0.7)));
	// Out.ar(out, tone);
}).add;
)
)

// test patterns

(
Pdef(\testSawA, {
		Pbind(\instrument, \SawB, \amp, 1, \legato, 1.1, \octave, 2, \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
		// \dur, Pseq([0.125,0.125,3.25], inf)
		\dur, 10
	)
	}).play(quant:1);
Pdef(\testSawA).fadeTime = 1.0;
)
Pdef(\testSawA).stop;

(
Pdef(\seqSawB, {
	Ppar([
		Pbind(\instrument, \SawA, \amp, 0.5, \legato, 1.2, \octave, Pseq([1,1,1,2,2,3], inf), \degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\dur, Pseq([10],inf)
		),
		Pbind(\instrument, \DrumA, \amp, 0.8, \legato, 0.9, \octave, 3, \degree, Pseq([3,Pn(6,4)],inf),
			\dur, Pseq([0.25],inf)
		),
		Pbind(\instrument, \SawA, \amp, 0.5, \legato, 0.6, \octave, 2, \degree, Pseq([Pn(4,2),Pn(11,8)],inf),
			\dur, Pseq([Rest(0.125),0.25,0.125],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\seqSawB).fadeTime = 4.0;
)
Pdef(\seqSawB).stop;

(
Pdef(\testSawC, {
	Pbind(\instrument, \SawB, \amp, 0.5,
		\octave, Pseq([2,2,2,3], inf),
		\dur, Pseq([Pn(0.0625, 64),0.5],inf),
		\degree, Pseq([
			Pn(2, 64),3,
			Pn(2, 64),\,
			Pn(2, 64),5,
			Pn(2, 64),\,
			Pn(2, 64),11
		],inf),
		\legato, Pseq([Pn(0.9,64),1.3],inf)
	)
}).play(quant:1);
Pdef(\testSawC).fadeTime = 1;
)
Pdef(\testSawC).stop;
