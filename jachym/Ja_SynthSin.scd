(
SynthDef(\SinA, { |out = 0, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv,fEnv, num;
	num = 5;
	osc = Mix.fill(num, {|i|
		fEnv = Line.kr(1,0.6,(0.85+(0.01*i))*sustain);
		SinOsc.ar([freq+(i*0.001), freq-(i*0.001)],0,1/num)*SinOsc.ar([16,16.01]+(0.005*i),0.005*i,0.9,fEnv)});
	aEnv = EnvGen.ar(Env.adsr(0.1*sustain,0.3*sustain,0.6,0.6*sustain),gate,doneAction:2);
	osc = osc * aEnv * amp;
	Out.ar(out, osc);
}).store;

SynthDef(\SinB, { |out = 0, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv, num;
	aEnv = EnvGen.kr(Env([0,1,0.3,0.5,0.2,0.4,0],[0.5*sustain,0.01*sustain,0.19*sustain,0.01*sustain,0.29*sustain],\welch),gate,amp,doneAction:2);
	num = 21;
	osc = Mix.fill(num, {|i| SinOsc.ar([freq+(0.005*i),freq-(0.005*i)],0.0001*i,1/num*VarSaw.kr([63,64],0.0001*i,0.1,0.7,0.3))});
	osc = LPF.ar(osc,freq+800,osc);
	osc = AllpassC.ar(osc,0.2,0.2,1,1,osc)*aEnv;
	Out.ar(out, osc);
}).store;
)

(
Pdef(\testSinA, {
	Pbind(\instrument, \SinA, \amp, 0.5, \octave, 3,
		\dur, Pseq([Pn(0.0625,9), 5], inf),
		\legato, Pseq([Pn(0.05,9), 1], inf),
		\degree, Pseq([4,5,8], inf)
	)
}).play(quant:1);
Pdef(\testSinA).fadeTime = 10;
)
Pdef(\testSinA).stop(5);

(
Pdef(\testSinB, {
	Pbind(\instrument, \SinB, \amp, 0.5, \octave, 4,
		\legato, Pseq([Pn(1.0,11),Pn(1.3,2)], inf),
		\degree, Pseq([Pn(4,11),Pn(3,2)], inf),
		\dur, Pseq([Pn(0.0625,11),6.5, Rest(2.125)], inf)
	)
}).play(quant:1);
Pdef(\testSinB).fadeTime = 4.0;
)
Pdef(\testSinB).stop;

(
Pdef(\testSinB, {
	Ppar([
		Pbind(\instrument, \SinA, \amp, 0.2, \dur, 2.5, \legato, 2, \octave, 3, \degree, Pseq([4,4,6,5], inf))
		,
		Pbind(\instrument, \SinA, \amp, 0.1, \dur, 5, \legato, 0.7, \octave, 4, \degree, Pseq([4,5,3,4], inf))
		,
		Pbind(\instrument, \SinA, \amp, 0.1, \dur, 5, \legato, 1.0, \octave, 6, \degree, Pseq([4,5,3,5], inf))
	],inf)
}).play(quant:5);
Pdef(\testSinB).fadeTime = 4.0;
)
Pdef(\testSinB).stop;
