// Slightly melancholic, Coded by Kof @
// Mon Sep 22 00:54:19 CEST 2014
//
//
//
// ,dPYb,                  ,dPYb,
// IP'`Yb                  IP'`Yb
// I8  8I                  I8  8I
// I8  8bgg,               I8  8'
// I8 dP" "8    ,ggggg,    I8 dP
// I8d8bggP"   dP"  "Y8ggg I8dP
// I8P' "Yb,  i8'    ,8I   I8P
// ,d8    `Yb,,d8,   ,d8'  ,d8b,_
// 88P      Y8P"Y8888P"    PI8"8888
//                         I8 `8,
//                         I8  `8,
//                         I8   8I
//                         I8   8I
//                         I8, ,8'
//                          "Y8P'


///////////// boot server //////////////////////////////////////////////////////////////////////////////

s.boot;


///////////// High freq melody //////////////////////////////////////////////////////////////////////////////

(
Ndef(\High).fadeTime = 2.0;
Ndef(\High).quant = 2.0;

t = Tuning.harmonic;

Ndef(\High,{
	var modlong,mod,melody,notes;
	Splay.ar(
	modlong = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4,1/8]/16)),2*[1,2,4,2,1,2,4,8]);

	mod = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4,1/8]/4)),modlong*31.4159265359/[1,2,4,2,1,2,4,8]);

	melody = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4])),[1,0.5,4,0.25,1.5,4,2,1.5]);
	notes = t.cents.at([1,2,11]) / mod * melody;

	FreeVerb.ar(
		RLPF.ar(
			XFade2.ar(
				SinOsc.ar(notes,mul:0.1).cubed,
				LFSaw.ar(notes,mul:0.1).distort,
				SinOsc.kr([0.1437,0.1897]).range(-0.9,0.9)) *

			Decay.ar(Impulse.ar((mod)/[1,2,3,5,8,13,21]),[1,2,3,5,8,13,21]/(mod/32))
			,SinOsc.kr(notes/1024.012).range(notes/2,notes*2)
		) * SinOsc.kr((_*0.137!8)+0.0112).range(0.1,1);

		,0.25,5,0.8)
)}).play;
)


//////////////// Low freq melody ///////////////////////////////////////////////////////////////////////////

(
Ndef(\Low).fadeTime = 2.0;
Ndef(\Low).quant = 2.0;

t = Tuning.harmonic;

Ndef(\Low,{Splay.ar(

	var mod,melody,notes;
	mod = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4,1/8]/4)),2*31.415926536/[1,2,4,2,1,2,4,8]);

	melody = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4])),[1,0.5,4,0.25,1.5,4,2,1.5]);
	notes = t.cents.at([1,2,7]) / mod * melody;

	FreeVerb.ar(
		RLPF.ar(
			XFade2.ar(
				SinOsc.ar(notes,mul:0.1).cubed,
				LFTri.ar(notes,mul:0.1).distort,
				SinOsc.kr([0.01,0.013]).cubed.range(-0.9,0.9)) *

			Decay.ar(Impulse.ar((mod*4)/[1,2,3,5,8,13,21]),[1,2,3,5,8,13,21]/(mod/13))
			,SinOsc.kr(notes/512.01).range(notes/2,notes*2)
		) * SinOsc.kr((_*0.1337!8)+0.01).range(0.1,1);

		,0.1,5.5,0.8)
)}).play;
)



//////////////// Long freq melody ///////////////////////////////////////////////////////////////////////////

(
Ndef(\Long).fadeTime = 2.0;
Ndef(\Long).quant = 2.0;

t = Tuning.harmonic;

Ndef(\Long,{Splay.ar(

	var modlong,mod,melody,notes;
	modlong = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4,1/8]/16)),2*[1,2,4,2,1,2,4,8]);
	mod = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4,1/8,1/16]/8)),modlong*31.415926536/[1,2,4,2,1,2,4,8]);

	melody = Select.kr(Stepper.kr(Impulse.kr([1/2,1/4,1/8,1/16]/8)),[1,0.5,4,0.25,1.5,4,2,1.5]);
	notes = t.cents.at([1,2,7,11]) / mod / melody;

	FreeVerb.ar(
		RLPF.ar(
			XFade2.ar(
				LFSaw.ar(notes/1.5+SinOsc.kr(0.1).range(-2,2),mul:0.4).cubed,
				LFSaw.ar(notes*1.5+SinOsc.kr(55).range(-2,2),mul:0.4).distort,
				SinOsc.kr([0.1,0.13]).cubed.range(-0.9,0.9))
			,SinOsc.kr(notes/2048.01).range(notes/2,notes*2)
		) * SinOsc.kr((_*0.1337!16)+0.01).exprange(0.01,1);

		,0.8,SinOsc.kr(1/[1,2,4,8]).range(0.2,5.5),0.8)
)}).play;
)

Ndef(\Low).scope(2,zoom:4)

//////////////// Some hisses ///////////////////////////////////////////////////////////////////////////

(
Ndef(\Hiss).fadeTime = 2.0;
Ndef(\Hiss).quant = 2.0;

Ndef(\Hiss,{Splay.ar(
	RLPF.ar(
		XFade2.ar(
			WhiteNoise.ar(0.05!4),
			BrownNoise.ar(0.05!4),

			SinOsc.kr([0.103,0.101])),
		SinOsc.kr((_*0.0124!4)+0.01).range(220,8000)
	) *

	Decay.ar(Impulse.ar(8/[1,2,3,5,8,13,21,34,55]),[1,2,3,5,8,13,21,34,55]/13)

)}).play;
)


////////////////// And beat /////////////////////////////////////////////////////////////////////////

(
Ndef(\Beat).fadeTime = 2.0;
Ndef(\Beat).quant = 2.0;

Ndef(\Beat,{Splay.ar(
	RLPF.ar(
		XFade2.ar(
			SinOsc.ar([55,56],mul:0.4).distort,
			LFPar.ar([55.5,55.5]*2,mul:0.4),

			SinOsc.kr(1/[8,13])
	) ,SinOsc.kr((_*0.0324!4)).range(52,58))

	*

	Decay.ar(Impulse.ar(8/[1,2,3,5,8]),[1,2,3,5,8]/32)

)}).play;
)


Ndef(\Beat).stop(5);

///////////////////////////////////////////////////////////////////////////////////////////


NdefMixer(s);


///////////////////////////////////////////////////////////////////////////////////////////