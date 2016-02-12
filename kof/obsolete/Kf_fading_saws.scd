
(
Ndef(\ring,{
	var f,a,b;
	f = [77,77*2,77*4,77/2,77*2,77*4]*1.25;
	a = LPF.ar(
		LFSaw.ar(f).lag(SinOsc.kr(f/512.1).range(0.00001,0.1))
		,SinOsc.kr(f/1024.13).range(f/2,f*2)) * LFSaw.ar(1/4/[1,2,4,8,16,32,64]).squared.lag(0.002);
	b = HPF.ar(
		LFSaw.ar(f).lag(SinOsc.kr(f/512).range(0.00001,0.1))
		,SinOsc.kr(f/1024.1).range(f/2,f*2)) * LFSaw.ar(1/4/[1,2,4,8,16,32,64]).squared.lag(0.002);
	////
	Splay.ar(
		FreeVerb.ar(
			SelectX.ar(SinOsc.kr(f/2048).range(0,1),[a,b])
			,0.33,2)
)}).play;
)

s.scope;