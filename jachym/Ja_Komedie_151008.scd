AutoIDE.run
Kolektiv(\joach)

Kolektiv.players
Kolektiv.historyRestart
Kolektiv.historySave
Kolektiv.free
Kolektiv.tempo = 120;

~jSaw.play(vol: 0.8, fadeTime: 12);
(
~jSaw[0] = {
	var osc = SinOsc.ar(( \freq.kr(90) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
(
~jSaw[1] = \set -> QuantEnv(\amp, 8)
.phase(1, [0.2,1,0.5], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)
~jSaw[2] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,28)) };
~jSaw.set(\lpf_freq, 1400);

~jSaw[3] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(60), \gverb_time.kr(14), 0.9, mul:\mulgverb.kr(1)) };
(
~jSaw[4] = \set -> QuantEnv(\mulgverb, 2)
.phase(1, [0,1,0], [3.05, 8.95], [6,-2], 0, 1)
.phase(2, [0,1,0.2,0.4,0], [0.35, 5.65], [\sin,-2], 6, 1)
.play([1,2]);
)

(
~jSaw[5] = \set -> QuantEnv(\noise, 8)
.phase(1, [0.2,1,0.2], [1.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)

(
~jSaw[6] = \set -> QuantEnv(\flpus, 4)
.phase(1, [0,1000,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)

~jSaw[7] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,4,3,7], inf), \dur, 16);

~jSaw.stop(20);


~jdrum.play(vol: 0.0, fadeTime: 18);

(
~jdrum[0] = {
var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)

(
~jdrum[1] = \set -> QuantEnv(\amp, 0.)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\sin,\sin], 0, 2)
.play([1,2,1,3, 4]);
)

(
~jdrum[2] = \set -> QuantEnv(\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)

~jdrum[3] = \set -> Pbind(\args, [\freq], \octave, 4, \degree, Pseq([3,4,3,7], inf), \dur, 32);

~jdrum[4] = nil
~jdrum[4] = \filter -> {|in| CombC.ar(in, 0.25, 0.125, 0.5) };

(
~jdrum[5] = \set -> QuantEnv(\noise, 8)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [1.35, 2.65], [2,-2], 0, 1)
.play([1]);
)

~jdrum[6] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,28)) };
~jdrum.set(\lpf_freq, 200);
~jdrum.scope;

~jdrum.stop(16);



















