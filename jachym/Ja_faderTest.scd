s.plotTree;

FreqScope.new(400, 200, 0, server: s);

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
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(pan)));
}).add;

SynthDef(\fader, { | out = 0, in = 0, mute = 1, amp = 1 |
	Out.ar(out, In.ar(in, 2) * mute * amp);
}).add;
)

(
Pdef(\masterFader,
	Pmono(
		\fader, \out, 0, \in, 30, \dur, 0.1,
		\mute, Pseg(Pseq([0,1], inf),0.25, \step, inf),
		\amp, Pseg(Pseq([0.1,1,0.1], inf),Pseq([3.5,0.5], inf),\sin, inf)
	)
).play;
)

(
Pdef(\seqSinC,
	e = Pbind(\instrument, \LongSinC, \amp, 0.45, \out, 30,
		\dur, Pseq([1,2,2,3,Rest(5)],inf),
		\dt, Pseq([2,3,3,9,1],inf),
		\degree, Pseq([6,5,6,4,1], inf),
		\octave, Pstutter(2, Pseq([4,5], inf))
	);
	r = Pbind(\instrument, \LongSinC, \amp, 0.3, \out, 30,
		\dur, Pseq([2,2,2,2,Rest(5)],inf),
		\dt, Pseq([3,3,3,8,1],inf),
		\degree, Pseq([6,5,9,7,1], inf),
		\octave, Pstutter(2, Pseq([5,6], inf))
	);
	Ppar([e,r]);
).play(quant:5);
)
Pdef(\seqSinC).stop;




