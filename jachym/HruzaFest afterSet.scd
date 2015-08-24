
AutoIDE.print;
AutoIDE.run;
AutoIDE.end;

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(160/60);
QuantEnv.plot_(false).plotTime_(2);

~test.play(vol: 1, fadeTime: 1).quant_(2);
(
~test[0] = {
	var osc = SinOsc.ar( (60 + \freq.kr(0)) , 0, 1 ) + Saw.ar(35,0.2,0.8)  ;
	Pan2.ar( osc * \amp.kr(0) , \pan.kr(0) )
};
)
(
~test[1] = \set-> Pswitch(
	[
		QuantEnv(\amp, 0.5, [0.0,1,0.0], [0.05, 0.45], \exp, 0, 12),
		QuantEnv(\amp, 1, [0.2,1,0,0.8,0.2], [0.85, 0.05], \step, 0, 4),
		QuantEnv(\amp, 4, [0.0,1,0.7,0.2], [3.65, 0.05, 0.15], \welch, 0, 1),
	], Pseq([0,0,1,0,0,2], inf)
);

~test[2] = \set-> Pswitch(
	[
		QuantEnv(\freq, 1, [10,400,30,10], [0.05, 0.03, 0.17], \exp, 0, 12),
		QuantEnv(\freq, 0.1, [1060,180,60], [0.01, 0.05], \step, 0.03, 5),
	], Pseq([0,0,0,1], inf)
);
)
~test[3] = \filter -> {|in| FreeVerb.ar(in, \fverb_mix.kr(0.3), \fverb_room.kr(0.1)) };

~test[4] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(8000)) }

~test[5] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(6, 4), \gverb_time.kr(0.15, 1)) };

~test[6] = \filter -> {|in| Limiter.ar(in, 1) };

~test.set(\lpf_freq, 2000);

~test.stop(10);

~test.scope;


~longSaw.play(vol: 0.5, fadeTime: 8).quant_(8);
(
~longSaw[0] = {
	var osc = LFSaw.ar( \freq.kr(600), 0, Saw.kr(4, 0.1, 0.9) ) * WhiteNoise.ar(0.2,0.8);
	Pan2.ar( osc * \amp.kr(0.2) , \pan.kr(0,0.125) )
};
);

~longSaw[1] = \set -> QuantEnv(\amp, 1, [0.05,1,0.4], [0.85, 0.15], \exp, 0, inf);
~longSaw[2] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,4,3,7], inf), \dur, 24);

~longSaw[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(8000,8)) };
~longSaw.set(\lpf_freq, 1800);
~longSaw[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(200, 4), \gverb_time.kr(1, 1)) };


~longSaw.stop(2);

~longSaw.scope;

s.scope