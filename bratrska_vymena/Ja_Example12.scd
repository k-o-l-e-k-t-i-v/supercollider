s.scope(2);
(
SynthDef(\Saw1, { |chnl = 0, freq = 60, vol = 0.3, dt = 5, fade = 0.5|
	var tone, env, osc1, osc2;
	env = EnvGen.ar(Env([0, vol, 0.4*vol, 0.8*vol, 0],[0.15*dt, 0.2*dt, 0.05*dt, 0.6*dt]), doneAction:2);
	osc1 = SinOsc.kr(20,0,fade/2,fade);
	osc2 = SinOsc.kr(2,0,(1-fade)/2,1-fade);
	tone = LFSaw.ar(freq, 0, env * osc1) + SinOsc.ar(freq, 0, env * osc2);

	Out.ar(chnl, tone ! 2)
}).add;

SynthDef(\Drum1, { |chnl = 0, freq = 110, vol = 0.3, dt = 0.5|
	var tone, env, osc;
	env = EnvGen.ar(Env([0,vol,0],[0.05*dt, 0.95*dt]), doneAction:2);
	tone = SinOsc.ar(freq, 0, env);

	Out.ar(chnl, tone ! 2)
}).add;

SynthDef(\echo, { |chnl=0, maxdeltime=0.2, deltime=0.2, dectime=2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;

)

Synth(\Saw1);

(
Pdef(\drumLoop, {
	o = Pbind(
		\instrument, \Drum1,
		\chnl, Pseq([Pn(0,3),30,Pn(0,4)],inf),
		\freq, Pseq([100,200,95,105],inf),
		\dt, Pseq([Pn(0.01,3),0.15],inf),
		\dur, Pseq([Pn(0.1,3),0.2],inf),
		\vol,Pseq([Pseq([Pseries(0.2,0.005,60),Pseries(0.5,-0.005,60)]),0.25],inf)
	);
	l = Pfx(o, \echo, \chnl, 30, \maxdeltime, 0.3, \deltime, 0.02, \dectime, 0.5);
}).play(quant:1)
)
Pdef(\drumLoop).stop(5);

(
Pdef(\sawLoop2, {
	p = Pbind(
		\instrument, \Saw1,
		\chnl, 40,
		\midinote, Pswitch
		(
			[
				Pn(Pseq([52, 40, 48, 36]),3),
				Pn(Pseq([52, 36, 40, 48]),3),
				Pn(Pseq([52, 40, 36, 40]),3),
				Pn(Pseq([40, 40, 40, 36]),1)
			],
			Pseq([Pseq([0,1,0,2],2),3],inf)
		),
		\dur, Pseq([2,10], inf),
		\vol, 0.1, \dt, 15, \fade, 0.05
	);

	q = Pfx(p, \echo, \chnl, 40, \maxdeltime, 2.5, \deltime, 0.75, \dectime, 5);
}).play(quant:2);
)

Pdef(\sawLoop2).stop(5);

(
Pdef(\sawLoop).fadeTime(2);
Pdef(\sawLoop, {
	m = Pbind(
		\instrument, \Saw1,
		\chnl, 25,
		\midinote, Pseq([66, 71, 73, 74, 66, 64, 73, 71, 66, 74, 73], inf),
		\dur, Pseq([5,5,5,5,10, 5,5,5, 20], inf),
		\vol, 0.1,
		\dt, 1.0,
		\fade,Pseq([Pseries(0.0,0.01,10),Pseries(0.1,-0.01,10)],inf)
	);

	n = Pfx(m, \echo, \chnl, 25, \maxdeltime, 1, \deltime, 0.5, \dectime, 5);
}).play(quant:5);
)

Pdef(\sawLoop).stop(5);

