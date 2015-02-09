(
Ndef(\h).fadeTime=2;
Ndef(\h).quant=2;
Ndef(\h, {

	var s1,s2,s3,ef,e1,e12,e2,e3,f,f2, b;

	b=Duty.kr(Dseq([16,4],inf),0,Dseq([1,2],inf));
	t=Duty.kr(b*4,0,Dseq([1,0],inf));            //trigger for envelope ***
	f=Duty.kr(b*4,0,Dseq([24,22,18,28],inf));
	f2=Duty.kr(b*8,0,Dseq([600,400,440,300],inf));

	ef=Decay.kr(Impulse.kr([b,b*2]),b*0.05).range(f*5,f);  //env for freq
	e1=Decay2.kr(Impulse.kr([b,b*2]),decayTime:b/2);
	e12=Decay2.kr(Impulse.kr([b,b*2]/4),decayTime:b);

	e2=EnvGen.kr(Env.asr(b*2,1,b/4),t);
	e3=Decay2.kr(Impulse.kr(b/2),decayTime:b*2);


	s1=(Mix.fill(5,{SinOsc.ar([ef,ef])})*e1)*e12;
	s1=Limiter.ar(s1,0.1);
	s1=GVerb.ar(s1,roomsize:100,damping:1,inputbw:1,revtime:4,add:s1);

	s2=GrayNoise.ar(0.2).clip(0,0.3).lag(0.012);
	s2=s2+LFSaw.ar(f2,mul:0.1).lag(0.02);
	s2=Pan2.ar(s2*e2,SinOsc.kr(b/4));
	// s2=AllpassN.ar(s2,decaytime:0.2);

	s3=Impulse.ar(b*4)+Impulse.ar(b*4,[0.2,0.21]);
	s3=DelayN.ar(s3,0.5,delaytime:0.4);
	s3=s3*e3;

	Mix.new([s1,s2*0.5,s3]);

}).play;
)


s.scope(2);


///meh
(
Ndef(\4).fadeTime=2;
Ndef(\4).quant=2;
Ndef(\4, {

var s1,s2,s3,f,f2,b,e3,t;

	b=2;
	f=Duty.kr(b*4,0,Dseq([44,45,46,42],inf));
	e3=Decay2.kr(Impulse.kr([b*2,b]),decayTime:b);

	s1=Impulse.ar([b,b/2],[0,0.2,pi]);
	s1=GVerb.ar(s1,100,add:s1);
	s2=GVerb.ar(LFSaw.ar(Lag.kr(f+[1,2,3],b/10)).lag(0.2),100,2);

	s3=LFPulse.ar([b,b*2],mul:0.2);
	// s3=s3*e3;
	Mix.new([s1,s2,s3]);

}).play;
)




(
Ndef(\8).fadeTime=2;
Ndef(\8).quant=2;
Ndef(\8, {
	var s1,s2,s3,f,f2,b,e1,t,m;

	b=2;

	f=Duty.kr(b*4,0,Dseq([44,45,65,54],inf));
	f2=Duty.kr(b/8,0,Dseq([
		Dseq([940,850,650,740,440,880],1),
		Dseq([940,650,850,740,440,880],1),
		Dseq([940,850,650,740,440,440],2),
		Dseq([840,850,650,740,440,440],2)
	],inf));
	m=Duty.kr(b*8,0,Dseq([1,2,1.5],inf));


	s2=LFSaw.ar([b/4,b/8],mul:0.2)*SinOsc.ar(f,mul:0.2);
	s3=Saw.ar(Lag.kr(f2*m+(0.1..1.1),b/4)).lag(0.002)*Formant.ar(f2*2,bwfreq:400).lag(0.02);
	s3=DelayN.ar(s3,b*2);
	s3=FreeVerb.ar(s3,room:10);


	Mix.new([s2,s3]);

}).play;
)



/////////////////////////////THIS IS IT

(
Ndef(\8).fadeTime=2;
Ndef(\8).quant=2;
Ndef(\8, {
	var s1,s2,s3,f,f2,b,b2,e1,e2,e3,t;

	b=4;
	b2=Duty.kr(b*2,0,Dseq([[b/2,b/4],[b,b/2],[b,b]],inf));

	t=Duty.kr(b,0,Dseq([1,0],inf));
    e1=EnvGen.kr(Env.asr(b*2,1,b/4),t);
	e2=EnvGen.kr(Env.asr(b/10,1,b/4),t);
	e3=Decay.kr(Impulse.kr(b2),decayTime:0.3);


	f=Duty.kr(b*4,0,Dseq([44,45,65,54],inf));


	s1=GrayNoise.ar(0.8).clip(0.7,0.9).lag(0.002);
	s1=s1+Impulse.ar(f);
	s1=s1*e1;
	s1=Pan2.ar(s1,SinOsc.kr(b/4));


	s2=Mix.fill(4,{SinOsc.ar(f+(0.1..0.5),add:-0.2)});
	s2=s2*e2;
	s2=Limiter.ar(s2,0.4);


	s3=HPF.ar(WhiteNoise.ar(2),11000)*e3;


	Mix.new([s1,s2,e3]);


}).play;
)






{HPF.ar(WhiteNoise.ar,11000)*Decay.kr(Impulse.kr([4/2,4]),0.01)}.play;





