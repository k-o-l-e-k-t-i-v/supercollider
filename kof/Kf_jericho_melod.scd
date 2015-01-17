
StageLimiter.activate;

(
Ndef(\tone).fadeTime = 8;
Ndef(\tone,{

	~tune1 = {1.5pi + LFSaw.ar(1/4/[1,2,4,8]).range(-pi,pi).round(pi/4)};
	~tune2 = {1.5pi + LFSaw.ar(1/2/[1,2,4,8]).range(-pi,pi).round(pi/8)};

	Splay.ar(
		HPF.ar(
			Vibrato.ar(
				SinOsc.ar(([60,72,62]+48).midicps / ~tune1 / (2**(1..16)),mul:1/fib(12)) + LFSaw.ar(22000/~tune2/(2**(1..16)),mul:0.02)
				,(1..8)/8,0.2)
			,10)
)});
)


(
Ndef(\rythm).quant = 2.0;
Ndef(\ryhtm).fadeTime = 8;
Ndef(\rythm,{

	Splay.ar(
		Pulse.ar(2/[1,2,3,4,5])
)});
)

(
Ndef(\abraka).quant = 2.0;
Ndef(\abraka).fadeTime = 4;
Ndef(\abraka,{Splay.ar(
	GVerb.ar(
		Ndef(\tone).ar * LFSaw.ar(1/fib(12)).squared * Ndef(\rythm).ar
		,10)
	,0.5,0.5)}).play;
)