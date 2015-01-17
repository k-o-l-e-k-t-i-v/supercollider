(

Ndef(\pdeftest).fadeTime=2;
Ndef(\pdeftest).quant=3;

Ndef(\pdeftest, {

	arg freq;

	~sig=FreeVerb.ar(
		VarSaw.ar(LFCub.kr(10).range(35,95))*Normalizer.ar(PinkNoise.ar(Sweep.kr(Impulse.kr(0.5)).range(0,0.5),0.1),0.1),
		mix:0.5,room:1,damp:0);

	~sig=~sig*2*LFPulse.kr(freq);


}).play;

)

Ndef(\pdeftest)[1] = \set -> Pbind(\freq, Pseq([1,4,1], inf), \dur, Pseq([2,1,4],inf));
Ndef(\pdeftest)[1] = \set -> Pbind(\freq, Pseq([2,8,2], inf), \dur, Pseq([0.5,1,1.5],inf));
Ndef(\pdeftest)[1]= \filter -> { arg in; FreeVerb.ar(in)};

s.scope(2);