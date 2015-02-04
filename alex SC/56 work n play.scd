(
Ndef(\u).fadeTime=2;
Ndef(\u).quant=2;
Ndef(\u,{
	~f=Duty.kr( Dseq([4,2],inf),0, Dseq([1000,200,1000,800,400,],inf));
	~f2=Duty.kr( Dseq([4,2],inf),0, Dseq([100,200,80,90,80,],inf));

	~h=LFSaw.ar([4,6]);
	~m=DelayN.ar(SinOsc.ar(40)*Decay2.kr(Impulse.kr([2,3])),
		maxdelaytime:0.2,
		delaytime:0.1);
	~t=FreeVerb.ar(SinOsc.ar(Sweep.kr(Impulse.kr(10),200).range(40,~f2),[0,pi],0.2)*Decay2.kr(Impulse.kr([1,1.5])),room:1);
	~r=CombN.ar(LFSaw.kr(0.5)*SinOsc.ar(~f/(5).fib,mul:0.1),decaytime:2);
	~s=(~h*~m+~t+~r)*0.5;

}).play;
)

Ndef(\u)).stop;


s.scope(2);