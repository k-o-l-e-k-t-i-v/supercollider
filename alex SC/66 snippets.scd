({
~a={FreeVerb.ar( (SinOsc.ar(45+(0.2..1.2))+BrownNoise.ar(0.11).clip(0.1,0.3))*Decay2.kr(Impulse.kr(0.25),decayTime:2)
		,SinOsc.kr(2),2,SinOsc.kr(0.25))};
	// ~a=CombN.ar(~a,0.01,0.1,1);
}.play;
)


(
{
	~b=CombN.ar(LFSaw.ar([880,660,990,440,110,220,55,65]/(1..5)).lag(0.02)*Decay2.kr(Impulse.kr(4/(4..16)),[0.01,0.1,0.2],SinOsc.kr(0.025).range(3,4)),
		maxdelaytime:SinOsc.kr(0.125).range(0.01,0.2),
		delaytime:SinOsc.kr(0.0125).range(0.01,0.2),
		decaytime:SinOsc.kr(0.0125).range(4,2)
	);
	~b=FreeVerb.ar(CombN.ar(~b,1,1,3),room:1,add:~b);

}.play;
)


(
{





}).play;
)

s.scope(2);
