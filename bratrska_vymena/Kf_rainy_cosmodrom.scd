
s.boot;
s.scope;


// can explode (?)

(
Ndef(\abc).quant = 2.0;
Ndef(\abc).fadeTime = 2.0;

Ndef(\abc,{
	~t = 2/[1,2,3,5,8];
	Splay.ar(
		AllpassN.ar(

			Normalizer.ar(
				CombN.ar(
					RLPF.ar(
						XFade2.ar(LPF.ar(WhiteNoise.ar(1!4),LFNoise0.ar(2!4).range(200,8800)),SinOsc.ar(LFSaw.ar(~t).range(44,[54.002,54.001])),Decay.ar(Impulse.ar(~t),0.015*~t).range(-0.5,1).squared) * Decay.ar(Impulse.ar(~t),0.25)
						,54) + LFSaw.ar(16)
					,0.15,LFSaw.ar(0.25pi*[1.1,2.2,3.3,4.4]).range(0.0001,0.15).squared,12)

			).softclip * Decay.ar(Impulse.ar(~t*2),0.5) * 2
			,1,0.0133,4).lag(~t/100000.0)
		,SinOsc.ar(0.01).range(0.1,1),1)}).play;
)