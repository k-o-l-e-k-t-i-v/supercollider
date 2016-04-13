
(
Ndef(\sin,{
	var f1;
	f1 = Decay.ar(Impulse.ar(4/[1,2,4,8]));
	Splay.ar(
	GVerb.ar(
			(LFPulse.ar(2/[1,2,4,8]) + LPF.ar( BrownNoise.ar(0.1!2),120) ) * SinOsc.ar(f1*100,mul:0.2)
	)
)}).play;
)