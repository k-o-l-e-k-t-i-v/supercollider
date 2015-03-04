({
~a={FreeVerb.ar( (SinOsc.ar(45+(0.2..1.2))+BrownNoise.ar(0.11).clip(0.1,0.3))*Decay2.kr(Impulse.kr(0.25),decayTime:2)
		,SinOsc.kr(2),2,SinOsc.kr(0.25))};
	// ~a=CombN.ar(~a,0.01,0.1,1);
}.play;
)

(
{

	WhiteNoise.ar(0.5)+SinOsc.ar([400,100,200,500])}.play;
)


s.scope(2);