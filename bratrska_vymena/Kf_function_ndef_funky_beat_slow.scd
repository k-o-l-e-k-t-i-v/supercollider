s.boot;


(
Ndef(\a).quant = 2.0;

Ndef(\a).fadeTime = 2.0;

Ndef(\a,{Splay.ar(
	~rythm = [1,2,3,5,8,13,21,34,55,89];
	~sel = Select.kr(Stepper.kr(Impulse.kr(1/2)),1+(1/[1,1,2,4,1,2,1,4,1,1].scramble));
	~f = [20,16+12,22,44,54].midicps*~sel;
	RLPF.ar(
		Blip.ar([~f,~f*2]+LFNoise0.kr(24!32).range(-8,8).lag(0.01),4) +
		LFSaw.ar(~f,mul:0.5),
		[~f,~f*2,~f*1.5,~f*1.25],SinOsc.ar(8/~rythm).range(0.2,1.5)
	) *

	Decay.ar(Impulse.ar(8/~rythm),~rythm/21)

)}).play;
)
