s.scope(2);
(
SynthDef(\bass, { | out = 0, gate = 1, freq = 90, amp = 1, sustain = 1 |
	var osc, aEnv, fEnv, num, tone;
	num = 20;
	osc = Mix.fill(num,{|i| SinOsc.ar([freq+(i*0.05),freq-(i*0.05)], pi/num*i, 1/num*2)*LFSaw.ar([4,8],0.01*i,0.5,0.5);});
	aEnv = EnvGen.kr(Env.adsr(0.2*sustain,0.2*sustain, 0.6, 0.6*sustain),gate,doneAction:2);
	fEnv = EnvGen.kr(Env([freq,freq/8],[sustain*0.8],\sin));
	tone = LPF.ar(osc,fEnv,aEnv*amp);
	Out.ar(out, tone);
}).add;
)

(
Pdef(\testBass, {
	Ppar([
		Pbind(\instrument, \bass, \amp, 0.5, \legato, 0.3,
			\octave, Pseq([4,5,3],inf), \degree, Pseq([3,4,3,5,3,4,7],inf),
			\dur, Pseq([Pn(0.125,8),0.25,0.25,Pn(0.125,4),0.5], inf)
		),
		Pbind(\instrument, \bass, \amp, 0.5, \legato, 2.3,
			\octave, 3, \degree, Pseq([1,3,\,4,3,\],inf),
			\dur, Pseq([0.25,3.75,Rest(1)], inf)
	)], inf);


}).play(quant:1);
Pdef(\testBass).fadeTime = 10.0;
)
Pdef(\testBass).stop;