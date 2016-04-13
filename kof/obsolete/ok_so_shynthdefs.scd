s.boot;
(
(
	SynthDef(\a,{|freq = 220, micro = 1.0001, bordel = 0, dur = 1|
		var sig,ramp,
		env = EnvGen.ar(Env.new([0,1,0],[{ExpRand(0.015,0.1)*dur}!4,{ExpRand(0.2,3)*dur}],[-3,{ExpRand(1,3)}!4]),doneAction:2);

		sig = SinOsc.ar(freq/(micro**(1..12)),mul:{ExpRand(0.02,0.5)}!4);

		ramp = Line.kr(0,1,dur).squared;
		sig = sig + (sig.lag(0.02) * ramp * LFSaw.ar(freq*(micro**(1..4))));
		sig = LPF.ar(sig,SinOsc.ar(freq/1000,{ExpRand(0,2pi)}).range(45,4400));
		sig = FreeVerb.ar(sig,0.3,10);

		Out.ar(0,Splay.ar(sig*env));
	}).store; //use add insted if store. "add" save it to memory, store save it on disk
);
)
/////////////////////////////////////////////////////////////////////////////////////////
(
(
	Pdef(\voice1).stop;
	Pdef(\voice1,Pbind(
		\instrument, \a,
		\dur, Pseq([1,2]/4,inf),
		\freq, Pxrand(([60,72,67,63]+24).midicps,inf),
		\bordel, Pwhite(0.0001,0.1,inf),
		\micro, 2.0001
	)).play;
);
)
(
(
	Pdef(\voice2).stop;
	Pdef(\voice2,Pbind(
		\instrument, \a,
		\dur, Pseq([2,8,2,4],inf),
		\freq, Pxrand(([60,72,67,63]-12).midicps,inf),
		\bordel, Pwhite(0.0001,0.1,inf),
		\micro, 1.0001
	)).play;
);


)


//u so wild kof. ugh

//in order to use env with dur u need to use "sustain" in defining the env