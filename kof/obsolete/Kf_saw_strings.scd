
(
Ndef(\saw).fadeTime = 4.0;
Ndef(\saw).quant = 2.0;
Ndef(\saw,{
	var lfo,steps;
	lfo = LFNoise0.ar(1/4/[1,2,4,8]).range(1,8).round([pi/1.125,pi/1.25,pi/1.5,pi/1]);
	steps = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8])),[2,4,8,1.5,8,2,4,8]);

	Splay.ar(
		FreeVerb.ar(
			Vibrato.ar(
				LFSaw.ar([432,432.1] * lfo / [1,2,4,8] / steps + LFNoise0.ar([4,5,6,7]).range(-3,3).lag(3)) * LFSaw.ar(1/4/[1,2,4,8],SinOsc.ar((_*0.1!32)+0.00001).range(-1pi,1pi),mul:0.5).squared,
				[5,6,7,8],0.2,0,0,0.2,0.1
			)
			,0.5,2,0.5)
		,1,0.5)
}).play;
)



(
Ndef(\osc).fadeTime = 10.0;
Ndef(\osc).quant = 2.0;
Ndef(\osc,{
	var lfo,steps;
	lfo = LFNoise0.ar(1/4/[1,2,4,8]).range(1,8).round([pi/1.125,pi/1.25,pi/1.5,pi/1]);
	steps = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8])),[2,4,8,1.5,2,4,8]);
	Splay.ar(
		FreeVerb.ar(
			Vibrato.ar(
				LFSaw.ar([432,432.1] * lfo / [1,2,4,8] / steps + LFNoise0.ar([4,5,6,7]).range(-3,3).lag(3)) * LFSaw.ar(1/4/[1,2,4,8],SinOsc.ar((_*0.1!32)+0.00001).range(-1pi,1pi),mul:0.5).squared,
				[5,6,7,8],0.2,0,0,0.2,0.1
			)
			,0.5,2,0.5)
		,1,0.5)
}).play;
)


Ndef(\osc).stop(10)
Ndef(\saw).stop(10)

Ndef(\osc).clear
Ndef(\saw).clear