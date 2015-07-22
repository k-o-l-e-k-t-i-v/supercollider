AutoIDE.print

AutoIDE.run
p = ProxySpace.push(s);
~saw.play(vol: 0.6, fadeTime: 8).quant_(2);

~saw[0] = { Pan2.ar( SinOsc.ar( \freq.kr(440/[4,8],0.125),mul: SinOsc.kr(1/[1,4,16],0,0.8,0.2) * BrownNoise.ar(0.8,0.2) ), \pan.kr(0,0.125) );}
~saw[1] = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [0.45,0.05]), \aTrig.tr) };
~saw[2] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([0.25,0.5,0.25,3.0,Rest(2.0)], inf));
~saw[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~saw[4] = \filter -> {|in| HPF.ar(in, (\lpf_freq.kr(800,8)+4000)) };

~saw[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(180, 4), \gverb_time.kr(1, 1)) };
~saw.set(\lpf_freq, 600);

~saw[5] = \filter -> {|in| Limiter.ar(in, 0.95) };

~saw.stop(6);
~saw.scope;

~saw.set(\aTrig, 1)

~saw[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };


