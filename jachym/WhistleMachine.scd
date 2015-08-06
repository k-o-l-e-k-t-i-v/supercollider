AutoIDE.run

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(480/60);

~test.play(vol: 0.9, fadeTime: 8).quant_(2);
(
~test[0] = {
	var aEnv = EnvGen.ar(Env([0.0001,1,0.2,0.0001], [0.001,0.3,0.4], [\exp, \welch, \step]), \aTrig.tr);
	var fEnv = Select.ar(\sel.kr(0),
		[
			EnvGen.ar(Env([\freq.kr(60,4),30,\freq.kr(60,4)], [0.003,0.08], \welch), \aTrig.tr),
			EnvGen.ar(Env([\freq.kr(60,4),2000,\freq.kr(60,4)], [0.04,0.002], \exp), \aTrig.tr),
		]
	);
	var num = 8;
	var osc = Mix.fill(num, {|i| LFSaw.ar(fEnv,0.005*i,1/num) * BrownNoise.ar(0.2,0.8) });
	Pan2.ar( osc * aEnv , \pan.kr(0,0.125) );
}
)

~test[99] = \filter -> {|in| Limiter.ar(in, 0.95) };

(
~test[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1,
	\dur, Pswitch([
		Pseq([Pn(0.5, 15), 0.25,0.25]),
		Pseq([Pn(0.25, 2), 0.5, 0.5, Rest(0.5)])
	], Pseq([0,0,0,1], inf)
	);
)
)
~test[2] = \set -> Pbind(\args, [\sel], \sel, Pseq([0,0,0,1], inf), \dur, 2);

~test[3] = \filter -> {|in| FreeVerb.ar(in, 0.13, 0.8, 0.3) };

~test[4] = \filter -> {|in| LPF.ar(in, Saw.kr(1/32, mul:1200, add:1800)) };

~test[5] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(4, 4), \gverb_time.kr(0.10, 1)) };

~test[6] = \filter -> {|in| RLPF.ar(in, \rlpf_freq.kr(1200, 8), SinOsc.kr(1/6, mul:0.4, add:0.6))};

~test[7] = \set -> Pbind(\args, [\pan], \pan, Pseq([-0.9, 0.9, -0.3, 0.3], inf), \dur, 0.5);

~test[8] = \filter -> {|in| CompanderD.ar(in, 0.85, 0.5, 0.45) };

~test[9] = \set -> Pbind(\args, [\freq], \octave, 2, \degree, Pstutter(Pseq([32,4,32,4], inf), Pseq([4,3,4,7], inf)));

~test.scope;

~test.stop(16);