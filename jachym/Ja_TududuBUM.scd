(
SynthDef(\test, {|gate = 1,freq,sustain,amp|
	var aEnv = EnvGen.ar( Env.adsr(0.05*sustain, 0.15*sustain, 0.4, 0.8*sustain),gate, doneAction:2);
	var osc1 = SinOsc.ar([freq/2,freq/3],0,0.5) * VarSaw.ar(Saw.kr(8, 40, 80),0.8,0.2);
	var osc2 = LFCub.ar(BrownNoise.ar(0.6*freq/3,0.4*freq/3)!2,0.03,0.5);
	var tone = Mix.new([osc1, osc2] * aEnv * amp);
	Out.ar(32,  tone);
}).add;
)
Ndef(\efx3, { var freq = 8600; Out.ar(0, LPF.ar(In.ar(32,2), SinOsc.kr(1/16,0,freq,freq+1600))); }).play;

(
Pdef(\x, Pbind(	\instrument, \test,	\dur, 1/4, \amp, 0.8, \legato, 0.9, \octave, 4, \degree, Pseq([3,3,7,4],4)));
Pdef(\y, Pbindf( Pdef(\x), \octave, 2, \legato, 1.4));
Pdef(\z, Pbindf( Pdef(\y), \dur, 1/8));
Pdef(\w, Pbindf( Pdef(\x), \dur, 1/16, \octave, Prand([8,2],8), \legato, Pseries(0.5,0.1,8)));
)

(
Pdef(\a).fadeTime = 0.2;
Pdef(\a).quant = 4;
Pdef(\a,
	Pmul(\dur, Pwhite(-0.08, 0.08) + 1,
		Pseq([
			Ppar([Pdef(\x), Pdef(\y)]),
			Pn(Pdef(\x),4),
			Pdef(\y),
			Pdef(\z),
			Ppar([Pdef(\x), Pbindf(Pdef(\y), \legato, 0.5)]),
			Pn(Pdef(\w),2)
		], inf)
	)
).play;
)