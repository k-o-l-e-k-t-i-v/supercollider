s.boot;

(
Ndef(\noisOsc).quant = 2.0;
Ndef(\noisOsc).fadeTime = 2.0;

Ndef(\noisOsc,{
	~t = 8;
	Splay.ar(
		LFPar.ar([999,999.1]/4pi,mul:0.5).distort + LPF.ar(BrownNoise.ar(0.12!2),220+SinOsc.ar(5.5).range(-55,550))
,1,0.5)}).play;


Ndef(\noisOsc)[1] = \filter -> {|in| Vibrato.ar(in,~t-1,[1,7/4],0.14,0,0.1,0.1)};
// Ndef(\noisOsc)[2] = \filter -> {|in| FreeVerb.ar(in,0.533,1,add:in)};
Ndef(\noisOsc)[3] = \filter -> {|in| in * LFSaw.ar(~t)};
Ndef(\noisOsc)[4] = \filter -> {|in| FreeVerb.ar(in,0.333,100,add:in)};
)
