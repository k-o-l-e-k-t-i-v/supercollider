s.boot;

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 8.0;
Ndef(\a,{Splay.ar(
	AllpassN.ar(
		//     CombN.ar(
		RLPF.ar(SinOsc.ar(SinOsc.ar(1/4/(1..8)).range(-4,4)+432*(1..12)*((1.0001)**(1..8))/8,mul:1/(1..12)),SinOsc.ar(8/(1..12)).range(22000,44) ) * LFSaw.ar(8/(2**(1..12))).squared
		//       ,MouseX.kr(0.002,1),MouseY.kr(0.002,4),8)
		,0.02*(1..12),4,12)
	,0.2,1)}).play;
)

(
Ndef(\b).quant = 2.0;
Ndef(\b).fadeTime = 2.0;
Ndef(\b,{
	Splay.ar(
		RHPF.ar(
			PinkNoise.ar(0.14!4) * Decay.ar(Impulse.ar(8.1/(1..8)),{ExpRand(0.2,1)}!4)
			,SinOsc.ar(8/(1..8)).range(44,18888))
		,0.2+SinOsc.ar(1/2/[4,5,6,7]).range(0.001,0.5),1)
}).play;
)

(
Ndef(\c).quant = 2.0;
Ndef(\c).fadeTime = 8.0;
Ndef(\c,{Splay.ar(
	AllpassN.ar(
		CombN.ar(
			RLPF.ar(WhiteNoise.ar(0.1!4),SinOsc.ar((1..8)).range(44,12000)) * LFPulse.ar(8/(2**(1..12))).squared
			,MouseX.kr(0.002,1),MouseY.kr(0.002,4),8)
		,0.02*(1..12),4,12)
	,0.5,0.12)}).play;
)


Ndef(\a).stop(30)
Ndef(\b).stop(30)
Ndef(\c).stop(30)

