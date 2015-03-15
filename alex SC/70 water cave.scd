(
Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;
Ndef(\1,{

	~f=Duty.kr(3,0,Dseq([330,770,660,550,440,330,220],inf));
	~r=AllpassN.ar(SinOsc.ar([Lag.kr(~f,1.5)+(10,20..110)].lag(0.02)
		,[XLine.kr(1,2,1),2pi,pi]).wrap(-0.3,-0.1),0.1,0.1,1)+0.2;


	~m=BPF.ar(BrownNoise.ar(0.4),freq:LFNoise0.kr(50).range(85,4000),rq:SinOsc.kr(200).range(0.1,0.001));
	~m=DFM1.ar(~m,SinOsc.kr(2).range(85,120),0.1);
	~m=GVerb.ar(~m,roomsize:50);



	Mix.new([~m*15]);


}).play;
)

s.scope(6);

