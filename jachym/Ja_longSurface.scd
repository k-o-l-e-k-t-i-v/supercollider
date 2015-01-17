s.scope(2);
(
SynthDef(\longSin, { |freq = 200, dt = 5, vol = 0.2|
	var tone, osc1, osc2, env1, env2;
	env1 = EnvGen.ar(Env.perc(0.35*dt, 0.65*dt, vol));
	env2 = EnvGen.ar(Env.linen(0.3*dt,0.2*dt, 0.4*dt, vol));
	osc1 = SinOsc.ar([freq,freq+1,freq+2,freq+9],[0,0.1pi,0.3pi,0.7pi],SinOsc.kr(0.25,[0,pi],0.005,0.65)) * env1;
	osc2 = SinOsc.ar(freq * SinOsc.kr([32, 16.1],[0,0.3pi],0.5),0,0.2) * Saw.kr(4,0.3,0.7) * env2;
	tone = Splay.ar([osc1, osc2],SinOsc.kr([1,0.125,0.5,0.25],0,1));

	DetectSilence.ar(tone, doneAction:2);
	Out.ar(0,tone);
}).add;

SynthDef(\Drum1, {|freq = 90, vol = 0.3, dt = 0.5, at = 0.1, chnl = 0|
	var tone, env;
	env = EnvGen.ar(Env.perc(at,dt,vol,-4),doneAction:2);
	tone = SinOsc.ar([freq,freq*2,freq*8], [0,0.7pi,1.7pi],[1.3,1,0.8]) * env;
	Out.ar(chnl, Splay.ar(tone,SinOsc.kr(40,0,0.66)));
}).add;
)

(
Pdef(\seq_longSin, {
	Pbind( \instrument, \longSin, \vol, 0.3, \dur, 10, \dt, 17.5,

		\midinote, Pswitch(
			[
				Pseq([57,55,59,53]),
				Pseq([57,55,57,59]),
				Pseq([67,65,67,69]),
				Pseq([65,69,67,63])
			], Pseq([0,1,2,3],inf)
		)
	)
}).play(quant:10);
)
Pdef(\seq_longSin).stop;

(
Pdef(\seqDrum1, {
	Pbind(
		\instrument, \Drum1, \freq, [10,1880], \vol, [0.35,0.01], \dur, 0.25, \dt, [0.35,0.1],
		\at, Pseq([0.05,0.15,0.1,0.05],inf)
	)
}).play(quant:2);
)
Pdef(\seqDrum1).stop;