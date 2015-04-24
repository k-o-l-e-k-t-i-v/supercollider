b = NodeProxy(s).play;
(
b[0] = {
	var freq = NamedControl.kr(\freq, 60);
	var amp = NamedControl.kr(\vol, 0.1, 1.5);
	var pan = NamedControl.kr(\pan, 0, 0.0625);
	Pan2.ar(SinOsc.ar(freq, 0, amp) * WhiteNoise.ar(0.2,0.8),pan);
};
b[1] = \set -> Pbind( \args, [\freq],
	\dur, Pseq([2.25,0.25,1.25,0.25], inf),
	\freq, Pseq([60,960,60,2200], inf),
);
b[2] = \set -> Pbind( \args, [\vol],
	\dur, Pseq([2,4], inf),
	\vol, Pseq([0.1,0.9], inf),
);
b[3] = \set -> Pbind( \args, [\pan],
	\dur, 0.125,
	\pan, Pseq([-1,1], inf),
);
b[30] = \filter -> {|in|
	var addFreq = NamedControl.kr(\lpf1, 1200);
	var oscFreq = NamedControl.kr(\lpf2, 800);
	LPF.ar(in, SinOsc.kr(0.5, 0, oscFreq, addFreq))
};
b[31] = \set -> Pbind( \args, [\lpf1, \lpf2],
	\dur, Pseq([4,8], inf),
	\lpf1, Pseq([1100,4300], inf),
	\lpf2, Pseq([800,2200], inf),
);
)
b.stop(8);
c.free;
