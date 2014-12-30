s.scope(2);


{VarSaw.ar(20)*Saw.kr([4/3*4,4/3])}.play;

//annoying sawing
(
{Limiter.ar(LPF.ar(CombC.ar(Mix.fill(10,{Phasor.ar(Impulse.ar(4/3),[600,100])}),1,1/[600,100])*VarSaw.kr(45),1000),0.8)}.play;
)


//fuck knows
(
{LPF.ar(Limiter.ar(
	Phasor.ar(Impulse.kr([4/3,5]),
		LFNoise0.kr(Impulse.kr(0.25).range(20,200).round(5)))
	*SinOsc.ar(Sweep.kr(Impulse.kr(2),10).range(200,65))
	,0.8)
	,4000)}.play;
)


