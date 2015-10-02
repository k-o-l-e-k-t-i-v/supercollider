(
p.isNil.if({
	p = ProxySpace.push(s).makeTempoClock;
	p.clock.tempo_(60/60);
});

s.waitForBoot({
	~tick1.play(vol: 0.2, fadeTime: 1).quant_(1);
	~tick1[0] = {
		var osc = SinOsc.ar(( \freq.kr(600) + \fplus.kr(0) ), mul: 1, add: 0);
		var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
		var sig = osc * noise;
		Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
	};
	~tick1[1] = \set -> QuantEnv(\amp, 1).phase(2, [0,1,0], [0.05, 0.15], [2,-2], 0).play([2]);

	~tick4.play(vol: 0.2, fadeTime: 1).quant_(4);
	~tick4[0] = {
		var osc = SinOsc.ar(( \freq.kr(2000) + \fplus.kr(0) ), mul: 1, add: 0);
		var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
		var sig = osc * noise;
		Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
	};
	~tick4[1] = \set -> QuantEnv(\amp, 4).phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0).play([2]);
});
)


~testWIP.play(vol: 0.2, fadeTime: 1);
(
~testWIP[0] = {
	var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
~testWIP[1] = \set -> QuantEnv(\amp, 4, [0,(1,0.8..0.3),0], [0.05, 0.25], [4,-4], 0, inf).print.plot.play;

p.isNil