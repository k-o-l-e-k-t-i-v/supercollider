AutoIDE.run

Kolektiv(\joach)
Kolektiv.free

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(180/60);

~jDrum.play(vol: 1, fadeTime: 8);
(
~jDrum[0] = {
	var num = 12;
	var osc = Mix.fill(num, {|i| LFSaw.ar(( \freq.kr(60) + \fplus.kr(0) ), 0.005*i, 1/num)});
	// var osc = LFSaw.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
(
~jDrum[1] = \set-> Pswitch(
	[
		QuantEnv(\amp, 1, [0.2,1,0.1], [0.05, 0.45], \exp, 0, 16),
		QuantEnv(\amp, 0.5, [0.9,0,0.9], [0.25, 0.25], \exp, 0, 4),
		QuantEnv(\amp, 0.25, [0,1,0.8], [0.05, 0.15], \exp, 0, 4),
	], Pseq([0,1,0,2], inf)
))
~jDrum[2] = \set -> QuantEnv(\fplus, 1, [0,80,0], [0.005, 0.018], \lin, 0, inf);

~jDrum[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,32)) };
~jDrum.set(\lpf_freq, 2200);

~jDrum[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(20, 4), \gverb_time.kr(0.85, 1)) };
~jDrum[5] = \set -> QuantEnv(\noise, 8, [0.0,0.2,0.1], [3.05, 7.95], \sin, 0, inf);

~jDrum.stop(6);


~longSin.play(vol: 0.1, fadeTime: 8);
(
~longSin[0] = {
	var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
	var osc2 = Saw.ar(2, 0.2, 0.4);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = (osc * osc2) * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
(
~longSin[1] = \set-> Pswitch(
	[
		QuantEnv(\amp, 16, [0.1,1,0.3], [13.05, 4.45], \sin, 0, 1),
		QuantEnv(\amp, 4, [0.2,1,0.2], [1, 2], \step, 0, 4),
	], Pseq([0,1], inf)
))
~longSin[2] = \set -> Pbind(\args, [\freq], \octave, 4, \degree, Pseq([3,3b,3,7], inf), \dur, 16);

~longSin[3] = \filter -> {|in| CombC.ar(in, 0.0625, 0.0625, 8) };

~longSin[4] = \set -> QuantEnv(\noise, 2, [0.1,0.7,0.1], [2.05, 4.45], \exp, 0, inf);

~longSin[5] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };
~longSin.set(\lpf_freq, 4800);

~longSin[6] = \set -> QuantEnv(\fplus, 4, [0,10,0], [0.05, 3.95], \exp, 0, inf);

~longSin.scope;

~longSin.stop(6);