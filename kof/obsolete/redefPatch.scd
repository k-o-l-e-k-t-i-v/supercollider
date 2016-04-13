


s.boot;


(
var tempo = 64.0;
var fade = 1.0;
var arr1 = [1/3,1/6,1/12,1/24,1/48];
var arr2 = [1,1/16,1/32,1/64];


Tdef(\tt,{
	var i = 0;
	loop{
		tempo = [1,2,4,0.5,0.25].wrapAt(i)*64;
		i = i + 1;


		Ndef(\a).fadeTime = fade;
		Ndef(\b).fadeTime = fade;
		Ndef(\c).fadeTime = fade;

		Ndef(\sin).fadeTime = fade;


		Ndef(\a,{Splay.ar((Pulse.ar(arr1*tempo) * VarSaw.ar(22000*{ExpRand()}!8)))}).play;
		Ndef(\b,{Splay.ar((Pulse.ar(arr1*tempo) * BPF.ar(WhiteNoise.ar({ExpRand()}!8),SinOsc.kr(1.0).exprange(44,22000))))}).play;
		Ndef(\c,{Splay.ar((Pulse.ar(arr2*tempo) * SinOsc.ar({WhiteNoise.ar(1.0).range(44,77)}!8)))}).play;

		Ndef(\d,{Splay.ar(Pulse.ar(arr1*tempo) * SinOsc.ar(Saw.ar(arr1*tempo).exprange(44,4444*{ExpRand()}!8)))}).play;


		Ndef(\sin,{Splay.ar(SinOsc.ar(({LFNoise0.ar(tempo).exprange(2000,2200)}!10)+1*{ExpRand()}!10),1,0.1)}).play;

		Ndef(\d,{ Splay.ar(BPF.ar(WhiteNoise.ar(SinOsc.kr(10*{TRand.kr(1.0,1.5)}!8).range(0.001,0.5)),SinOsc.kr(1).range(44,22000))) }).play;

		"bang!".postln;
		5.0.wait;
	}
}).play;
)

NdefMixer(s);