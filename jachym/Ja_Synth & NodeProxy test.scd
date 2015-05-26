ProxySpace.push(s);

(
ProxySynthDef(\oscA, { |oscT, freq, pan = 0, idSel = 0|
	var aEnv = Select.kr(idSel,
		[
			EnvGen.kr(Env.perc(0.05,0.45), oscT),
			EnvGen.kr(Env.perc(0.92,0.05), oscT),
		]
	);
	Pan2.ar(SinOsc.ar(freq,mul:0.5)*aEnv,pan);
},[\tr,0,0.25,0,0]).add; // trig or lag time of args in sec
)

(
~oscA[0] = \oscA;
~oscA[1] = \set -> Pbind(\args, [\oscT, \idSel], \oscT, 1, \idSel, 0, \dur, 0.25).trace;
~oscA[2] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,3,7,4], inf), \dur, 2).trace;
~oscA.play(vol:0.9).quant_(1);
)

(
~oscB[0] = \oscA;
~oscB[1] = \set -> Pbind(\args, [\oscT, \idSel], \oscT, 1, \idSel, 1, \dur, 1).trace;
~oscB[2] = \set -> Pbind(\args, [\freq], \octave, 4, \degree, Pseq([3,3b,6,4], inf), \dur, 4).trace;
~oscB.play(vol:0.4).quant_(1);
)
