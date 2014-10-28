s.scope(2);
PdefAllGui();

(
Pdef(\seqTick, {
	Pbind(\instrument, \TickA, \amp, 0.15,
		\dur, Pswitch([
			Pseq([Rest(0.125),0.25,0.25,0.125,0.25]),
			Pseq([Rest(0.375),0.125,0.25,0.25])
		],Pseq([Pn(0,5),1],inf)),
		\dt, Pseq([0.05, 0.09, 0.12],inf)
	);
}).play(quant:1);
)
Pdef(\seqTick).stop;

(
Pdef(\seqDrumA, {
	Pbind(\instrument, \DrumA, \freq, 90, \amp, 0.35,
		\dur, Pswitch([
			// Pn(2,100),
			Pn(0.5,100),
			Pseq([Pn(0.25,4),1,Rest(1)]),
			Pseq([Pn(0.25,4),Rest(2)])
		],Pseq([0,1,0,2],inf)),
		\dt, Pseq([0.05, 0.10, 0.15],inf),
		\room, Pseq([2,4],inf)
	)
}).play(quant:1);
)
Pdef(\seqDrumA).stop;

(
Pdef(\seqDrumB, {
	Pbind(\instrument, \DrumA, \freq, Pseq([130,110,90], inf), \amp, 0.1,
		\dur, Pswitch([
			Pseq([Rest(1),Pn(0.25,4)]),
			Pseq([0.125,0.125,Rest(5),0.25]),
			Pseq([Pn(0.125,4),Rest(0.5)])
		],Pseq([Pn(0,3),Pn(1,1)],inf)),
		\dt, Pseq([0.05, 2],inf),
		\room, Pseq([0.5,0.7,1,1.5,2,4],inf)
	)
}).play(quant:1);
)
Pdef(\seqDrumB).stop;

(
Pdef(\seqSinB, {
	e = Pbind(\instrument, \SinB, \amp, 0.10,
		\dur, Pseq([2,2,2,2,Rest(15)]),
		\dt, Pseq([1,5,8,10,1]),
		\midinote, Pseq([67,71,Prand([69,68,66]),71,67])
	);
	r = Pbind(\instrument, \SinB, \amp, 0.15,
		\dur, Pseq([2,2,2,2,Rest(15)]),
		\dt, Pseq([3,5,1,10,1]),
		\midinote, Pseq([71,67,Prand([69,68,66]),67,71])
	);
	Ppar([e,r],inf)
}).play(quant:5);
)
Pdef(\seqSinB).stop;


(
Pdef(\seqSinC, {
	Pmono(\SinC,
		\amp, Pseq([Pseq([0.2,0.1],6),0.1,0.05,0.17],inf),
		\dur, Pseq([Pn(5,3),2.5],inf),
		\midinote,Pseq([57,Prand([55,59]),54,Prand([60,58,56])], inf)
	);
}).play(quant:5);
)
Pdef(\seqSinC).stop;

(
Pdef(\seqSawA ,{
	var seq, eff;
	seq = Pbind(\instrument, \Saw1, \chnl, 35, \dur, 0.25, \dt, 0.125,
		\freq, Pseq([180, 100, Prand([310,380,410,330,220,460]), 100],inf),
		\vol , Pseq([Pseries(0.002,0.005,20),Pseries(0.15,-0.005,20)],inf),
		\shift, Pseq([Pseries(0,0.1,20)],inf)
	);
	eff = Pfx(seq, \echo, \chnl, 35, \maxdeltime, 6, \deltime, 0.75, \dectime, 6)
}).play(quant:1);
)
Pdef(\seqSawA).stop;

//
// (
// Pdef(\seqSawB, {
// 	var seq, eff;
// 	seq = Pmono(\SawB, \dt, 1, \amp,0.01,
// 		\dur, Pseq([0.5],inf),
// 		// \amp, Pseq([0.03,Pn(0.001,9)],inf),
// 		\freq, Pseq([120,100], inf)
// 	);
// 	//eff = Pfx(seq, \echo, \chnl, 30, \maxdeltime, 6, \deltime, 0.75, \dectime, 6)
// }).play(quant:1);
// )
// Pdef(\seqSawA).stop;

(
Pdef(\seqSig, {
	var seq, eff;
	seq = Pbind(
		\instrument, \SignalA, \chnl, 30, \amp, 0.35,
		\dur, Pseq([1,1,2,3,4,1,5, 10, 10, 2, 10, 1, 5, 5, 1, 1, Rest(20)],inf),
		// \freq, Pstutter(2, Pxrand([4000, 4200, 4100, 3950],inf))
		// \freq, Pstutter(3, Pxrand([300, 320, 310, 395],inf))
				\freq, Pstutter(3, Pxrand([300, 320, 310, 395],inf))
	);
	eff = Pfx(seq, \echo, \chnl, 30, \maxdeltime, 6, \deltime, 0.75, \dectime, 6)
}).play(quant:5);
)
Pdef(\seqSig).stop;



