AutoIDE.print



AutoIDE.run;
p = ProxySpace.push(s);
~drum.play(vol: 0.4, fadeTime: 8).quant_(2);
(
~drum[0] = {
	var aEnv = EnvGen.ar(Env([0,1,0], [0.05,0.25], [\sin, \welch]), \aTrig.tr);
	var fEnv = EnvGen.ar(Env([\freq.kr(60,1),14000,\freq.kr(60,1)], [0.03,0.14], \exp), \aTrig.tr);
	var num = 8;
	var osc = Mix.fill(num, {|i| LFSaw.ar(fEnv,0.05*i,1/num)});
	Pan2.ar( osc * aEnv , \pan.kr(0,0.125) );

}
)
~drum[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([0.5,0.25,0.25,Pn(1,2), Rest(2)], inf));
~drum[2] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~drum[3] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(130, 4), \gverb_time.kr(1, 1)) };
~drum[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };

~drum.set(\freq, 60);
~drum.set(\lpf_freq, 280);

~drum.scope;

~drum.stop(24);


~noise2.play(vol: 0.2, fadeTime: 8).quant_(2);
~noise2[0] = { Pan2.ar( SinOsc.ar( \freq.kr(60,0.125), 0, LFSaw.kr(4, 0, SinOsc.kr(1/2,0,0.35,0.35), 0.3) ) * BrownNoise.ar(0.8, 0.2), \pan.kr(0,0.125) );}
~noise2[1] = \set -> Pbind(\args, [\freq], \octave, 6, \degree, Pseq([3,4,3,7], inf), \dur, 4);
~noise2[2] = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [3.95,0.05]), \aTrig.tr) };
~noise2[3] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 2);
~noise2[4] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~noise2[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };
~noise2.set(\lpf_freq, 600);
~noise2.stop(10);

~noise.scope;



AutoIDE.end;

