p = ProxySpace.push(s);
p.arProxyNames;
p.krProxyNames;


(
~osc[0] = {
	var env1 = EnvGen.ar(Env.perc(0.05, 1.95), \ampTrig.tr);
	var env2 = EnvGen.ar(Env.perc(0.95, 0.05), \ampTrig.tr);
	var arrEnv = [env1,env2];
	Pan2.ar(SinOsc.ar(\freq.kr(80,0.0625)) * arrEnv.at(\idTrig.kr), \pan.kr(0,0.25));
};
)
~osc.play(fadeTime:2, vol:0.9).quant_(1);

~ampKr = Pbind(\type, \set, \args, [\ampTrig, \idTrig], \dur, 1, \ampTrig, 1, \idTrig, Pseq([0,0,1], inf)).trace;
~panKr = Pbind(\type, \set, \args, [\pan], \dur, 0.5, \pan, Pseq([-0.8, 0.8], inf)).trace;
~freqKr = Pbind(\type, \set, \args, [\freq], \dur, 4, \octave, 2, \degree, Pseq([3,3,4,7], inf)).trace;

p.play;
p.fadeTime = 2;
p.quant = 1;

p[\panEvent] = Pbind(\type, \set, \args, [\pan], \dur, 0.5, \pan, Pseq([-0.8, 0.8], inf));
p[\freqEvent] = Pbind(\type, \set, \args, [\freq], \dur, 4, \octave, 3, \degree, Pseq([3,4,3,7], inf));

p[\signal].play(vol:0.3).quant_(1);
(
p[\signal][0] = {
	var env1 = EnvGen.ar(Env.perc(0.05, 1.95), \ampTrig1.tr);
	var env2 = EnvGen.ar(Env.perc(1.95, 0.05), \ampTrig2.tr);
	Pan2.ar(SinOsc.ar(\freq.kr(80,0.0625)) * env, \pan.kr(0,0.25));
};
p[\signal][1] = \set -> Pbind(\args, [\ampTrig1, \ampTrig2], \dur, 1,
	\ampTrig1, Pseq([1,1,0], inf),
	\ampTrig2, Pseq([0,0,1], inf));
)
p[\signal].set(\pan, 0);
p[\signal].rebuild;


