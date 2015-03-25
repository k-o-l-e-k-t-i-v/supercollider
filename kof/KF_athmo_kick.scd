s.boot;
(
Ndef(\kick).quant = 2.0;
Ndef(\kick).fadeTime = 2.0;
Ndef(\kick,{
	var filt;
	filt = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,4,8]),max:4),[400,1000,2000,800,400]).lag(0.01);
	Splay.ar(
		FreeVerb.ar(
			AllpassC.ar(
				Pan2.ar(
					LPF.ar(Ringz.ar( SinOsc.ar([77,77.01]) + BrownNoise.ar(0.2!2) * Decay.ar(Impulse.ar(8/[1,1.5,3,2]),0.25), filt, 0.015 ),LFSaw.kr(1/8/[1.01,2.02]).range(44,2200)) -
					HPF.ar((WhiteNoise.ar(0.5!4) * Decay.ar(Impulse.ar(4/[1,3,4,2]),0.35)),2200) -
					(SinOsc.ar(([61,57,67]-12).midicps) * LFSaw.ar(1/8/[1,2,3,5,8]))
					,SinOsc.ar(0.5).range(-0.5,0.5))
				,1.33,0.0133,2)
			,0.133,1).softclip;
		)

}).play;
)
