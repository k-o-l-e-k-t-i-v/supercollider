(
SynthDef(\SawA, { |out, freq = 150, dt = 1, amp = 0.2, shift = 0|
	var env, tone, num;
	num = 10;
	env = EnvGen.ar(Env([0,amp,0],[0.9*dt, 0.1*dt]),doneAction:2);
	tone = Mix.fill(num, { |i| LFSaw.ar([freq,freq+2],shift*i,env/num)});
	tone = LPF.ar(tone, Rand(600, 1000));
	Out.ar(out,tone);
}).add;

SynthDef(\echo, { |chnl = 0, maxdeltime = 0.2, deltime = 0.2, dectime = 2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;
)

(
var seq, eff;
Pdef(\seqSawA ,
	Pbind(\instrument, \SawA, \out, 0, \dur, 0.25, \dt, 0.125,
		\freq, Pseq([180, 100, Prand([310,380,410,330,220,460]), 100],inf),
		\amp, Pseg(Pseq([0.1,0.2,0.1]),Pseq([5,5]),\lin, inf),
		\shift, Pseq([Pseries(0,0.001,20)],inf)
	)
	// eff = Pfx(seq, \echo, \chnl, 35, \maxdeltime, 2, \deltime, 0.25, \dectime, 8);
).play(quant:1);
)

Pbindef(\seqSawA, \amp, Pseg(Pseq([0.15,0.2,0,0.1,0]),Pseq([0.5,2,0.25,10]),\lin)); ///STOP
// (Pdef(\seqSawA).stop;)


