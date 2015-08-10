AutoIDE.run

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(160/60);

~test.play(vol: 0.5, fadeTime: 8).quant_(8);

(
~test[0] = {
	var freq = \freq.kr(80) + \freqPlus.kr(0);
	var osc = SelectX.ar(\oscSel.kr(0),
		[
			SinOsc.ar(freq),
			Saw.ar(freq*8,mul:0.2,add:0.8)
		]
	);
	var valNoise = \noise.kr(0.05);
	var sig = osc * BrownNoise.ar(valNoise, (1-valNoise));
	Pan2.ar( sig * \amp.kr(1) , \pan.kr(0,0.125) );
};
)

~test[1] = QuantEnv(\oscSel, 4, [0,1,0,0.8,0], [0.55, 2.95], \exp, 1, inf);
~test[2] = QuantEnv(\noise, 1, [0,0.9,0.4,0], [0.05,0.05, 0.3], [\exp, \exp, \welch], 0.05, inf);
~test[3] = QuantEnv(\amp, 4, [0.2,1,0.3,0.9,0.4], [0.25, 0.45,1.5,0.7], [\exp, \exp, \sin, \welch], 0, inf);

~test[4] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800)) };
~test[5] = QuantEnv(\lpf_freq, 8, [4800,18000,1400], [4.05, 0.95], [\exp, \sin], 0, inf);

~test[6] = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(60, 4), \gverb_time.kr(0.15, 1)) };

~test[7] = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,7,3,6], inf), \dur, 16);
~test[8] = QuantEnv(\freqPlus, 32, [0,50,0], [4.005, 2.05], [\exp, \sin], 0.15, inf);

~test.stop(6);