(
Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;
Ndef(\1, {

	~b=4/3;
	~f2=Duty.kr(2,0,[440,880,660,220,440,880,220]);

	~s=SinOsc.ar(64!4,phase:[0,2pi])*Pulse.ar(35+(1..8)).lag(0.002);
	~s=~s*Decay2.kr(Impulse.kr(~b/8),decayTime:4);
	~s=FreeVerb.ar(~s,room:2);

	~t=HPF.ar(WhiteNoise.ar,11000)*Decay.kr(Impulse.kr([~b,~b/2]),0.1);
	~t=CombN.ar(~t,decaytime:0.8);
	~t=FreeVerb.ar(~t,room:2);

	~m=LFSaw.ar([~f2,~f2+110,~f2+220,~f2-110,~f2-220]).lag(0.2)*Decay2.kr(Impulse.kr([~b/8,~b/4,~b/6]),decayTime:6);
	~m=FreeVerb.ar(~m,room:1,add:~m,mul:4);


	Mix.new([~s*0.3,~t*0.2,~m]);

}).play;
)

s.scope(2);


/////envelope as volume
(
Ndef(\3).fadeTime=2;
Ndef(\3).quant=2;
Ndef(\3, {
	var v, e, s , s1, b,f;

	b=2;

	f=Duty.kr(Dseq([b*2,b*4,b*2,b,b*2],inf),0,Dseq([45,47,35,37],inf));
	v=Duty.kr(Dseq([b/2,b],inf),0, Dseq([0,1],inf));
	e=EnvGen.kr(Env([0,0.01,0.05,0.08,0.1,0.09,0],b*[0.1,0.1,0.2,0.2,0.2,0.2,0.1]),gate:v);

	s=LFSaw.ar(f+(1..3)).lag(0.02)*e*5;

}).play;
)

///lag and CombN in duty
(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;
Ndef(\2, {
	var s, b, l1,l2;
	b=4/3;

	l1=Duty.kr(Dseq([0.5,0.2,0.8,0.4,0.1,0.2],inf),0,Dseq([0.02,0.2,0.8,0.2,0.8,1],inf));
	l2=Duty.kr(Dseq([b*4,b*2,b,b*2],inf),0,Dseq([0.02,0.002,0.8,0.2],inf));

	s=Impulse.kr(b*2).lag(l1)*1000*GrayNoise.ar(l2).lag(l2);
	s=CombN.ar(s,0.01,0.01,l1);
	s=Limiter.ar(s,1);

	s=Pan2.ar(s,SinOsc.kr(0.5));


}).play;
)


(
Ndef(\5).fadeTime=2;
Ndef(\5).quant=2;
Ndef(\5, {
	var s,s2, s3, l, e1, e2, e3, f, f2;

	b=2;

	f2=Duty.kr(Dseq([b,b*2,b,b/2],inf),0,Dseq([440,660,550,880,770,880,990],inf));
	l=Duty.kr(Dseq([b*4,b*2,b,b*2],inf),0,Dseq([0.02,0.002,0.08,0.002],inf));

	s=LFSaw.ar(Lag.kr(f2,b)+(1..8)).lag(l);
	e1=Decay2.kr(Impulse.kr(b),b/4,b); ////
	s=CombN.ar(s*e1,b/2,b/2,b*8);
	s=FreeVerb.ar(s,0.5,room:2);

	s2=LFSaw.ar(45+(1..8))+Pulse.ar(35+(10..25)).lag(0.02);
	e2=Decay2.kr(Impulse.kr(b/[2,4]),attackTime:0.2,decayTime:b);  ///
	s2=Limiter.ar(s2*e2,0.9);
	                        //////
	s3=CombN.ar(Impulse.kr(b/[4,2]),0.1,0.01,b);
	s3=s3*SinOsc.ar(f2);
	s3=AllpassN.ar(s3,0.1,0.1,b/2);
	// s3=Limiter.ar(s3,level:0.9);
	// s3=FreeVerb.ar(s3,0.5,2);

	Mix.new([s, s2,s3]);

}).play;
)




(
Ndef(\6).fadeTime=2;
Ndef(\6).quant=2;
Ndef(\6, {
	var s1,s2, s3, l, e1, e2, e3, f, f2,b;

	b=4/3;
	f=Duty.kr(Dseq([b*4,b*2,b,b/2],inf),0,Dseq([44,66,55,77],inf));
	f2=Duty.kr(Dseq([b,b/2,b/4,b/2],inf),0,Dseq([440,660,550,880,770,880,990],inf));


	e1=Decay2.kr(Impulse.kr(b/[8,10]),decayTime:0.1);
	e2=Decay2.kr(Impulse.kr(b/10),0.2,decayTime:b*3);
	e3=Decay2.kr(Impulse.kr(b/[4,2]),0.4,decayTime:b);

	s1=SinOsc.ar(f2*10+(1..5))+Impulse.ar(50)*e1;
	s1=CombN.ar(s1,0.2,0.2,decaytime:b*4);
	s1=FreeVerb.ar(s1,room:2);

	s2=LFSaw.ar([f,f+2]).lag(0.02)+Pulse.ar(35+(15..25));
	s2=s2*e2;

	Mix.new([s1,s2]);


}).play;
)