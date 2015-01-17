s.scope(2);
(
SynthDef(\LongSinC, { |out, freq = 150, dt = 1, amp = 0.2, pan = 1|
	var tone, env, num;
	num = 15;
	env = EnvGen.ar(Env.linen(0.3*dt,0.4*dt,0.3*dt, amp, \sin));
	tone = Mix.fill(num, { |i|
		SinOsc.ar(freq+Rand(-5.0,5.0),0.05*i,SinOsc.kr([1,2,4,8],0,0.3/num,0.7/num))*SinOsc.kr(i/4,0.03*i,i/num*0.2,0.8)
	});
	tone = tone * env;
	DetectSilence.ar(tone , doneAction:2);
	Out.ar(0, Pan2.ar(tone,SinOsc.kr(pan)));
}).add;
)

(
Pdef(\seqSinC,
	e = Pbind(\instrument, \LongSinC, \amp, 0.45,
		\dur, Pseq([1,2,2,3,Rest(5)],inf),
		\dt, Pseq([2,3,3,9,1],inf),
		\degree, Pseq([6,5,6,4,1], inf),
		\octave, Pseq([Pn(4,5),Pn(5,5)], inf)
	);
	r = Pbind(\instrument, \LongSinC, \amp, 0.3,
		\dur, Pseq([2,2,2,2,Rest(5)],inf),
		\dt, Pseq([3,3,3,8,1],inf),
		\degree, Pseq([6,5,9,7,1], inf),
		\octave, Pseq([Pn(5,2),Pn(6,2)], inf)
	);
	Ppar([e,r]);
).play(quant:5);
)
Pdef(\seqSinC).stop;