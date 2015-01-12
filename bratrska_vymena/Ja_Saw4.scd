s.scope(2);

(
SynthDef(\Saw1, { |bus = 0, gate = 1, amp, freq, sustain, lpf|
	var aEnv1, aEnv2, osc1, osc2, osc3, tone;
	aEnv1 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.45, 0.5*sustain,curve:4),gate, doneAction:2);
	osc1 = LFSaw.ar([freq,freq], 0, SinOsc.kr(8,0,0.15,0.165));
	osc1 = FreeVerb.ar(osc1,0.8,2.7,0.9,1,osc1);
	aEnv2 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.65, 0.45*sustain,curve:-2));
	osc2 = LFSaw.ar([freq-0.01,freq+0.01], 0.5*pi, SinOsc.kr(8,0,0.15,0.165));
	osc2 = FreeVerb.ar(osc2,0.8,5.7,0.5,1,osc2);
	osc3 = Saw.ar([4.01,64], SinOsc.kr(16,0,0.15,0.165));
	tone = (osc1+(osc2*aEnv2)+osc3) * aEnv1 * amp;
	tone = OnePole.ar(tone,SinOsc.ar(0.25,0,0.65,0.3));
	tone = LPF.ar(tone,lpf);
	Out.ar(bus, tone);
}).add;

SynthDef(\Saw4, { |bus = 0, freq = 55, amp = 0.5, gate = 1, sustain = 1, lpf = 110|
	var aEnv, osc, tone, num;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1, 0.7*sustain, -2), gate, doneAction:2);
	num = 4;
	osc =  Mix.fill(num, {|i| LFSaw.ar((freq + (0.1*i))!2,0.0001*i,1/num) * LFSaw.ar(2**i)});
	tone = osc * aEnv * amp;
	tone = OnePole.ar(tone,SinOsc.ar(sustain,0,0.9));
	tone = LPF.ar(tone,lpf);
	tone = AllpassC.ar(tone,0.133,0.133,1,1,tone);
	tone = FreeVerb.ar(tone,0.133,1,0.5,1,tone);
	Out.ar(bus, tone);
}).add;
)

(
Pdef(\seqSaw1,
	Pbind( \instrument, \Saw1, \amp, 0.9,
		\dur, Pseq([0.75,0.25,3], inf), \legato, 1.4,
		\octave, 2, \degree, Pseq([4,4,4,4b], inf),
		\lpf, Pn(Pseries(1200,-25,40),inf)
	)
).play(quant:1);
)
(
Pdef(\testSaw4,
	Pbind( \instrument, \Saw4, \amp, Pseq([0.6,0.3], inf),
		\dur, 4, \legato, 2.6,
		\octave, Pseq([6,4,7], inf), \degree, Pseq([5,5,4b,Pxrand([4,5b,6])], inf),
		\lpf, Pn(Pseries(200,25,20),inf),
	);
).play(quant:1);
)

Pdef(\seqSaw1).stop;
Pdef(\testSaw4).stop;



