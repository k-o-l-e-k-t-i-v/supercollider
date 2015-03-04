(
{

~n=Duty.kr(Dseq([2,4,2,1],inf),0,level:Dseq([44,46,44,88,110,220,66,88,66],inf));
~a={FreeVerb.ar( (SinOsc.ar(~n+(0.2..1.2))+BrownNoise.ar(0.11).clip(0.1,0.3))*Decay2.kr(Impulse.kr(0.25),decayTime:2)
		,SinOsc.kr(2),2,SinOsc.kr(0.25))};
	// ~a=CombN.ar(~a,0.01,0.1,1);
}.play;
)


//this needs 20 sec of listening
(
{
	~n=Duty.kr(Dseq([6,8,4,2],inf),0,level:Dseq([44,46,44,88,110,220,880,660,440],inf));

	~b=CombN.ar(LFSaw.ar((~n+(11,22..44))/(1..5)).lag(0.02)*Decay2.kr(Impulse.kr(4/(4..16)),[0.01,0.1,0.2],SinOsc.kr(0.025).range(3,4)),
		maxdelaytime:SinOsc.kr(0.125).range(0.01,0.2),
		delaytime:SinOsc.kr(0.0125).range(0.01,0.2),
		decaytime:SinOsc.kr(0.0125).range(4,2)
	);
		~b=FreeVerb.ar(CombN.ar(~b,1,1,3),room:2,add:~b);
		~b=Limiter.ar(~b,0.99);

}.play;
)


(
{

	~c=Pan2.ar(CombN.ar(Impulse.ar(0.25),SinOsc.kr(1).range(0.7,0.01),SinOsc.kr(0.25).range(0.2,0.1),3),SinOsc.kr(0.25));
	~c=GVerb.ar(~c,100,damping:1);


}.play;
)

s.scope(2);