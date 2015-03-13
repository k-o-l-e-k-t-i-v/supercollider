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


(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;
Ndef(\2, {
	var b, f, f2, s1,s2,s3, e1,e2,e3;

	b=4/3;

	f=Duty.kr(Dseq([b,b*2,b,b*4],inf),0,Dseq([45,46,47,45,57,59],inf));
	f2=Duty.kr(Dseq([b*2,b*4,b,b*4],inf),0,Dseq([11000,14000,10000,14500,12000,1000],inf));

	// f2=

	e1=Decay2.kr(Impulse.kr([b/4,b/8]),decayTime:b);
	e2=Decay2.kr(Impulse.kr([b,b/3]),decayTime:b/20);



	s1=LFSaw.ar([f,Lag.kr(f,b/4),f+2,f+4,Lag.kr(f+2,b/5)],[0,pi,2*pi]).clip(-0.6,0.6).lag(0.008).distort;
	s1=CombN.ar(s1*e1,maxdelaytime:b/2,delaytime:b/4,decaytime:b*2);
	s1=FreeVerb.ar(s1*e1,0.5,2,add:s1);

	s2=HPF.ar(WhiteNoise.ar(0.7),e2.range(f2,f2-400))*e2;
	s2=CombN.ar(s2,maxdelaytime:0.4,delaytime:0.2,decaytime:b/2);
	s2=FreeVerb.ar(s2,room:0.5);



	Mix.new([s1,s2]);



}).play;
)



(
Ndef(\5).fadeTime=2;
Ndef(\5).quant=2;
Ndef(\5, {
	var b, f, f2, s1,s2,s3,s5, s4, e1,e2,e3,e4, len;
	b=4/3;

	f=Duty.kr(Dseq([b,b*2,b,b*4],inf),0,Dseq([45,46,47,45,57,59],inf));
	f2=Duty.kr(b,0,Dseq(110*[2,3,1,2,1,1,2].scramble,inf));

	len=Duty.kr(b/4,0,Dseq([b/2,b,b*2],inf));


	e2=Decay2.kr(Impulse.kr([b,b/2]),attackTime:0.4,decayTime:b*3);
	e3=Decay2.kr(Impulse.kr([b*2,b]),decayTime:0.2);
	e4=Decay2.kr(Impulse.kr([b/2,b/4]),decayTime:0.02);

	s1=BPF.ar(BrownNoise.ar,freq:SinOsc.kr(100).range(f2,f2*2),rq:SinOsc.kr(50).range(0.1,0.001));
	s1=DFM1.ar(s1,85,0.5,1);
	s1=FreeVerb.ar(s1,SinOsc.kr(0.5).range(0.3,0.8),1);
	s1=s1*SinOsc.kr(b/20).range(0.01,2);


	s2=LFSaw.ar([f,f+2,f+4]).fold(-0.4,0.2);
	s2=CombN.ar(s2,0.2,0.2,b).lag(0.002);
	s2=s2*e2;

	s3=SinOsc.ar(f2+f*(f/10),mul:0.2)*e3;
	s3=CombN.ar(s3,0.2,0.2,decaytime:b*2);

	s4=HPF.ar(WhiteNoise.ar(0.5),11000)*e4;
	s4=CombN.ar(s4,0.2,0.2,len);
	s4=FreeVerb.ar(s4,mix:SinOsc.kr(0.25).range(0.2,0.8),room:2);

	s5=CombN.ar(Impulse.ar(b).lag(0.02),0.081,0.081,len);
	s5=Pan2.ar(s5,SinOsc.kr(1),15);

	Mix.ar([s4,s5]);

}).play;
)
















