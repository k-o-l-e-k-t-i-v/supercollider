s.scope(2);
s.plotTree;
(

SynthDef(\DrumA4, { |out, t_trig, freq, pan, amp, sustain, lpf|
	var fMod = 0.005;
	var aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]),gate:t_trig);
	var fEnv = EnvGen.kr(Env([Rand(700,1100),freq,freq*0.5],[0.1*sustain,0.9*sustain],\exp));
	// - here (in fEnv) is mistake. For correct working is missing ",gate:t_trig", but without that it sound better
	var osc = Pulse.ar(fEnv,fMod*4,SinOsc.kr(55,0,0.85,0.15));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.9, 0.3, 0.1, 1, tone);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\DrumA5, { |out, t_trig, freq, pan, amp, sustain, lpf|
	var fMod = 0.0025;
	var aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]));
	var fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.01*sustain,0.23*sustain],\exp));
	var osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.9, 0.8, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\Saw1, { |bus = 0, gate = 1, amp, freq, sustain, lpf|
	var aEnv1, aEnv2, osc1, osc2, osc3, tone;
	aEnv1 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.45, 0.5*sustain,curve:4),gate, doneAction:2);
	osc1 = LFSaw.ar([freq,freq], 0, SinOsc.kr(2,0,0.15,0.165));
	osc1 = FreeVerb.ar(osc1,0.8,2.7,0.9,1,osc1);
	aEnv2 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.65, 0.45*sustain,curve:-2));
	osc2 = LFSaw.ar([freq-0.01,freq+0.01], 0.5*pi, SinOsc.kr(8,0,0.15,0.165));
	osc2 = FreeVerb.ar(osc2,0.8,5.7,0.5,1,osc2);
	osc3 = Saw.ar([64.01,64], SinOsc.kr(16,0,0.15,0.165));
	tone = (osc1+(osc2*aEnv2)+osc3) * aEnv1 * amp;
	tone = OnePole.ar(tone,SinOsc.ar(0.25,0,0.65,0.3));
	tone = LPF.ar(tone,lpf);
	Out.ar(bus, tone);
}).add;

SynthDef(\Saw4, { |bus = 0, freq = 55, amp = 0.5, gate = 1, sustain = 1, lpf = 110|
	var aEnv, osc, tone, num;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1, 0.7*sustain, -2), gate, doneAction:2);
	num = 6;
	osc =  Mix.fill(num, {|i| LFSaw.ar((freq + (0.1*i))!2,0.0001*i,1/num) * LFSaw.ar(2**i)});
	tone = osc * aEnv * amp;
	tone = OnePole.ar(tone,SinOsc.ar(sustain,0,1));
	tone = LPF.ar(tone,lpf);
	tone = AllpassC.ar(tone,0.133,0.133,1,1,tone);
	tone = FreeVerb.ar(tone,0.133,1,0.5,1,tone);
	Out.ar(bus, tone);
}).add;
)
(
// Pdef(\DrumSeq1).fadeTime = 2;
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \amp, 0.9,
		\dur, Pseq([Pn(0.125,32), Rest(0.5), Pn(0.25,4), Prand([Rest(0.5),Rest(1.5)])], inf),
		\legato, Pseq([0.1,0.2,0.3,0.4,0.7,0.2,0.1], inf),
		\octave, 4, \degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,800], inf)
)).play(quant:1);
)
Pdef(\DrumSeq1).stop;

(
Pdef(\MetalWire).fadeTime = 4;
Pdef(\MetalWire,
	Pmono(\DrumA4, \amp, 3.5, \sustain, Pseq([0.1,0.1,1.2,2.7,0.3,0.1],inf),
		\octave, Pseq([Pn(6,16),Pn(4,8)], inf),
		\degree, Pwrand([4, 7, 11], [0.85,0.1,0.05], inf),
		\dur, Pseq([Prand([1,2,4]), Pn(0.25,6)], inf),
		\pan, Pwhite(-1,1, inf),
		\lpf, Pseg(Pseq([200,1200,200]),Pseq([20,5]),\sin,inf)
	)
).play(quant:1);
)
Pdef(\MetalWire).stop;



(
Pdef(\testSaw1).fadeTime = 2;
Pdef(\seqSaw1,
	Pbind( \instrument, \Saw1, \amp, 0.9,
		\dur, Pseq([2,2,6,0.5,3.5], inf), \legato, Pseq([1.9,1.3,1.7,1.4,1.1], inf),
		\octave, Prand([Pn(4,5),Pn(5,5)],inf), \degree, Pseq([3,3b,6,6b], inf),
		\lpf, Pwhite(200,1800,inf),
	)
).play(quant:1);
)
Pdef(\seqSaw1).stop;

(
Pdef(\testSaw4).fadeTime = 2;
Pdef(\testSaw4,
	Pbind( \instrument, \Saw4, \amp, Pseq([1,0.85], inf),
		\dur, 4, \legato, Pwhite(1.1,1.6,inf),
		\octave, Pseq([4,5,5,7], inf), \degree, Pseq([5,Prand([3,3b,4,7]),5,Pxrand([4,4b,6])], inf),
		\lpf, Pn(Pseries(200,25,20),inf),
	);
).play(quant:1);
)
Pdef(\testSaw4).stop;