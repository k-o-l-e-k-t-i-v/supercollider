t = TempoClock.new(1,0).permanent_(true);
p = ProxySpace.push(s,clock:t);
t.beats;

~tone.quant = 1;
~tone.play.fadeTime_(4);
(
~tone[0] = { Balance2.ar(
	SinOsc.ar(130,0, SinOsc.kr(1/8, 0, 0.03, 0.18), 0.25),
	LFTri.ar(SinOsc.kr(0.1,0.1, 10,85), 0.5, SinOsc.kr(1/16, 0, 0.05, 0.13), 0.2),
	Saw.kr([0.5,4]));
}
)
~tone.scope;
~tone.stop(8);

(
ProxySynthDef(\drumSynth, {
	var aEnv = EnvGen.ar(Env.adsr(0.001,0.35,0.9,1),\gate.kr(1), doneAction:2);
	var fEnv = EnvGen.ar(Env.perc(0.001,0.01).range(\freq.kr(60),\rndFreq.kr(8000)));
	SinOsc.ar(fEnv!2, 0, 1.8) * LFPulse.ar([4,8],0,0.1,0.5,0.5) * WhiteNoise.ar(0.15,0.85) * aEnv * \amp.kr(0.3, 0.5);
}).add;
)

~drum.quant = 1;
~drum.play;
(
~drum[0] = Pbind(
	\instrument, \drumSynth,
	\dur, Pswitch([
		Pseq([0.5,0.25,0.25, 0.75, 0.25]),
		Pseq([Pn(0.125,2), Rest(0.25)],4),
		Pseq([Pn(0.125,8), 0.25, Rest(1.25)]),
	], Pstutter(Pseq([3,1], inf), Pseq([0,1,0,2], inf))),
	\octave, Pseq([Pn(2, 4),1], inf),
	\degree, Pseq([3,4,3,3,7], inf),
	\rndFreq, Pwhite(16000,18000, inf)
);

~drum[30] = \filter -> {|in| LPF.ar(in, SinOsc.kr([8,10], 0, \oscFreq.kr(800,0.05), \addFreq.kr(1200,0.25)))};
~drum[31] = \set -> Pbind( \args, [\oscFreq, \addFreq, \amp],
	\dur, Pseq([4,2,2,2], inf),
	\oscFreq, Pseq([800,3000], inf),
	\addFreq, Pseq([1100,4300], inf),
	\amp, Pseq([Pn(0.5,3),1.0], inf)
);
~drum[32] = \filter -> {|in| GVerb.ar(in, 18, 8.125, 0.9,0.9,30,0.2)};
~drum[33] = \filter -> {|in| Vibrato.ar(in, 1000, 0.02, 0.8, 0, 0.08, 0.3) };
)
~drum.scope;
~drum.free(4);

