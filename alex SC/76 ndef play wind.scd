(

Ndef(\2, {

	var s1, s2, s3, e, f, f2, b, d;

	b=2;

	f=Duty.kr(b*2,0,Dseq([6000,9000,11000,7000,4000],inf));
	f2=Duty.kr(b*4,0,Dseq([45,65,85,45,55,65],inf));
	d=Duty.kr(b*4,0,Dseq([b*2,b/2,b,],inf));

	//s1
	s1=SinOsc.ar(Pulse.ar([b/2,b,b/3]).exprange(35,f2));
	s1=CombN.ar(s1,0.4,0.4,b/2);
	s1=s1*SinOsc.kr(b/40).range(0.2,0.7);
	s1=Limiter.ar(s1,0.8);

	//s2
	s2=GrayNoise.ar(LFSaw.ar(0.5).range(0,0.5));
	s2=BPF.ar(Clip.ar(s2,-0.5,0.5),freq:SinOsc.kr(b/10).range(100,220),
		rq:SinOsc.kr(b/20).range(0.1,0.001));
	s2=FreeVerb.ar(s2,SinOsc.kr(b/10).range(0.1,0.7),room:3,damp:0,add:s2);
	s2=s2*SinOsc.kr(b/30).range(0,0.7);
	s2=Splay.ar(s2,0.2);


	//s3
	s3=Pulse.ar(Decay.kr(Impulse.kr(b*5),b/10).range(f,f+100));
	s3=s3*Decay2.ar(Impulse.ar([b/16,b/32]),decayTime:0.05);
	s3=CombN.ar(s3,maxdelaytime:0.2,delaytime:0.2,decaytime:d);
	s3=FreeVerb.ar(s3,room:1,add:s3);
	s3=s3*SinOsc.kr(b/50).range(0,0.4);


	Mix.new([s1*0.8,s2*0.5,s3*0.4]);

}).play;

)

(

Ndef(\6, {

	var s1, s2, b, f, d;

	b=4;
	f=Duty.kr(b,0, Dseq([
		Dseq([[59,62,67],[59,62,67],[72,76,79],[64,74,69],[59,62,67]].midicps,3),
		Dseq([[48,52,55],[64,74,69],[59,62,67],[59,62,67]].midicps,2),
	],inf));

	d=Duty.kr(b,0,Dseq([b/2,b,b/4],inf));

	s1=LFSaw.ar([f,f+2]*(1..4));
	s1=Lag.ar(s1,0.5);
	s1=s1*Decay2.kr(Impulse.kr(b/[2,4]),0.5,b);
	s1=CombN.ar(s1,b/2,b/2,d,add:s1);
	s1=s1*SinOsc.kr(b/10).range(1,2);

	s2=WhiteNoise.ar(1).clip(0.7,1)-0.5;
	s2=s2*Decay2.kr(Impulse.kr(b/12),attackTime:0.4,decayTime:0.2);
	s2=HPF.ar(s2,11000);
	s2=Pan2.ar(s2,pos:Duty.kr(b/4,0,Drand([-1,0,1],inf)));
	s2=FreeVerb.ar(s2,room:1,damp:0);

	Mix.new([s1*2, s2*2]);

}).play;
)


















