s.boot;
(
p = ProxySpace.push(s).makeTempoClock;
~test = NodeProxy.audio(s, 2);
~test.play(vol:0.2);


~test[0] = {
	var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(1), \pan.kr(0) );
};


~test[1] = \map -> { QuantEnv(\amp, 2, [0,1,0], [0.25, 1.75], [5,-2]) };
~test[2] = \map -> { QuantEnv(\freq, 8, [180,78,60],[0.05, 1.95]).cycle(\default, \phase2) };
)
QTools.addNodes(\pokus, ~test)
QTools.addNodes(\pokus, ~test2)

QTools.print
QTools.gui

QTools.version

QuantMap.nodes(\default)
