t = TempoClock.new(1).permanent_(true);
t.beats;
p = ProxySpace.push(s,clock:t);

~tone.play(fadeTime:12, vol:0.8).quant_(8);
~tone.rebuild;
(
~tone[0] = {
	var panEnv = EnvGen.ar( Env([0,-0.8,0.8,-1,1,0], [0.125,0.125,0.125,0.125,1.5], \sin), \panTrig.tr);
	Pan2.ar(SinOsc.ar(\freq.kr(60,2)) * BrownNoise.ar(0.2, 0.8), panEnv)
};
~tone[2] = \set -> Pbind(\args, [\panTrig], \dur, 0.5, \panTrig, Pseq([1,0,Pwhite(0,1),1], inf));
~tone[3] = \set -> Pbind(\args, [\freq], \dur, 8, \octave, 3, \degree, Pseq([5,7, 4, 6], inf));
)
~tone.end(10);


~trash.play(fadeTime:4, vol:0.2).quant_(8);
~trash.rebuild;
(
~trash[0] = {
	var aEnv = EnvGen.ar(Env.perc(0.0125, 0.05), \ampTrig.tr);
	Pan2.ar( Saw.ar(\freq.kr([90,98, 120, 2000],2), aEnv) * SinOsc.ar([60,65], 0, 0.4, 0.6), 0 )
};
~trash[1] = \set -> Pbind(\args, [\ampTrig], \dur, Pseq([Pn(0.0625,32), Rest(6)], inf), \ampTrig, 1);
~trash[30] = \filter -> {|in| GVerb.ar(in, 120, \gTime.kr) };
~trash[31] = \set -> Pbind(\args, [\gTime], \dur, Pseq([1.9, 6.1], inf), \gTime, Pseq([0.15, Pwhite(6,14)], inf));
)
~trash.end(20);


// play(vol:0.5).. super, k.
