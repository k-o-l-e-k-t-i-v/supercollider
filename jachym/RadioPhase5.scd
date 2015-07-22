AutoIDE.print

AutoIDE.run;
p = ProxySpace.push(s);

~surf.play(vol: 0.05, fadeTime: 8).quant_(16);
(
~surf[0] = {
	var aEnv = Select.ar(\sel.kr(0),
		[
			EnvGen.ar(Env([0,1,0], [7.05,0.95], [\sin, \welch]), \aTrig.tr),
			EnvGen.ar(Env([0,0.8,0.2,1,0], [0.2,2.05,0.2,6.05], [\sin, \lin]), \aTrig.tr);
		]
	);
	var num = 8;
	var osc = Mix.fill(num, {|i| LFSaw.ar(\freq.kr(60,2),0.15*i,1/num) * LFTri.ar(1,0,0.7,0.3) * BrownNoise.ar(0.2, 0.8)});

	Pan2.ar( osc * aEnv, \pan.kr(0,0.125) );}

)

~surf[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 8);
~surf[2] = \set -> Pbind(\args, [\sel], \sel, Pseq([0,1,0,1], inf), \dur, 8);
~surf[3] = \set -> Pbind(\args, [\freq], \octave, Pstutter(4, Pseq([2,3], inf)), \degree, Pseq([3,4,3,7], inf), \dur, Pseq([4,4,2,6], inf));

~surf[10] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~surf[11] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(20, 4), \gverb_time.kr(8, 4)) };
~surf[12] = \filter -> {|in| Limiter.ar(in, 0.95) };
~surf[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };

~surf.set(\lpf_freq, 12000);

~surf.stop(16);
~surf.scope;




AutoIDE.end;