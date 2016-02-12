//
// Nebeha???? consola:
// Ndef('filtr')
// late 0.107418287
// exception in GrafDef_Load: exceeded number of interconnect buffers.
// while reading file 'C:\Users\Jachym\AppData\Local\SuperCollider\synthdefs\\temp__0filtr_0.scsyndef'
// exception in GrafDef_Load: exceeded number of interconnect buffers.
// while reading file 'C:\Users\Jachym\AppData\Local\SuperCollider\synthdefs\\temp__0filtr_0.scsyndef'
// *** ERROR: SynthDef temp__0filtr_0 not found
// FAILURE IN SERVER /s_new SynthDef not found
// FAILURE IN SERVER /n_set Node 1011 not found


// ted?

// bohuzel to same?

(

(
Ndef(\a).fadeTime = 4.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{Splay.ar(
	SinOsc.ar([60,62,67].midicps/[1,2,4,8,16]+LFSaw.ar(1),mul:0.5)
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
	LFSaw.ar(SinOsc.ar(1).range(-10,10)+Ndef(\a).ar.range(60.midicps/2,60.midicps*[1,2,4,8,16]))
	* LFSaw.ar(8/[1,2,3,5,8]*{ExpRand()}!8).squared;
)});
);


// |
// |  FM 2
// V


(
Ndef(\c).fadeTime = 2.0;
Ndef(\c).quant = 2.0;
Ndef(\c,{Splay.ar(
	LFSaw.ar(Ndef(\b).ar.range(60.midicps/2,(60-24).midicps*[1,2,4,8,16]*2))
	* LFSaw.ar(16/[1,2,3,5,8,13]).squared;
)});
);


// |
// |   FM 3
// V


(
Ndef(\d).fadeTime = 2.0;
Ndef(\d).quant = 2.0;
Ndef(\d,{Splay.ar(
	SinOsc.ar(Ndef(\c).ar.range((LFNoise0.ar((1/16)!3).range(30,90).round(12)).midicps.lag([1,2,4])*[1,2,4,8,16],(LFNoise0.ar((1/32)!3).range(30,90).round(12)).midicps.lag([1,2,4])*[1,2,4,8,16]))
	* LFSaw.ar(1/4/[1,2,4,8,16]).squared;
)});
);


// |
// |   filter
// V


(
var num = 8;
var speed = 1/4/[12,18,22,99,0.1];
var sharpness = 0.5;

Ndef(\filtr).fadeTime = 2.0;
Ndef(\filtr,{
	Splay.ar(
		BPF.ar(
			Ndef(\d).ar + SinOsc.ar((1..num-1)/100.1,mul:0.01)
			,(1..num-1)*(22000/(num+1))+SinOsc.ar({ExpRand()}!8).range(-40,40),sharpness,SinOsc.ar({ExpRand()*speed}!8).exprange(0.001,48)
		)
		,0.17,1)}).play;
);

)