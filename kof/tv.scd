
s.boot;

(
Ndef(\a).quant =2.0;
Ndef(\a).fadeTime = 4;
Ndef(\a,{
	Splay.ar(

		FreeVerb.ar(
			LPF.ar(
				AudioIn.ar([0,1]) * LFSaw.ar(1/4/(2**(1..8))).range(0,1) * 4
				,SinOsc.ar(1/4/(2**(1..8))).range(44,20000))
			,0.33,100)
	)
}).play;
)
Ndef(\a).stop(8);


(
Ndef(\b).quant =2.0;
Ndef(\b,{
	var m;
	m = Duty.kr(1,0,Dseq([1.5,1,0.5],inf)).lag(1/4);
	LFSaw.ar(432!2+(1.00001**(1..32)) * (m)),mul:0.5)
}).play;

Ndef(\b).mold(2);
)
