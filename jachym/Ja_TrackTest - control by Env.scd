p = ProxySpace.push(s);

(
// node setUp
~test = NodeProxy(s, \audio);
~test[0] = {
	var aEnv = EnvGen.kr(\ampEnv.kr(Env.newClear(8)),\ampTrig.tr);
	Pan2.kr(SinOsc.ar(\freq.kr(80),mul:aEnv),\pan.kr(0))
};
~test.getKeysValues;
)

(
// sequence setUp
var freqSeq = Pbind(\type, \set, \args, [\freq, \amp], \amp, 0.4, \octave, 3, \degree, Pseq([3,7], inf));
var ampSeq = Pbind(\type, \set, \args, [\ampTrig, \ampEnv], \ampTrig, 1);
var panSeq = Pbind(\type, \set, \args, [\pan]);

~test.play;

// track setUp
Pdfsm([
	Pseq([
		Pseq([\i1,\i2], 3),
		\end
	]).trace(prefix: "phase -> "),
	(
		\i1: [0, Ppar([
			Pbindf(ampSeq, \dur, Pn(1,4), \ampEnv, [Env([0,0.8,0.2,1,0], [0.25,0.05,0.7,0.05], \welch).asArray]),
			Pbindf(freqSeq, \dur, Pn(1,4)),
			Pbindf(panSeq, \dur, Pn(4,1), \pan, 0)
		])
		],
		\i2: [0,
			Ppar([
				Pbindf(ampSeq, \dur, Pn(0.5,8), \ampEnv, [Env.perc(0.25,0.05).asArray]),
				Pbindf(freqSeq, \dur, Pn(0.25,16)),
				Pbindf(panSeq, \dur, Pn(2,2), \pan, Pseq([-0.8,0.8], inf))
			])
		],
		\end: [nil]
	)
],0,1).play;
)

~test.free;
