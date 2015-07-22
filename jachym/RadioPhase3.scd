AutoIDE.print;

AutoIDE.run;
p = ProxySpace.push(s);

~saw2.play(vol: 0.15, fadeTime: 8).quant_(2);
~saw2[0] = { Pan2.ar( LFSaw.ar( \freq.kr(12000,0.125), 0, 1 ), \pan.kr(0,0.125) );}
~saw2[1] = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [7.25,0.05]), \aTrig.tr) };
~saw2[2] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([0.25,0.25, 0.5, 15], inf));
~saw2[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~saw2[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(18, 4), \gverb_time.kr(8, 4)) };
~saw2[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };
~saw2.set(\lpf_freq, 600);

~saw2.stop(16);
~saw2.free;

~sin2.play(vol: 0.8, fadeTime: 8).quant_(2);
~sin2[0] = { Pan2.ar( SinOsc.ar( \freq.kr(60,0.125), 0, Saw.kr(4, 0.8, 0.2) ) * BrownNoise.ar(0.45, 0.65), \pan.kr(0,0.125) );}
~sin2[1] = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [0.05,2.95]), \aTrig.tr) };
~sin2[2] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 4);
~sin2[3] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,3,4,8], inf), \dur, 4);
~sin2[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(260, 4), \gverb_time.kr(1, 1)) };
~sin2[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };
~sin2.set(\gverb_size, 60);
~sin2.set(\gverb_time, 4);

~sin2.stop(26);
~sin2.free;





AutoIDE.end;