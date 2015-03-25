
s.boot;

(
t = Tuning.harmonic;

Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 0.2;

Ndef(\a,{
	var pattern,o1,o2,o3,o4,s,f;
	Splay.ar(
	pattern = [1,2,4,8,1,1,2,4];
	o1 = Select.kr(Stepper.kr(Impulse.kr(4/[1,2,4,8])),pattern.scramble);
	o2 = Select.kr(Stepper.kr(Impulse.kr(4/[2,4,8,16])),pattern.scramble);
	o3 = Select.kr(Stepper.kr(Impulse.kr(4/[4,8,16,32])),pattern.scramble);
	o4 = Select.kr(Stepper.kr(Impulse.kr(4/[8,16,32,64])),pattern.scramble);

	s = ([]++o1++o2++o3++o4);
	f = t.cents.at([1,2,7,15]) / (o4*2) * s / o2;

	FreeVerb.ar(
		MoogFF.ar(
			XFade2.ar(
				LFSaw.ar(f,mul:2),
				SinOsc.ar(f,mul:2),
				LFNoise0.ar((1..32)/4).range(-1,1).lag(0.01)
			) * Decay.ar(Impulse.ar(8/(1..32)),(1..32)/24)
			,SinOsc.ar(f/o1).range(f/2,f*2).lag(0.02))
		,0.23,2).softclip.distort + SinOsc.ar(f/4, mul:SinOsc.kr((_*0.1!4)+0.01).exprange(0.01,0.1))
)}).play;
)

