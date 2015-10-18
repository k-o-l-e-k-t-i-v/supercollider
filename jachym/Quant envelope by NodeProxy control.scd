
s.boot;
p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(240/60);

~osc.play;
~osc[0] = { SinOsc.ar([80, 81.3], 0, \amp.kr(0.2)) };
~osc.map(\amp, ~env);
~osc.clear;

~env = NodeProxy.control(s, 1).play(quant: 4);
~env.fadeTime = 20;
~env[0] = { EnvGen.ar(Env.new([0,0.85,0.0],[0.05,4.95], [2,-8]), \trig.tr(0), timeScale: 1/p.clock.tempo, doneAction:0) }
~env[1] = \set -> Pbind(\args, [\trig], \trig, 1, \dur, Pseq([Pn(4,4),1,3], inf));



// check for quant sync //////////////////////////////////////////////

~sin.play(vol: 0.8, fadeTime: 1);
(
~sin[0] = {
	var osc = SinOsc.ar(( \freq.kr(600) + \fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0))) * Saw.ar(20, 0.4, 0.6);
	var sig = osc * noise;
	Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
};
)
(
~sin[1] = \set -> QuantEnv(\amp, 4)
.phase(1, [0.0,1,0.0], [0.15, 0.95], [2,-2], 0, 1)
.play([1]);
)
