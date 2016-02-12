

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;
t = Tuning.harmonic;
Ndef(\a,{
	var t,p,s;
	t = t.cents.at([1,2,7,11]) / 4pi;
	p = 4/[1,2,3,5];
	s = Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1,1.5,1.25,1.125,1,2,4]);
	Splay.ar(
		FreeVerb.ar(
			AllpassC.ar(

				CompanderD.ar(
					MoogFF.ar(
						OnePole.ar(
							LFSaw.ar(t*s,OnePole.ar(SinOsc.ar(t*s.lag(1)/8),SinOsc.ar(1/16/[1,2,4,8]).range(0.1,0.9)).range(0,8pi) )
							,0.2) * Decay.ar(Impulse.ar(p),2)
						,t*s,2,0,2)
					,0.5,1,1.2) +

				OnePole.ar((WhiteNoise.ar(0.1!2) * Decay.ar(Impulse.ar(4/[1/2,1,2,4]),0.5)),SinOsc.kr(1/32).range(0.1,0.9) )+
				(SinOsc.ar([66,67.1],LFSaw.kr(4/[1,2,8,16]).exprange(0.001,pi)) * Decay.ar(Impulse.ar(4/[1,2]),0.5) )
				,0.1333,0.0333,0.2)
			,0.1,2)
)}).play;
)
