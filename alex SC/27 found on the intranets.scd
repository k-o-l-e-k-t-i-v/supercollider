s.scope(2);


//found on the intranets

(
{CombN.ar(
            BPF.ar(
		SinOsc.ar(2) * 7.5+Saw.ar([32,33],0.2),freq:2**LFNoise0.kr(4/3,4)*100,
		rq:0.1
).distort,2,2,40)}.play;
)


//variations on random freq and a long decay time in CombN+ BPF


//synth
(
{CombC.ar(
	LPF.ar(
		in:(SinOsc.ar(LFNoise0.kr(0.25).range(220,1000))+VarSaw.ar(LFNoise0.kr(10).range(300,2000),0,0.1,0.5))*Pulse.kr([0.25,0.5],0.2)
		,freq:220)
	,2,2,40)}.play;
)


//synth

(
{CombN.ar(
	BPF.ar(
		in:BrownNoise.ar([0.8,0.8])*Saw.ar(100),
		freq:LFNoise0.kr(Array.fill(3,Impulse.kr(1).range(1,4).round(0.25)),1).range(60,800)+Saw.ar([50,510]).distort,
	rq:0.0001,
	mul:1).distort,
	maxdelaytime:2,
	delaytime:0.5,
	decaytime:LFNoise0.kr(1).range(5,25))}.play;
)



(

Ndef(\comb).fadeTime=4;
Ndef(\comb).quant=2;
Ndef(\comb,{

	~sig=BPF.ar(
		in:WhiteNoise.ar(0.3)*Decay2.kr(Impulse.kr(15),0.01,0.2)+Saw.ar(LFNoise0.kr(2).range(30,65)),
			freq:2**LFNoise0.kr(4/3,4)*LFNoise0.kr(0.25).range(200,300),  //**??
		rq:0.04);
	~sig=CombN.ar(~sig,

	maxdelaytime:2,
	delaytime:2,
	decaytime:40);

	~sig=LPF.ar(~sig, LFNoise0.kr(0.5).range(85,1000));
	~sig=Pan2.ar(~sig, SinOsc.kr(0.25));
}).play;

)


