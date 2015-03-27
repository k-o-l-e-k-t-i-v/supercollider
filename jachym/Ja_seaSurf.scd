a = NodeProxy(s);
a.play;
a.fadeTime = 2.1;
a[0] = {|freq, amp| SinOsc.ar(freq!2,0,amp) * BrownNoise.ar(0.2, VarSaw.kr([9,10],0,0.1,0.8)) };
(
a[1] = \xset ->  Pbind( \amp, 0.8,
	\dur, Pseq([0.25,0.125, 0.25, 2],inf),
	\octave, Pseq([2,3,10], inf),
	\degree, Pstutter(Pseq([28,8,16,4], inf), Pseq([2,3,2,4], inf))
).trace;
)
a[10] = \filter -> {|in| LPF.ar(in, SinOsc.kr(1/16, 0, 2600, 4400))};
a.stop(10);
