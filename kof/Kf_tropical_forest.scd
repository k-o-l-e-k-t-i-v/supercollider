
/////////////////////////////////////
// snd generator (not playing alone)
/////////////////////////////////////

(
Ndef(\gen).fadeTime = 4.0;
Ndef(\gen,{|f=#[16]|
	Splay.ar(
	(PinkNoise.ar(0.3!8) * Decay.ar(Impulse.ar(4/[1,2,4,8]),{ExpRand()}!10)) +
		LFPulse.ar(4320/[1,2,4,8,16,64]/ (f * pi)+SinOsc.ar({ExpRand()/100}!10).range(4)).softclip
)});
)

// ctl gen freq

// ramp fading param (seconds)
Ndef(\gen).lag(\f,10);


// goto X
Ndef(\gen).set(\f,16)
Ndef(\gen).set(\f,8)
Ndef(\gen).set(\f,4)

// even arrays ^^ using '#' (literal array) in ndef (?)
Ndef(\gen).set(\f,[8,4,1.5])
Ndef(\gen).set(\f,[16,8,4,1.5,1.25])



////////////////////////////////////////
// equalizer band pass, whole range
// divided by number of pulsing filters
////////////////////////////////////////

(
~num = 48;
~speed = 4/[12,18,22,99,0.1];
~sharpness = 0.2;

Ndef(\filtr).fadeTime = 2.0;
Ndef(\filtr,{
	Splay.ar(
	BPF.ar(
			Ndef(\gen).ar + SinOsc.ar((1..10)/100.1,mul:0.01)
			,(1..~num)*(16000/~num)+SinOsc.ar({ExpRand()}!48).range(-40,40),~sharpness,SinOsc.ar({ExpRand()*~speed}!48).exprange(0.001,8)
		)
,0.17,1)}).play;
)