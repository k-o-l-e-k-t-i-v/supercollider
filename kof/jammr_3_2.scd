
s.boot;

(
Ndef(\b).fadeTime = 8.0;
Ndef(\b).quant = 2.0;
Ndef(\b,{Splay.ar(
	AllpassN.ar(
		LPF.ar(
			Vibrato.ar(
				LFSaw.ar(4320*2*[0.5,1.5,1.25,1,2,0.5,0.25] / 1.5 + (SinOsc.ar(1/[11,22,33,44]).range(-2,2)),mul:0.12) * LFSaw.ar(1/4/(2**(1..8))).squared
				,[4,5,6,7],0.2)
			,LFSaw.ar(4/fib(9)).range(432,4320*4))
		,1,2,8).softclip * 0.1 +
	AllpassN.ar(
		RLPF.ar(
			SinOsc.ar([55,54,432*0.5,432*1.25,432*2,432/4,432/pi] * 1.5,mul:1.5/(1..8)) * LFSaw.ar(2/(2**(1..8))).squared
			,LFSaw.ar(8/fib(8)).range(22,4320*2) )
		,1,2,8).softclip
	,0.5,0.75,0.5)}).play;

)


Ndef(\b).stop(60)
