s.boot;


(
Ndef(\hisses).fadeTime = 2.0;

Ndef(\hisses).quant = 2.0;

Ndef(\hisses,{
	var mel,a,b,z;
	mel = Select.kr(Stepper.kr(Impulse.kr(1/2/[4,8])),[1,1.5,1.25,2,4,0.5,1,1.5]).lag(0.1);
	a = WhiteNoise.ar(0.8!2) + LFSaw.ar(mel*([67,72,60]-36).midicps/[1,1.5,1.25,2,4,8],LFNoise0.kr(1/4/[1,2]).range(-1,1).lag(0.5));
	b = Decay.ar(Impulse.ar(4/[1,2,3,5,8,13]),1);
	a = RLPF.ar(a,b.range(20,2000*mel),add:a) * b;
	z = AllpassC.ar(a,1.25,0.25,mul:0.5,add:a) * LFSaw.ar(1/4/[1,2,3,5,8,13]);

	Splay.ar(
		Delay1.ar(
			FreeVerb.ar(z,0.95,2,0.25,mul:0.25,add:z)
		)
)}).play;
)