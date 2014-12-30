
(
Ndef(\datacom,{

	~s = 8;
	~bf = CombN.ar(Pulse.ar(4/[1,2,4,8,16,64]).sqrt*~s.squared,0.25,0.25,8);

	Splay.ar(
		Limiter.ar(
			Mix.fill(~s,{|i| SinOsc.ar(i.squared*~bf.sqrt + (44) + SinOsc.ar([4,5,6,7],mul:4) ) * SinOsc.ar(1/i)})
		)
	,1,0.5)
}).play;
)