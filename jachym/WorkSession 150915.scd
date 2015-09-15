AutoIDE.run

Kolektiv(\tester)
Kolektiv.print
Kolektiv.free

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(240/60);


().play

~jSaw.play(vol: 0.2, fadeTime: 18);

(
~jSaw[0] = {
	var osc = LFSaw.ar(( \freq.kr(600) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
~jSaw[6] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(1200,8)) };

~jSaw[3] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(60, 4), \gverb_time.kr(14, 1)) };

(
~jSaw[1] = \set -> QuantEnv(\amp, 8)
.phase(1, [0,(1,0.9..0.7),0.2], [0.05, 1.45], [2,-8], 0, 1)
.phase(2, [0,1,0], [5.35, 0.65], [\sin,-8], 0, 1)
.play([1,2]);
)

(
~jSaw[2] = \set -> QuantEnv(\freq, 64)
.phase(1, [400,440,400], [8.05, 2.95], [\sin,\sin], 0, 3)
.phase(2, [500,380,500], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [200,480,200], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)

(
~jSaw[4] = \set -> QuantEnv(\fplus, 2)
.phase(1, [0,807,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\step,\step], 0, 1)
.phase(3, [0,2000,0], [0.105, 0.65], [\step,\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)

(
~jSaw[5] = \set -> QuantEnv(\noise, 24)
.phase(1, [0,0.1,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)
~jSaw.stop(16)


~jDrum.play(vol: 0.8, fadeTime: 8);
(
~jDrum[0] = {
	var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)

(
~jDrum[1] = \set -> QuantEnv(\amp, 4)
.phase(1, [0.6,1,0.6], [0.05, 3.45], [2,-2], 0, 8)
.phase(2, [0,1,0.4], [3.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)

(
~jDrum[2] = \set -> QuantEnv(\fplus, 1)
.phase(1, [0,370,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [0,200,0], [0.035, 0.35], [8,-2], 0, 4)
.play([1,2]);
)
(
~jDrum[3] = \filter -> {|in| GVerb.ar(in,
	\gverb_size.kr(10),
	\gverb_time.kr(1),
	damping: 0.9,
	mul: \gverb_mul.kr,
	add: in * (1-\gverb_mul.kr)
)};
)
(
~jDrum[4] = \set -> QuantEnv(\gverb_mul, 8)
.phase(1, [0.15,1,0.25], [3.05, 0.95], [2,-2], 0, 8)
.phase(2, [0.25,1, 0.6,0.25], [0.35, 2, 0.65], [2,-2], 0, 1)
.play([1,2]);
)

~jDrum[5] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(4800)) };
(
~jDrum[6] = \set -> QuantEnv(\lpf_freq, 16)
.phase(1, [800,4801,1800], [8.05, 7.95], [2,-2], 0, 1)
.phase(2, [1800,4001,800], [12.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)

~jDrum.set(\noise, 0.1);

~jDrum.stop(10);
