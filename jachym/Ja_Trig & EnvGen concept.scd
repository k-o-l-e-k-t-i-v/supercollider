p = ProxySpace.push(s);
s.plotTree;

// .tr = trig!!!!! set to 1 by Pbind and immediately after back to 0
(
~q[0] = {
	var ampEnv = EnvGen.ar(Env.perc(0.05,0.95),\aTrig.tr);
	var panEnv = EnvGen.ar(Env([-1,1,-1,0.5,-1], [0.25,0.75,0.5,0.1], \sin),\pTrig.tr);
	Pan2.ar( LFSaw.ar(\freq.kr(60), 0, ampEnv), panEnv);
};
~q[1] = \set -> Pbind(\args, [\aTrig], \dur, Pseq([0.25,0.25,0.5], inf), \legato, 1.2, \aTrig, 1);
~q[2] = \set -> Pbind(\args, [\pTrig], \dur, 2, \pTrig, 1);
~q[3] = \set -> Pbind(\args, [\freq], \dur, 8, \octave, Pseq([3,4], inf), \degree, 3 );
)
~q.play; ~q.quant = 1;