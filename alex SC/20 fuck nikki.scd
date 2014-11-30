
(
SynthDef(\nik, {
	arg vol=0.1, freq=500;
	var tone1, tone2, env, env2, trig;
	env=EnvGen.ar(Env([0,1,0],[0.1,1.9]),gate:1,doneAction:2);

	trig=Pulse.ar(0.25,0.5,0.02);

	tone1=Klank.ar(`[
		[freq, freq+301.25].dup(5), //freq array
		0.3.dup(5).normalizeSum, //amp array
		{rrand(1.0, 1.5)}.dup(5)],//ring times
		trig//"trigger"
			);
	tone1=tone1*env;
	tone1=Splay.ar(Pan2.ar(tone1,SinOsc.kr(3).range.([-1,0],[0,1]),vol),2);

	env2=EnvGen.ar(Env([0,1,0],[0.1,1]),gate:1,doneAction:2);

	tone2=RLPF.ar(SinOsc.ar(65)*env2,10);

	Out.ar(0, Mix([tone1*0.8, tone2*env]));
}).play;
)

s.scope(2);

(
Pdef (\loopnik, {
	Pbind(
		\instrument, \nik,
		/*
		\dur, Pseq([Pn(1.2,4),Rest(0.12)],inf),
		\freq, Pseq([500,400,420,500, 200],inf),*/
		[\dur, \freq], Pseq([[1,\],[0.5,500],[0.5,200]],inf)
).trace;

}
).play;

)

{ Ringz.ar(Dust.ar(3, 0.3), 500, 2) }.play
