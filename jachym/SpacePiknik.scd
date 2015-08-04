AutoIDE.run

Server.local.options.memSize = 8192*64;

p = ProxySpace.push(s);

~drum1.play(vol: 1.2, fadeTime: 8).quant_(2);
(
~drum1[0] = {

	var aEnv = EnvGen.ar(Env([0,1,0], [0.003,0.05], [\sin, \welch]), \aTrig.tr);
	var fEnv = EnvGen.ar(Env([\freq.kr(60),18000,\freq.kr(60)], [0.013,0.009], \exp), \aTrig.tr);

	var osc = LFSaw.ar( fEnv, 0, 1) * Saw.kr([6,8,12,16],0.2,0.8) * BrownNoise.ar(0.05,0.95);
	Pan2.ar( osc * aEnv, \pan.kr(0,0.125) );
}
)
(
~drum1[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1,
	\dur, Pswitch([
		Pseq([Pn(1/6,31), 1/12, 1/12]),
		Pseq([Pn(1/6,7), Rest(1/6)],4)
	], Pseq([0,0,0,1], inf)
	);
)
)

~drum1[2] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(1000,18)) };
~drum1[3] = \set -> Pbind(\args, [\pan], \pan, Pseq([-0.7,0.7], inf), \dur, 0.25);
~drum1[4] = \filter -> {|in| FreeVerb.ar(in, 0.13) };
~drum1[4] = nil;

~drum1[5] = \filter -> {|in| CombC.ar(in, 1/3, 1/6, 5/6) };
~drum1[5] = nil;

~drum1[6] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(4, 4), \gverb_time.kr(0.95, 10)) };
~drum1[6] = nil;

~drum1[7] = \filter -> {|in| CompanderD.ar( in,  0.55, 0.95) };

~drum1.set(\lpf_freq, 5000);
~drum1.set(\freq, 60);
~drum1.set(\freq, 600);
~drum1.set(\pan, 0);
~drum1.scope;


~drum1.stop(6);



