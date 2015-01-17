(
SynthDef(\Saw1, { |chnl = 0, freq = 150, dt = 1, vol = 0.2, shift = 0|
	Out.ar(chnl,LFSaw.ar(freq,shift,Line.kr(0,1,dt,vol,doneAction:2))!2);
}).add;

SynthDef(\echo, { |chnl=0, maxdeltime=0.2, deltime=0.2, dectime=2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;
)

(
Pdef(\seqSaw1 ,{
	Pbind(\instrument, \Saw1, \vol , 0.05, \dur, Pseq([0.9,1.1],inf)
	)
}).play(quant:1);
)
Pdef(\seqSaw1).stop;
(
Pdef(\seqSaw2 ,{
	Pbind(\instrument, \Saw1, \freq, 500, \dur, 0.5, \dt, 0.5, \vol , 0.02, \shift, Pseq([Pseries(0,0.1,20)],inf));
}).play(quant:1);
)
Pdef(\seqSaw2).stop;

(
Pdef(\seqSaw3 ,{
	Pbind(
		\instrument, \Saw1,\freq, 80, \vol , 0.03,
		\dur, Pseq([0.25,0.5, Pn(0.125,6)],inf),
		\dt, Pseq([0.05,0.4,Pn(0.125,6)],inf)
	)
}).play(quant:1);
)
Pdef(\seqSaw3).stop;
(

Pdef(\seqSaw4 ,{
	Pbind(
		\instrument, \Saw1, \freq, [100,180], \dur, 0.25, \dt, 0.125, \vol ,
		Pseq([Pseries(0.002,0.005,20),Pseries(0.1,-0.005,20)],inf), \shift, Pseq([Pseries(0,0.1,20)],inf));
}).play(quant:1);
)
Pdef(\seqSaw4).stop;

(
Pdef(\seqDrum3, {
	o = Pbind(
		\instrument, \Drum2, \vol, 0.1, \chnl, 30,
		\freq, Pseq([Pn(330,8),300, 320, Pn(430,8),250],inf),
		\dur, Pseq([0.125],inf),
		\dt,  Pseq([Pn(0.05,30),Pn(0.25,4)],inf),
		\at, Pseq([0.05,0.05,0.01,0.05],inf),

	);
	l = Pfx(o, \echo, \chnl, 30, \maxdeltime, 2, \deltime, 0.25, \dectime, 10);
}).play(quant:2);
)
Pdef(\seqDrum3).stop;