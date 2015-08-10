AutoIDE.run

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(60/60);

~sin.play(vol: 0.47, fadeTime: 8).quant_(8);

(
~sin[0] = {
	var num = 8;
	var osc = Mix.fill(num, {|i| SinOsc.ar(\freq.kr(160,2) + \freqPlus.kr(0),\fillMult.kr(0.05)*i,1/num)});
	var noise = \noise.kr(0);
	var sig = osc * WhiteNoise.ar(noise, (1-noise));
	Pan2.ar( sig, \pan.kr(0,0.125) );}
)
~sin[1] = QuantEnv(\fillMult, 1, [0,0.78,0], [0.05, 0.95], [\exp, \welch], 0, inf);
~sin[2] = QuantEnv(\freqPlus, 2, [0,20,0,45,0], [0.15, 0.25,0.73], \exp, 0.5, inf);

~sin[3] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(2000,8)) };

~sin[4] = QuantEnv(\noise, 1, [0,0.9,0], [0.01, 0.24], [\exp, \sin], 0.25, inf);

~sin[5] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(6, 4), \gverb_time.kr(0.15, 1)) };

~sin[6] = \filter -> {|in| FreeVerb.ar(in, \fverb_mix.kr(0), \fverb_room.kr(0.5)) };

~sin[7] = QuantEnv(\lpf_freq, 16, [800,8000,2000], [12.05, 3.95], [\exp, \sin], 0, inf);

~sin[8] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,5,3,4], inf), \dur, 32);

~sin[9] = QuantEnv(\fverb_mix, 0.5, [0,0.7,0], [0.05, 0.45], \exp, 0, inf);

~sin[10] = \filter -> {|in| Limiter.ar(in, 0.95) };

~sin.stop(16);

~sin.scope;