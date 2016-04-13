
(
Ndef(\a).quant = 2.0;
Ndef(\a,{
	var sig;
	sig = Vibrato.ar(
		(LFCub.ar(LFCub.ar([10,10.1]).range(44,99.1) * LFPulse.ar(1/[1,2,3,4])) * LFPulse.ar(4/[1,2,3,4]))	+
		(LFPar.ar(LFCub.ar(4/[1,2,3,4]).range(99,20),mul:0.72) * (Decay.ar(Impulse.ar(4/[1,2,3,4],0.5),1.75)) ) +
		(Decay.ar(Impulse.ar(4/[1,3,2,4],0.5),0.1) * WhiteNoise.ar(0.5!2)) );


	Splay.ar(
		sig
)}).play;
)


///////



(
Ndef(\b).quant = 2.0;
Ndef(\b,{
	var s;
	s = Select.kr(Stepper.kr(Impulse.kr(1/8),max:5),[1,1.5,1,1.25,1,1.125]);
	Splay.ar(
	LFSaw.ar([432,432.01] / ([1,2,0.5,4] * s * pi) + LFSaw.ar(1/[1,2,3,4]).range(4,-4),mul:0.33).lag(SinOsc.ar(2/[1,2,3,4]).range(0.00001,0.01)) * LFPulse.ar(4/[1,2,3,4])
)}).play;
)