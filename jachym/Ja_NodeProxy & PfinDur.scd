p = ProxySpace.push(s);

~q.play(vol:0.4).quant_(1);
(
~q[0] = {
	var aEnv = EnvGen.kr(Env.perc(0.01, 0.69), \aTrig.tr, timeScale:\delta.kr(1));
	Pan2.ar(SinOsc.ar(\freq.kr(60), mul: aEnv), \pan.kr(0));
};
~q[1] = \set -> Ptpar([
	0,Pfindur(4, Pbind(\args, [\aTrig], \aTrig, 1, \dur, 1)),
	4,Pfindur(2, Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([0.25,0.25,0.5], inf))),
	6,Pfindur(2, Pbind(\args, [\aTrig], \aTrig, 0))
],inf).trace;
~q[2] = \set -> Ptpar([
	0,Pfindur(16, Pbind(\args, [\freq], \octave, 4, \degree, 3)),
	16,Pfindur(8, Pbind(\args, [\freq], \octave, 7, \degree, Pseq([7,3], inf), \dur, 0.25)),
],inf);
)

~q.monitor.fadeTime = 10.0;
~q.monitor.stop;
~q.play(vol:0.9);
~q.play(vol:0.2);
~q.monitor.stop(4);
~q.free;
