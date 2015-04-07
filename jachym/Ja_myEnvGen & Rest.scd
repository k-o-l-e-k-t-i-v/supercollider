a = NodeProxy.new(s); // proxyspace & nodeproxy DONT surrive ctrl+. Any solution? CmdPeriod.add(func)? How??? --> option to use Ndef(\a)
s.plotTree;

a.play.fadeTime_(0.25).quant_(1); // xset --> 0.25 sec fadeing interpolation between patterns values
(
a[0] = { |my_gate1, my_gate2, my_legato, my_octave, my_degree, amp|
	var freq = ((my_octave * 12) + my_degree + 1).midicps; // calculation of octaves and degrees
	var osc = SinOsc.ar([freq, freq+2]);

	var env = Env.perc(0.1,0.9,0.6);
	var aEnv = EnvGen.ar(env, my_gate1, timeScale: my_legato, doneAction:2); // use of legato, multiplicatoin of dur; trigger for gate1

	var env2 = Env([0,1,0.2,0.9,0],[0.05,0.2,0.05,0.7]);
	var aEnv2 = EnvGen.ar(env2, my_gate2, timeScale: my_legato, doneAction:2); // use of legato, multiplicatoin of dur; trigger for gate2

	osc * (aEnv+aEnv2) * amp ;
})
(
a[10] = \xset -> Pbind(
	\my_gate1, Pseq([1,0,-1], inf), // 1 = call; 0 = nothing; -1 is Rest (if both gates(1&2) are 0, it doesnt play but leaves synth on server)
	\my_gate2, Pseq([0,1,-1], inf), // 1 = call; 0 = nothing; -1 is Rest (if both gates(1&2) are 0, it doesnt play but leaves synth on server)
	\dur, Pseq([0.5,0.5,2], inf), // 2sec of rest
	\my_legato, Pstutter(Pseq([2,1],inf), Pseq([1.5,1,0.3,1], inf)), // 2x 1.5stretch, 1x rest, 2x 0.3stretch, 1x rest
	\amp, 0.1,
	\my_octave, Pstutter(Pseq([6,6],inf), Pseq([6,4], inf)),
	\my_degree, Pseq([3,4,3,7], inf)
).trace;
)

a.gui;

a.stop(8);
a.free;