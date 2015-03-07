///clip party is not a party

(
Ndef(\e).fadeTime=2;
Ndef(\e).quant=2;
Ndef(\e, {
	var s1,s2,s3,s4,s5,f, lag;

	f=Duty.kr(Dseq([4,6,4,2,4],inf),0,Dseq([45,47,48,45,48],inf));
	lag=Duty.kr(Dseq([4,6,4,2,4],inf),0,Dseq([0.001,0,0.0002,0.002],inf));


	s1=Pulse.ar(LFNoise0.kr(1/[1,3,5,8]).range(250.550).round(50),SinOsc.kr(0.25).range(0.4,0.8)).clip(0.1,0.2).lag(lag)-0.3;
	s1=CombN.ar(s1,0.1,0.1,0.2);

	s2=LFSaw.ar([f,f+2],[0,pi,2*pi],SinOsc.kr(0.25).range(2,5)).clip(0.1,0.4).lag(0.002)-SinOsc.kr(0.25).range(0.2,0.3);
	s3=CombN.ar(s2,0.01,0.01,0.2);

	s4=Limiter.ar(CombN.ar(s2,0.001,0.001,SinOsc.kr(0.25).range(0.2,0.8)),0.1);

	s5=FreeVerb2.ar(s2,s4*0.2,room:1);

	//play from s1 to s5, either

	Mix.new([s1]);


}).play;
)
Ndef(\e).stop;
s.scope(2);



///filters for voice 001
(
Ndef(\l).fadeTime=0.2;
Ndef(\l, {

	~s=AudioIn.ar(1);

	~s1=CombN.ar(~s*SinOsc.ar(0.25),0.01,0.01,4);
	~s1=GVerb.ar(~s1,1,damping:0);

	~s2=LPF.ar(~s,1800);
	~s2=~s*SinOsc.ar(500*(2..10));

	~s3=HPF.ar(CombN.ar(~s,0.2,0.002,0.5),100)+GrayNoise.ar(0.001)*Decay2.kr(Dust.kr(4),decayTime:1);


	//play from ~s1 to ~s3

	Mix.new([~s1]);

	}
).play;
)