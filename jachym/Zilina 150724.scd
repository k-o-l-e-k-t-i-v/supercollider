AutoIDE.run
AutoIDE.print
FreqScope.new(200, 800);
s.scope;

Server.local.options.memSize = 8192*64;

p = ProxySpace.push(s);

~saw.play(vol: 0.7, fadeTime: 8).quant_(8);
(
~saw[0] = {	Pan2.ar( LFSaw.ar( \freq.kr(60), 0, \amp.kr(0) ), \pan.kr(0,0.125) ) * Saw.ar(1/[4,8], 0.8, 0.2)!2 * BrownNoise.ar(0.4, 0.6); };

~saw[1] = \set -> Jenv(\amp, [0.001,1,0.2,1,0.001,0.001], [5.5, 0.25, 1.5, 0.5, 0.25], \welch, inf);
~saw[2] = \set -> Jenv(\freq, [98,108,98], [5.85, 10.15], \exp, inf);

~saw[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~saw[4] = \set -> Jenv(\lpf_freq, [120,1800,120,800,60,120], [0.05, 0.45, 1.5, 0.5, 2], \sin, inf);

~saw[5] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(180, 4), \gverb_time.kr(8, 1)) };
~saw[6] = \filter -> {|in| Limiter.ar(in, 0.95) };
)
// ~saw.set(\gverb_size, 180);
// ~saw.set(\gverb_time, 8);

// ~saw[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };
~saw.stop(16);



~sin.play(vol: 0.6, fadeTime: 8).quant_(8);
(
(
~sin[0] = {
	var aEnv = EnvGen.ar(Env([0,1,0], [0.95,0.05], [\sin, \welch]), \aTrig.tr);
	var fEnv = EnvGen.ar(Env([\freq.kr(60,1),4000,\freq.kr(60,1)], [0.003,0.01], \exp), \aTrig.tr);
	Pan2.ar( SinOsc.ar( fEnv, 0, Saw.kr(1/[2,4,8,16], 0.8, 0.2) ), \pan.kr(0,0.125) );
}
);
~sin[1] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([Pn(0.5, 4), Rest(2), Pn(1,2), Rest(2)], inf));
~sin[2] = \set -> Pbind(\args, [\freq], \octave, 2, \degree, Pseq([3,4,3,7], inf), \dur, 8);

~sin[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(1800,8)) };

~sin[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(80, 4), \gverb_time.kr(0.75, 1)) };
)
// ~sin.set(\gverb_size, 80);
// ~sin.set(\gverb_time, 0.75);
// ~sin.set(\lpf_freq, 1800);

// ~sin[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };

~sin.stop(18);




