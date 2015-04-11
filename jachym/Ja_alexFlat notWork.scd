
p = ProxySpace.push(s);

(
~a.play(30).fadeTime_(4).mold(1);
~a[0] = { BrownNoise.ar(0.7); };
// ~a[0] = nil;
~a[1] = { | freq | SinOsc.ar(Saw.kr(0.5,5,freq), 0, 0.7)};
~a[10]  = \xset -> Pbind(
	\dur, Pseq([Pn(1,2),4], inf),
	\octave, Pseq([Pn(7,3),5], inf),
	\degree, Pseq([3b,3], inf),
))
~a.stop(4);

(
~b.play(32).fadeTime_(0.0625).quant_(4).mold(1);

~b[0] = {|in, aGate, bGate, legato, amp, sustain|
	var aEnv = EnvGen.ar(Env([0,1,0.4,0], [0.22, 0.08, 0.7]), aGate, timeScale:legato, doneAction:2);
	var aEnv2 = EnvGen.ar(Env([0,0.2,1,0], [0.7, 0.28, 0.02]), bGate, timeScale:legato, doneAction:2);
	((~a.ar * aEnv) + (~a.ar * aEnv2)) * amp;
};
~b[10] = \xset -> Pbind(
	\amp, 0.7,
	\dur, Pseq([Pn(0.25,8),4], inf),
	\aGate, Pseq([Pn(1,8),-1], inf),
	\bGate, Pseq([Pn(-1,8),1], inf),
	\legato, Pseq([Pn(0.6,8),1.2], inf),
// );
).trace
)
~b.stop(4);
(
~c[0] = { |in| AllpassC.ar(~b.ar, 0.25, 0.0625,1) };
~c.play(0);
)
