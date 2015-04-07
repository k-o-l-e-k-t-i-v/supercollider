s.plotTree;
s.queryAllNodes.postln;

(
a = NodeProxy.new(s);
b = NodeProxy.new(s);
a <>> b;
)

a.play.fadeTime_(1.25).quant_(4);
(
a[0] = { |t_gate = 1, sustain, freq = 120, amp = 0.1|
	var osc = BrownNoise.ar(0.1,0.9) * LFPulse.ar(freq!2, [0,0.5*pi], [0.7,0.1], 0.2, 0.8);
	var aEnv = EnvGen.ar(Env.perc(0.7 * sustain, 0.3*sustain, 1), t_gate);
	osc * aEnv * amp ; }
)
a[10] = \xset -> Pbind( \dur, Pseq([Pn(4,4),8], inf), \legato, 1.7, \amp, 0.4, \octave, 2, \degree, Pseq([3,4,3,7], inf));
a.nodeMap;

b.play.fadeTime_(0.25).quant(2);
(
b[0] = { |freq = 120, amp = 0.1|
	var osc = LFTri.ar(freq!2,0,0.8,0.2) * SinOsc.ar([9000,9200], 0.1, 0.2, 0.8);
	osc * \in.ar(0!2) * amp }
)
(
b[10] = \xset -> Pbind( \dur, Pseq([3.5,Pn(0.25,2)], inf), \amp, 0.9, \octave, 4,
	\degree, Pswitch([
		Pseq([3,2,3,1]),
		Pseq([3,2,4,2]),
		Pseq([3,2,3,7]),
	], Pseq([0,1,0,0,2],inf)))
)
b.nodeMap;

b.stop(8);
a.stop(10);

a.free;
b.free;
