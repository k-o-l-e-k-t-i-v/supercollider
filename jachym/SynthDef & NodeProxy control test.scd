(
SynthDef(\drum, {|aTrig = 0, freq = 60, pan = 0, lpf = 1800, amp = 0.0|

	// var f = [freq, freq + 22, freq + 24, freq + 38];
	var f = [60,82,84,98];
	var aEnv = EnvGen.kr(Env([0, 1, 0.45, 0],[[0.01,0.05], [0.29,0.27], [1.5, 0.29, 0.35, 1.57]], \welch), aTrig);
	var fEnv = EnvGen.kr(Env([f, 18000, f*1.4, f], [0.003, 0.011, 0.15], \exp), aTrig);
	var num = 8;
	var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.05*i,1/num) * BrownNoise.ar(0.3, SinOsc.kr([8, 16.01], 0, 0.7))});
	var lpfEnv = EnvGen.kr(Env([250, lpf, 800, 50],[0.03, 0.37, 0.7], \exp), aTrig);

	osc = AllpassC.ar(osc, 0.06,0.001,4.75);
	osc = LPF.ar(osc, lpfEnv);
	osc = FreeVerb.ar(osc, 0.12,0.47,0.95);
	Out.ar(0, Pan2.ar(osc * aEnv * amp, pan));
},
[\tr, 0.25, 0.25, 16, 8]
// [0, 60, 0, 1800, 0.7]
).store;
)


ProxySpace.push(s);
~d.play;
~d[0] = \drum;
~d[1] = \set -> Pbind(\aTrig, 1, \dur, 1).trace;
~d[2] = \set -> Pbind(\pan, Pseq([0.8,-0.8], inf), \dur, 2).trace;
~d.set(\lpf, 2000);
~d.set(\amp, 0.9);
~d.stop(8);

~b = SynthControl.new(\drum);
~b.controlNames;
~b.synthDesc;