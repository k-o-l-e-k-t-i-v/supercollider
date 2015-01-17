(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
	~base = [60,60.13] * LFNoise0.ar(1/8).range(0.75,3).round(0.25);
	~saws = LFSaw.ar(1/8/[1,2,3,5,8,13,21,34,55,89]).squared;
	Splay.ar(
		~saws * LFSaw.ar(~base).lag(SinOsc.kr([11,11.1]).exprange(0.00001,0.01))
)}).play;

Ndef(\a)[1] = \filter -> {|in| Pan2.ar(in,SinOsc.ar(0.1).range(-0.5,0.5))};
Ndef(\a)[2] = \filter -> {|in| MoogFF.ar(in,SinOsc.kr(1/[11,22/1.001,44,88,120]).range(60,11000))};
Ndef(\a)[3] = \filter -> {|in| GVerb.ar(in,100,SinOsc.kr(0.0011).range(2,80),SinOsc.kr(0.111).range(0.25,0.75),SinOsc.kr(0.1111).range(0.25,0.75),mul:0.75,add:in)};
)


// filter kill
Ndef(\a)[1] = nil;
Ndef(\a)[2] = nil;
Ndef(\a)[3] = nil;

// gentle stop
Ndef(\a).stop(10);

//hard stop >> free CPU
Ndef(\a).clear;

