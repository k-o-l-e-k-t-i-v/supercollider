
s.boot;
(
t = Tuning.harmonic;
Ndef(\a).quant = 2.0;
Ndef(\a,{

	var s1,s2,f,depth,d1,d2,d3;
	Splay.ar(

	s1 = Select.kr(Stepper.kr(Impulse.kr(1/2/[1,2,3,5,8,13,21])),[4,4,2,2,8,8,16,16,2,2].scramble);
	s2 = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,3,5,8,13,21])),[4,4,2,2,8,8,16,16,2,2].scramble);

	f = t.cents.at([1,2,7,11]) / (s1*pi) + LFNoise0.ar(4!4).range(-3,3).lag(0.1);
	depth = t.cents.at([1,2,7,11]) / (s2/s1*pi) / 2.0 ;

	d1 = Decay.ar(Impulse.ar(1/[1,1,2,3,5,8]),SinOsc.kr(0.01).range(0.5,0.1));
	d2 = Decay.ar(Impulse.ar(2/[1,1,1,2,3,5,8]),SinOsc.kr(0.02).range(0.2,2.0));
	d3 = Decay.ar(Impulse.ar(8/[1,2,3,5,8]),SinOsc.kr(0.03).range(0.6,1.0));

	FreeVerb.ar(
		RLPF.ar(
			LFSaw.ar(f,SinOsc.kr(depth/10000.0).range(-8pi,8pi),mul:4).distort * d3
			,f + LFNoise0.kr(1/4/[1,2,3,5,8,13]).range(depth/2,depth*2).round(depth/4.0)
		)
	,0.1,2).softclip

)}).play;
)