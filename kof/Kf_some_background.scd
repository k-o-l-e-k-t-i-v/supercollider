

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 4.0;
Ndef(\a,{
	var f;
	Splay.ar(
	f = [1,1.25,2,1.125] * 432 * [1.25,1.5,0.25,1.5,0.5] / Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8])),[1,2,4,2,1.5,1.25,1,2,4].scramble*pi);
	LFSaw.ar([f,f+0.1]) * LFSaw.ar(1/16/[1,2,3,5,8],mul:0.5).squared * Decay.ar(Impulse.ar(8/[1,2,3,8,5]),0.75)

)}).play;
Ndef(\a)[1] = \filter -> {|in| AllpassC.ar(Resonz.ar(Vibrato.ar(in,[4,5,6,7],0.15),f,SinOsc.ar(1/16/[1,2,4,8,16]).range(0.02,3)),0.2,0.133,1)};
)

(
Ndef(\b).quant = 2.0;
Ndef(\b).fadeTime = 4.0;
Ndef(\b,{
	var f;
	Splay.ar(
	f = [1,1.25,2,1.125] * 432 * [1.25,1.5,0.25,1.5,0.5] / Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8])),[1,2,4,2,1.5,1.25,1,2,4]*1.5pi);
	LFSaw.ar([f,f+0.1]) * LFSaw.ar(1/16/[1,2,3,5,8],mul:0.5).squared * Decay.ar(Impulse.ar(4/[1,2,3,8,5]),0.75)

)}).play;
Ndef(\b)[1] = \filter -> {|in| AllpassC.ar(Resonz.ar(Vibrato.ar(in,[4,5,6,7],0.15),f,SinOsc.ar(1/8/[1,2,4,8,16]).range(0.02,3)),0.2,0.133,1)};
)

(
Ndef(\c).quant = 2.0;
Ndef(\c).fadeTime = 4.0;
Ndef(\c,{
	var f;
	Splay.ar(
	f = [1,1.25,2,1.125] * 432 * [1.25,1.5,0.25,1.5,0.5] * Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8])),[1,2,4,2,1.5,1.25,1,2,4]*pi);
	SinOsc.ar([f,f+0.1]) * LFSaw.ar(1/16/[1,2,3,5,8],mul:0.25).squared * Decay.ar(Impulse.ar(16/[1,2,3,8,5]),0.15)

)}).play;
Ndef(\c)[1] = \filter -> {|in| AllpassC.ar(Resonz.ar(Vibrato.ar(in,[4,5,6,7],0.15),f,SinOsc.ar(1/32/[1,2,4,8,16]).range(0.02,3)),0.2,0.133,1)};
)