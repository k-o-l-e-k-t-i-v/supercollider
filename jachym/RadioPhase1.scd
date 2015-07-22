AutoIDE.print;

AutoIDE.run;
p = ProxySpace.push(s);

~saw.play(vol: 0.5, fadeTime: 8).quant_(16);
~saw[0] = { Pan2.ar( LFSaw.ar( \freq.kr(60,1), 0, Saw.kr([2,4], 0.8,0.2)  ) * BrownNoise.ar(0.15, 0.85), \pan.kr(0,0.125) );}
~saw[1] = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [6.25,0.25]), \aTrig.tr) };
~saw[2] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, Pseq([Pn(1,4),12, Pn(1,4), 2, Rest(10)], inf));
~saw[3] = \set -> Pbind(\args, [\freq], \octave, 2, \degree, Pseq([3,6,3,7], inf), \dur, 16);
~saw[4] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~saw[5] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(130, 14), \gverb_time.kr(12, 2)) };
~saw[99] = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };
~saw.set(\lpf_freq, 80);

~saw.stop(32);
~saw.free;

~noise.play(vol: 0.0, fadeTime: 8).quant_(2);





AutoIDE.end;