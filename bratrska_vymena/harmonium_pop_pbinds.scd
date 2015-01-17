
s.boot;

(
~tempo = 100/60;

Ndef(\z).quant = 2 / ~tempo;
Ndef(\z).fadeTime = 1;


Ndef(\z,{|freq = 440|
	Splay.ar(
		CombN.ar(
			LFTri.ar(freq.lag(0.01)*[1,0.5],{ExpRand()}!16,mul:SinOsc.kr((_*0.1!16)).range(0.01,0.1))
			,delaytime:(4/~tempo),decaytime: ~tempo*4)
	)
}).play;

Ndef(\z)[1] = \set -> Pbind(
	\dur, 1 / 4 / ~tempo,
	\freq, Pxrand([
		Pxrand((20+[0,3,7,10]).midicps,4),
		Pxrand((30+[0,3,7,10]).midicps,4),
		Pxrand((40+[0,4,7,11]).midicps,4),
		Pxrand((50+[1,4,7,11]).midicps,4),
		Pxrand((60+[1,4,8,11]).midicps,4),
	]*2,inf),
	\amp, Pwhite(0.5,1.0),
);



Ndef(\d).quant = 2 / ~tempo;
Ndef(\d).fadeTime = 1;


Ndef(\d,{|freq = 440|
	Splay.ar(
		CombN.ar(
		LFCub.ar(freq*[1,1],{ExpRand()}!16,mul:SinOsc.kr((_*0.01!16)).range(0.01,0.1))
			,delaytime:(2/~tempo),decaytime: ~tempo*2)
	)
}).play;

Ndef(\d)[1] = \set -> Pbind(
	\dur, 1 / 2 / ~tempo,
	\freq, Pxrand([
		Pxrand((20+[0,3,7,10]).midicps,2),
		Pxrand((30+[0,3,7,10]).midicps,2),
		Pxrand((40+[0,4,7,11]).midicps,2),
		Pxrand((50+[1,4,7,11]).midicps,2),
		Pxrand((60+[1,4,8,11]).midicps,2),
	],inf),
	\amp, Pwhite(0.5,1.0),
);



Ndef(\y).quant = 2 / ~tempo;
Ndef(\y).fadeTime = 1;


Ndef(\y,{|freq = 440|
	Splay.ar(
		CombN.ar(
		LFCub.ar(freq*[1,1],{ExpRand()}!16,mul:SinOsc.kr((_*0.001!16)).range(0.01,0.1))
			,delaytime:(1/~tempo),decaytime: ~tempo)
	)
}).play;

Ndef(\y)[1] = \set -> Pbind(
	\dur, 2 / 1 / ~tempo,
	\freq, Pxrand([
		Pxrand((20+[0,3,7,10]).midicps,1),
		Pxrand((30+[0,3,7,10]).midicps,1),
		Pxrand((40+[0,4,7,11]).midicps,1),
		Pxrand((50+[1,4,7,11]).midicps,1),
		Pxrand((60+[1,4,8,11]).midicps,1),
	]/2,inf),
	\amp, Pwhite(0.5,1.0),
);


)

