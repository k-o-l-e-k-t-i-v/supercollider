AutoIDE.print

AutoIDE.run;
p = ProxySpace.push(s);
~sig.play(vol: 0.5, fadeTime: 8).quant_(2);
(
~sig[0] = {
	var fEnv = EnvGen.ar(Env([\freq.kr(60,1),14000,\freq.kr(60,1)], [0.03,0.04], \exp), \aTrig.tr);
	Pan2.ar( LFSaw.ar( fEnv, 0, 1 ), \pan.kr(0,0.125) );
}
)
~sig[1] = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [0.05,0.15]), \aTrig.tr) };
~sig[2] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([Pn(0.25,2), 1.5, Rest(2)], inf));
~sig[3] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,4,3,7], inf), \dur, 16);

~sig[4] = \filter -> {|in| CombC.ar(in, 0.25,0.125, 4) };
~sig[5] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(60, 4), \gverb_time.kr(1, 1)) };

~sig[6] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };

~sig[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };

~sig.set(\lpf_freq, 40);

~sig.stop(2);
~sig.scope;


~drum.play(vol: 0.7, fadeTime: 8).quant_(2);
(
~drum[0] = {
	var aEnv = Select.ar(\aEnvSel.kr(0),
		[
			EnvGen.ar(Env([0,1,0], [0.05,0.25], [\sin, \welch]), \aTrig.tr),
			EnvGen.ar(Env([0.8,0.2,0.8], [0.25,0.05], [\sin, \lin]), \aTrig.tr);
		]
	);
	var fEnv = EnvGen.ar(Env([\freq.kr(60,1),18000,\freq.kr(60,1)], [0.13,0.04], \exp), \aTrig.tr);
	var num = 4;
	var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.05*i,1/num)});
	Pan2.ar( osc * aEnv , \pan.kr(0,0.125) );

}
)
~drum[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 1); //Pseq([0.5,0.25,1,0.25, Rest(2)], inf));
~drum[2] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~drum[3] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(80, 4), \gverb_time.kr(0.5, 1)) };
~drum[4] = \set -> Pbind(\args, [\aEnvSel], \aEnvSel, Pseq([1,1,1,0,0], inf), \dur, 4);
~drum[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };

~drum.set(\freq, [60,62,68,12000]);
~drum.unset(\freq)

~drum.set(\lpf_freq, 200);

~drum.scope;

~drum.stop(14);