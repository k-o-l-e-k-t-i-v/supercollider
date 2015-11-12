s.reboot;
p = ProxySpace.push(s).makeTempoClock;

~test = NodeProxy.audio(s, 2)
~test.play
~test.fadeTime = 0;
(
~test[0] = {
	var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
~test[1] = \map -> { QuantNode(\amp, 2).env(Env([0.0,1,0.0],[0.25, 1.85], \sin)) }
~test[2] = \map -> { QuantNode(\freq, 8).env(Env([60,78,60],[0.05, 1.95])) }
~test[3] = \map -> { QuantNode(\fplus, 0.5).env(Env([0,170,0],[0.005, 0.09], \exp)) }

~test[10] = \filter ->

~test.scope
QuantMap.print

~test.unmap(\fplus)
~test.stop(8)

