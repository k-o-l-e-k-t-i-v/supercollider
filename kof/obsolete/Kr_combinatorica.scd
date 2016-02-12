
s.boot;

(
t = Tuning.harmonic;
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;
Ndef(\a,{
	var slong,s,v,l,p,t,slong;
		slong = Select.kr(Stepper.kr(Impulse.kr(1/2/[1,2,3,5,8,13,21])),[1,1/2,1/4,2,4,1/2,1,2,1/4,1]);
		s = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,3,5,8,13,21])),[1pi,2pi,4pi,8pi,1.5pi,1pi,2pi,1.5pi]);
		v = Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,3,5,8,13,21])),1/(1..11).scramble);
		l = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,3,5,8,13,21])),1.5/(1..11).scramble);
		p = [1,2,4,8,16];

		t = t.cents.at([1,2,7,11]) / s * slong;

	Splay.ar(
		FreeVerb.ar(
			SinOsc.ar(t,l.range(-8pi,8pi).lag(8/p),mul:v.lag(0.1))
			,0.133,2).softclip
)}).play;
)