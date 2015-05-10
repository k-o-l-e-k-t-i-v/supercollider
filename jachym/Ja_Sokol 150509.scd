t = TempoClock.new(1).permanent_(true);
p = ProxySpace.push(s, clock:t);

t.beats;

~q.clock = t;
~q.play(fadeTime:4, vol:0.45).quant_(8);
~q.rebuild;
(
~q[0] = {
	var ampEnv = EnvGen.ar(Env.perc(0.95,0.05),\aTrig.tr);
	var ampEnv2 = EnvGen.ar(Env.perc(0.05,0.25),\aTrig2.tr);
	var ampEnv3 = EnvGen.ar(Env([0,0.7,0.2,1,0], [0.35,0.05,0.5,0.1], \exp),\aTrig3.tr);
	var freqEnv = EnvGen.ar(Env([\freq.kr(160, 2), 2200, \freq.kr(160, 2)], [0.003, 0.002],[\exp, \welch]),\fTrig.tr) ;
	Pan2.ar( SinOsc.ar(freqEnv, 0, ampEnv) * LFPulse.ar(\freq.kr(160, 2), 0, 0.9, 0.2, 0.8), 0);
};
~q[1] = \set -> Pbind(\args, [\aTrig, \fTrig],
	\dur,Pswitch([
		Pseq([Pn(0.0625, 4),0.25, 3.5], inf),
		Pseq([Pn(0.0625, 8),0.25, 3.25], inf),
		Pseq([Pn(0.0625, 16), 0.5, 3], inf)
	], Pseq([0,0,0,1,0,2], inf)),
	\fTrig, 1,
	\aTrig, Pseq([1,0,0], inf), \aTrig2, Pseq([0,1,0], inf), \aTrig3, Pseq([0,0,1], inf),
);
~q[2] = \set -> Pbind(\args, [\freq], \dur, 2,
	\octave, Pstutter(Pseq([6,2], inf), Pseq([3,4], inf)),
	\degree, Pseq([3,3,3,7], inf)
);
// ~q[3] = nil;
// ~q[3] = \set -> Pbind(\args, [\octave], \dur, Pseq([16,4], inf), );
~q[30] = \filter -> {|in| GVerb.ar(in, 180, 8) };
~q[31] = \filter -> {|in| LPF.ar(in, Saw.kr(4).range(400, 8000)) };
)
~q.end(10);