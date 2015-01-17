s.scope(2);

(
SynthDef(\dark_bass, { |vol = 0.5, gate = 1, lpf = 110, poleFreq = 0.9|
	var env, tone;
	env = EnvGen.ar(Env([0,1,1,0],[0.5,1,0.5],\step), gate, doneAction:2);
	tone = LFSaw.ar([1,2,4,8],mul:vol) * LFSaw.ar([55,55.1,55.2,55.3]) * env;
	tone = OnePole.ar(tone,SinOsc.ar(0.1).range(-0.9,0.9));
	tone = LPF.ar(tone,lpf);
	tone = AllpassC.ar(tone,0.133,0.133,1);
	tone = FreeVerb.ar(tone,0.133,1);

	Out.ar(0, Splay.ar(tone));
}).add;
)

(
Pdef(\test, {
	Ptrace(
		Pbind( \instrument, \dark_bass, \legato, 1.1 , \dur, 1,
			\lpf, Pn(Pseries(100,50,10),inf),
		);
		,prefix: "myTest");
}).play;
)
Pdef(\test).stop;

s.freeAll;