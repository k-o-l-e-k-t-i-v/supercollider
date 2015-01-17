
(
Ndef(\feedback).fadeTime = 2.0;
Ndef(\feedback,{

	~f = Ndef(\feedback).ar.range(432/2,4320/(2**(1..8))).lag(SinOsc.ar(1/(1..24)).range(1e-7,4));

	Splay.ar(
		RLPF.ar(
			SinOsc.ar(~f);
			,4320/((1..8)**2))
,0.2,0.75)}).play;
)

//^^ sweet!