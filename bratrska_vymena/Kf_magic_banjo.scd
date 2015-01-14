
(
Ndef(\rythm).fadeTime = 4;
Ndef(\rythm).quant = 2;

Ndef(\rythm).mold(16);
Ndef(\rythm,{
	Pulse.ar(4/(1..4),0.01*(1.9**(1..16))).softclip
});
)



(
Ndef(\magick1).quant = 2.0;
Ndef(\magick1).fadeTime = 2.0;
Ndef(\magick1,{

	~s =
	CombL.ar(
		SinOsc.ar(43.2 / 2 * [1,2,4,1.5,0.001] * ( LFTri.ar(432e-7/fib(32) ).squared.range(1,3) ** (1..32)),mul:2/fib(12)) +
		WhiteNoise.ar(0.25*SinOsc.ar(0.01/fib(12)).range(0.01,1)) * Ndef(\rythm).ar
		,1,LFNoise1.ar(1/2/(2**(1..8))).range(2,7).round(2) * 432e-6*(1.1**(1..32)),(8/(2**(1..16))),mul:2/fib(12));

	~sl = CompanderD.ar(RLPF.ar(~s,fib(22)) * LFSaw.ar(1/fib(32)).squared,0.5,1,0.5);
	~sh = CompanderD.ar(RHPF.ar(~s,fib(22)) * LFSaw.ar(1/fib(32,1,1.1)).squared,0.5,1,0.5);


	Splay.ar(
		(~sl + ~sh)
		,0.33,1)}).play;
)
