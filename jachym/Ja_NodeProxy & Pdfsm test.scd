p = ProxySpace.push(s);

~drum.quant = 4;
~drum.play(vol:0.2);

(
~drum[0] = {
	var f = \freq.kr(60);
	var aEnv = EnvGen.kr(Env([0, 1, 0.2, 0.6, 0],[0.05,0.45, 0.29, 0.01], \welch), \aTrig.tr);
	var fEnv = EnvGen.kr(Env([f, 8000, f*1.3, f], [0.003, 0.012, 0.15], \exp), \aTrig.tr);
	Pan2.ar( SinOsc.ar(fEnv) * WhiteNoise.ar(0.05, 0.95) * aEnv, \pan.kr(0));
};
~drum[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1,
	\dur, Pdfsm([
		Pseq([
			\intro,
			Pseq([\s1, \s2, \s1, \s3], 2) ++ \next,
			Pseq([\s1, \s2], 2) ++ \next,
			Pseq([\s1, \s2, \s3], 2) ++ \end,
			Pseq([\outro, \fin])
		]).trace(prefix: "drum "),
		(
			\intro: [1, Pn(2,8)],
		),(
			\s1: [1, Pn(0.5,8)],
			\s2: [1, Pseq([0.5,1,0.5], 2)],
			\s3: [1, Pseq([Pn(0.125, 4), 0.5], 4)],
			\next: [2, Pseq([Pn(0.125, 8), 1,2])],
			\end: [3, Pseq([Pn(0.125, 8),Pn(1,3)])]
		),(
			\s1: [2, Pseq([Pn(0.0625,16), Rest(1)],2)],
			\s2: [2, Pseq([0.5,1.0,Rest(0.5)], 2)],
			\next: [1, Pseq([Pn(0.125, 4),0.5],4)]
		),(
			\outro: [3, Pseq([Pn(0.125, 8),1,2,2,4,8])],
			\fin: [nil]
		)
	],0,1);
);
~drum[2] = \set -> Pbind(\args, [\freq], \dur, 4, \octave, Pseq([2,3], inf), \degree, 3);
~drum[3] = \set -> Pbind(\args, [\pan], \dur, 0.125, \pan, Pseq([-0.7, 0.7], inf));
~drum[30] = \filter -> {|in| LPF.ar(in, \lpfFreq.kr(1800, 6)) };
~drum[32] = \filter -> {|in| FreeVerb.ar(in,0.6, 0.9, 0.1)};
)
~drum.free;