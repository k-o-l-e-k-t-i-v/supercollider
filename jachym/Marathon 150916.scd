Kolektiv(\joach)

Kolektiv.print

AutoIDE.run

(octave:[2,3,4,5], strum:2, amp:0.1, sustain:10).play

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(480/60);

~jDrum.play(vol: 0.9, fadeTime: 0);

(
~jDrum[0] = {
var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)

(
~jDrum[1] = \set -> QuantEnv(\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)

(
~jDrum[2] = \set -> QuantEnv(\fplus, 1)
.phase(1, [0,12070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)

(
~jDrum[3] = \set -> QuantEnv(\noise, 16)
.phase(1, [0,0.4,0], [14.05, 1.95], [2,-2], 0, 4)
.phase(2, [1,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.phase(3, [0,0.8,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)

~jDrum[4] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(12), \gverb_time.kr(2),0.9,mul:\gMul.kr(1)) };
(
~jDrum[5] = \set -> QuantEnv(\gMul, 8)
.phase(1, [0.0,1,0.0], [0.05, 7.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [4.05, 3.35], [2,-2], 0.1, 1)
.play([1,2]);
)

(
~jDrum[6] = \set -> QuantEnv(\freq, 36)
.phase(1, [60,86,60], [12], [\step], 0, 1)
.phase(2, [60,190,60], [8], [\sin], 0, 1)
.play([1,2]);
)

~jDrum.stop(16);

~jNoise.play(vol: 0.0, fadeTime: 18);
(
~jNoise[0] = {
var osc = SinOsc.ar(( \freq.kr(600) + \fplus.kr(0) ), mul: 1, add: 0);
var noise = WhiteNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
(
~jNoise[1] = \set -> QuantEnv(\amp, 4)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0.25, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0.75, 2)
.play([1,2]);
)

(
~jNoise[2] = \set -> QuantEnv(\noise, 1)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.25, 8)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0.25, 1)
.play([1,2]);
)

~jNoise[3] = \filter -> {|in| FreeVerb.ar(in, \fverb_mix.kr(0.2), \fverb_room.kr(0.5)) };

(
~jNoise[4] = \set -> QuantEnv(\freq, 32)
.phase(1, [60,100,60], [4,8], [\sin,\step], 0, 4)
.phase(2, [100,160,60], [1.35, 1.65], [2,-2], 0, 1)
.play([1, 2]);
)

~jNoise[5] = \filter -> {|in| HPF.ar(in, \lpf_freq.kr(2800,8)) };
~jNoise[6] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(12), \gverb_time.kr(18),0.9,mul:\gMul.kr(1)) };

~jNoise.stop(1);
