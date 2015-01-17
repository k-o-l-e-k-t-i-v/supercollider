
(
Ndef(\pila).fadeTime = 2.0;
Ndef(\pila).quant = 2.0;

Ndef(\pila,{Splay.ar(
	RLPF.ar(
		LFSaw.ar(LFSaw.ar(22.1).exprange(22.0,17777),mul:0.75) * LFSaw.ar(11).squared * LFSaw.ar(8/[8,5,3,1]).lag(0.001+SinOsc.kr(0.01).range(0,0.01))
		,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1))
)}).play;

Ndef(\pila)[1] = \filter -> {|in| GVerb.ar(in,100,mul:0.15,add:in)};
)