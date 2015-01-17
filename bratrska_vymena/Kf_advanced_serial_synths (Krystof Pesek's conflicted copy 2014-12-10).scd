(

(
Ndef(\a).fadeTime = 4.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{Splay.ar(
	SinOsc.ar([60,62,64].midicps/[1,2,4,8,16]/2+LFSaw.ar(111),mul:0.5)
	* LFSaw.ar(1/4/[1,2,4]).squared;
)});
);

// |
// |   FM 1
// V

(
Ndef(\b).fadeTime = 2.0;
Ndef(\b).quant = 2.0;
Ndef(\b,{Splay.ar(
	SinOsc.ar(Ndef(\a).ar.range(60.midicps/2,60.midicps*[1,2,4,8,16]),mul:0.5)
	* LFSaw.ar(1/16/[1,2,4,8,16]).squared;
)});
);


// |
// |  FM 2
// V


(
Ndef(\c).fadeTime = 2.0;
Ndef(\c).quant = 2.0;
Ndef(\c,{Splay.ar(
	SinOsc.ar(Ndef(\b).ar.range(60.midicps/2,(60-12).midicps*[1,2,4,8,16]*2),mul:0.5)
	* LFSaw.ar(1/16/[1,2,4,8,16]).squared;
)});
);


// |
// |   FM 3
// V


(
Ndef(\d).fadeTime = 2.0;
Ndef(\d).quant = 2.0;
Ndef(\d,{Splay.ar(
	SinOsc.ar(Ndef(\c).ar.range((LFNoise0.ar((1/16)!3).range(30,90).round(11)).midicps.lag([1,2,4])*[1,2,4,8,16],(LFNoise0.ar((1/32)!3).range(30,90).round(11)).midicps.lag([1,2,4])*[1,2,4,8,16]*2),mul:0.5)
	* LFSaw.ar(1/32/[1,2,4,8,16]).squared;
)});
);


// |
// |   filter
// V


(
~num = 16;
~speed = 1/4/[12,18,22,99,0.1];
~sharpness = 0.5;

Ndef(\filtr).fadeTime = 2.0;
Ndef(\filtr,{
	Splay.ar(
		BPF.ar(
			Ndef(\d).ar + SinOsc.ar((1..10)/100.1,mul:0.01)
			,(1..~num)*(22000/~num)+SinOsc.ar({ExpRand()}!48).range(-40,40),~sharpness,SinOsc.ar({ExpRand()*~speed}!48).exprange(0.001,8)
		)
		,0.17,1)}).play;
);

)