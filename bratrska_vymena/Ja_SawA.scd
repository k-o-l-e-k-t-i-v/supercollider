(
SynthDef(\SinA, {|out = 0,gate = 1, freq = 90, amp = 0.3, sustain = 0.5|
	Out.ar(out, SinOsc.ar([freq,freq],0,EnvGen.kr(Env.asr(0.75*sustain,amp, 0.25*sustain),gate, doneAction:2)));
}).add;

SynthDef(\SawA, {|out = 0,gate = 1, freq = 90, amp = 0.3, sustain = 0.5|
	Out.ar(out, LFSaw.ar([freq,freq],0,EnvGen.kr(Env.asr(0.75*sustain,amp, 0.25*sustain),gate, doneAction:2)));
}).add;

SynthDef(\lpf, {|out in freq|
	var tone = In.ar(in, 2);
	ReplaceOut.ar(out,LPF.ar(tone,freq,1, tone));
}).add;

SynthDef(\master, {|in amp|	Out.ar(0,In.ar(in, 2)*amp);}).add;

SynthDef(\pan, {|in out pos mul| ReplaceOut.ar(out, Pan2.ar(In.ar(in,2),pos,mul)); }).add;
)

(
Pdef(\seqMaster, Pmono(\master, \in, [30,35,40], \dur, Pseq([0.1], inf),
	\amp, Pseg(Pseq([0.2,0.5,0.2],inf),Pseq([5,1],inf),\sin)
)).play(quant:1);
)
Pdef(\seqMAster).stop;

(
Pdef(\seqLpf, Pmono(\lpf, \out, [30,40], \in, [30,40], \dur, Pseq([0.1], inf),
	\freq, Pseg(Pseq([2200,400,2200],inf),Pseq([5,1],inf),\sin)
)).play(quant:1);
)
Pdef(\seqLpf).stop;

(
Pdef(\seqPan, Pmono(\pan, \out, 40, \in, 40, \mul, 3, \dur, Pseq([0.05], inf),
	\pos,  Pseg(Pseq([-0.8,0.8,-0.8],inf),Pseq([0.25,0.25],inf),\sin)
)).play(quant:1);
)
Pdef(\seqLpf).stop;

(
Pdef(\seqDrum,
	Pbind(\instrument, \SawA, \out, 30, \legato, 0.8, \freq, 110, \amp, 0.1,
		\dur, Pswitch([
			Pstutter(Pseq([5,1,1]),Pseq([0.1,0.25,Rest(0.25)])),
			Pstutter(Pseq([3,2,1]),Pseq([1,0.50,Rest(1.5)]))
		],Pseq([Pn(0,16),1], inf))
)).play(quant: 1);
)
Pdef(\seqDrum).stop;
(
Pdef(\seqDrum2,
	Pbind(\instrument, \SawA, \out, 35, \amp, 0.3,
		\legato, Pseq([0.25,0.3],inf),
		\dur, Pseq([Pn(0.1,8),0.2, Rest(2)],inf),
		\octave, Pseq([Pn(7,40),Pn(6,40),Pn(7,15),Pn(6,5), Pn(7,20)],inf),
		\degree, Pseq([Pn(7,10),Pn(6,10),Pn(7,10),Pn(5,10)],inf)
)).play(quant: 1);
)
Pdef(\seqDrum2).stop;
(
Pdef(\seqDrum3,
	Pbind(\instrument, \SinA, \out, 40, \freq, 80, \amp, 0.2, \legato, 1.3,
		\dur, Pseq([8, Rest(2)],inf)
)).play(quant: 1);
)
Pdef(\seqDrum3).stop;