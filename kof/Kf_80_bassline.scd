s.boot;

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;

Ndef(\a,{
	var lfo;
	Splay.ar(
	lfo = SinOsc.kr([0.1,0.2,0.22,0.23]/4.0).range(0,220);

	FreeVerb.ar(
		XFade2.ar(
			LFSaw.ar([55,56,57,58],SinOsc.ar([57,58,59,60]).range(lfo*(-1),lfo)),		SinOsc.ar([55,56,57,58]*1.5,SinOsc.ar([57,58,59,60]).range(lfo*(-1),lfo)),
			SinOsc.kr([0.1,0.23])
		) + SinOsc.ar([55,56,57,220,110,4400])

		*
		Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),SinOsc.kr([0.1,0.11,0.111,0.1111]).range(0.01,1))
		,0.33,1)
)}).play;
)

//////vole vole :)