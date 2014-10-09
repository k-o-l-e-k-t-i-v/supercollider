s.scope(2);
(
SynthDef(\Saw1, { |freq = 400, dt = 5, vol = 0.2, fqSaw = 10, mulSaw = 0.5, addSaw = 0.5|
	var tone, env;
	env = EnvGen.ar(Env([0,vol,0],[0.1*dt, 0.9*dt],\sin),doneAction:2);
	tone = SinOsc.ar(freq,0,env) * LFSaw.kr(fqSaw,0,mulSaw,addSaw);
	Out.ar(0,tone!2);
}).add;

)

(
Pdef(\loopSaw, {
	Pbind(
		\instrument, \Saw1,
		\freq, Pseq([Pseq([120,165],3), 130,165, 130,195, 120,195],inf),
		\dur, Pseq([2,2], inf),
		\vol, Pseq([Pn(Pseq([0.3,0.2]),5),0.2,0.15], inf),
		\fqSaw, Pseq([Pn(2,46),1, 2], inf),
		\dt, Pseq([Pn(5,3), 4, Pn(5,5), 3], inf),
		\addSaw, Pseq([Pseries(0.6,-0.1,6),Pseries(0.0,0.1,6)],inf),
		\mulSaw, Pseq([Pseries(0.4,0.08,6),Pseries(0.88,-0.08,6)],inf)
	)
}).play(quant:4);
)
Pdef(\loopSaw).stop

PdefAllGui(18);

