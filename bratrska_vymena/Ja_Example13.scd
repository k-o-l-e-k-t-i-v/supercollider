s.scope(2);
//PdefGui(s,6);
PdefAllGui(18);

(
SynthDef(\Drum1, {|freq = 90, vol = 0.3, dt = 0.5, at = 0.1, chnl = 0|
	var tone, env;
	env = EnvGen.ar(Env.perc(at,dt,vol,-4),doneAction:2);
	tone = SinOsc.ar(freq,0,env);

	Out.ar(chnl, tone!2);
}).add;

SynthDef(\Drum2, {|freq = 120, divFreq = 16, vol = 0.3, dt = 0.1, at = 0.01, chnl = 0|
	var tone, env, osc;
	env = EnvGen.ar(Env.perc(at,dt,vol,-2),doneAction:2);
	osc = LFSaw.kr(freq/divFreq,0.5*pi,0.1,0.8);
	tone = SinOsc.ar(freq,0,env*osc);

	Out.ar(chnl, tone);
}).add;

SynthDef(\Saw1, {|freq = 300, dt = 5, vol = 0.2, chnl = 0, shift = 0|
	var tone,env;
	env = XLine.kr(0.05,vol,dt,doneAction:2);
	tone = LFSaw.ar(freq, 0, env)*Saw.kr(40,env)*SinOsc.kr(10.6,shift*pi,0.2,0.75);
	Out.ar(chnl,tone!2);
}).add;

SynthDef(\Surf1, { |freq = 665, dt = 0.2, vol = 0.2, ffreq = 1100, chnl = 0|
	var tone, env, noise;
	env = EnvGen.ar(Env([0,vol,0], [0.9 *dt, 0.1*dt]), doneAction: 2);
	noise = ((LFSaw.kr(freq/4)) * SinOsc.kr(freq/4, 0, 0.35, 0.6)).range(0.6,1.1);
	tone = SinOsc.ar([freq, freq + 2],[0, 0.1pi, 0.2pi],env*noise);
	tone = HPF.ar(tone, ffreq);

	Out.ar(chnl, tone ! 2);
}).add;

SynthDef(\echo, { |chnl=0, maxdeltime=0.2, deltime=0.2, dectime=2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;
)


(
Pdef(\seqSaw1, {
	p = Pbind(
		\instrument, \Saw1, \freq, [1200,240],\dt,2, \chnl,40,
		\dur, Pseq([2,2,1,6,8],inf),
		\vol, Pseq([Pseries(0,0.02,10),Pseries(0.1,-0.01,10)],inf),
		\shift, Pseq([Pseries(0,0.1,20)],inf)
	);
	q = Pfx(p, \echo, \chnl, 40, \maxdeltime, 1, \deltime, 0.2, \dectime, 5);
}).play(quant:2);
)
Pdef(\seqSaw1).stop;

(
Pdef(\seqDrum1, {
	Pbind(
		\instrument, \Drum1, \freq, 50, \vol, 0.35,
		\dt, Pseq([0.51,0.48,0.45,0.42,0.39],inf),
		\at, Pseq([0.05,0.15,0.1,0.25],inf),
		\dur, Pseq([Pn(0.5,30),Pn(0.25,4)],inf),
	)
}).play(quant:2);
)
Pdef(\seqDrum1).stop;

(
Pdef(\seqDrum2, {
	Pbind(
		\instrument, \Drum2, \vol, 0.1, \divFreq, 40,
		\dt, Pseq([0.03,0.08],inf),
		\at, Pseq([0.25,0.01,0.03,0.2],inf),
		\dur, Pswitch([
			Pseq([Pn(0.125,2),Pn(0.25,2),Pn(0.125,2),Pn(0.25,2)]),
			Pseq([Pn(0.25,30)]),
			Pseq([Pn(0.25,8),Pn(0.5,2),1,Pn(0.25,2),Pn(0.5,2),1]),
			Pseq([2])
			],
			Pseq([Pn(Pseq([0,1,0,0,1],3)),2,0,0,1,3],inf)),
		\freq, Pseq([Pseries([140,180],1,30),Pseries([140,260],-1,16)],inf),
		\chnl, Pseq([0,1],inf)
	)
}).play(quant:2);
)
Pdef(\seqDrum2).stop;

(
Pdef(\seqSurf1, {
	o =	Pbind(
		\instrument, \Surf1,
		\midinote, Pswitch
		(
			[
				Pn(Pseq([72, 60, 78, 66]),2),
				Pn(Pseq([60, 66, 60, 69]),2),
				Pn(Pseq([72, 78, 66, 69]),2),
				Pn(Pseq([60, 60, 60, 56]),1)
			],
			Pseq([Pseq([0,1,0,2],2),3],inf)
		),
		\dur, Pseq([2, 2, 2, 4],inf),
		\vol, Pseq([0.1,0.15],inf),
		\dt, Pseq([0.55, 0.15, 0.35, 0.55, 0.2, 0.45],inf),
		\detune, 1.01,
		\ffreq, Pseq([1100,900,700,500,800,1000],inf),
		\chnl, 30
	);
	l = Pfx(o, \echo, \chnl, 30, \maxdeltime, 10, \deltime, 0.5, \dectime, 20);
}).play(quant:5);
)

Pdef(\seqSurf1).stop;
