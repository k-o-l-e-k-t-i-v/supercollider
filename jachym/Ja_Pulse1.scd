s.scope(2);

(
SynthDef(\Pulse1, { |bus = 0, gate = 1, freq, amp, sustain|
	var aEnv, osc, num, tone;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1, 2.7*sustain, -2),gate,doneAction:2);
	num = 16;
	osc = Mix.fill( num, {|i|
		CombN.ar(Pulse.ar(freq,0.5+(i*0.005),1),0.1,1/(40+i*10),sustain,1/num)*Pulse.ar([5,4],0.3+(i*0.05),LFSaw.kr([5,4],0.5+(i*0.005),0.8,0.2))
	});
	tone = osc * aEnv * amp;
	tone = FreeVerb.ar(tone, 0.83,1,0.5,1, tone);
	Out.ar(bus, tone);
}).add;

SynthDef(\Pulse2, { |bus = 0, gate = 1, freq, amp, sustain|
	var aEnv, osc, num, tone;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1, 0.7*sustain, -2),gate,doneAction:2);
	num = 8;
	osc = Mix.fill( num, {|i|
		CombN.ar(Pulse.ar(freq,0.6+(i*0.005),1),sustain,1/(32+(i*8)),sustain*2,1/num)*Pulse.ar([5,4],0.4+(i*0.16),SinOsc.kr([num,num+1],0.7+(i*0.002),0.6,0.2))
	});
	tone = osc * aEnv * amp;
	tone = FreeVerb.ar(tone, 0.83,0.2,0.7,1, tone);
	Out.ar(bus, tone);
}).add;
)

(
Pdef(\testPulse,
	Pbind(\instrument, \Pulse2, \amp, 0.9, \octave, Pseq([Pn(2,32),Pn(4,2)], inf) , \degree, Pseq([4, 4, 7, 4b], inf),
		\dur, Pseq([Pxrand([Pn(0.125, 126), Rest(0.25), Pn(0.125,60)]), 0.5], inf),
		\legato, 1.8
	)
).play(quant:1);
)
(
Pdef(\testPulse,
	Pbind(\instrument, \Pulse1, \amp, 0.7, \octave, Pseq([Pn(2,32),Pn(6,2)], inf) , \degree, Pseq([4, 4, 5, 4b], inf),
		\dur, Pseq([Pxrand([Pn(0.125, 126), 0.25, Pn(0.125,60)]), 0.5], inf),
		\legato, 1.6
	)
).play(quant:1);
// Pdef(\drum).fadeTime = 4;
)

Pdef(\testPulse).stop;