(

Ndef(\2, {

	var s1, s2, s3, e, f, f2, b, d;

	b=2;

	f=Duty.kr(b*2,0,Dseq([6000,9000,11000,7000,4000],inf));
	f2=Duty.kr(b*4,0,Dseq([45,65,85,45,55,65],inf));
	d=Duty.kr(b*4,0,Dseq([b*2,b/2,b,],inf));


	//s1
	s1=SinOsc.ar(Pulse.ar([b/4,b/2,b/6]).exprange(40,f2));
	s1=CombN.ar(s1,0.4,0.4,b/2);
	s1=s1*SinOsc.kr(b/40).range(0,0.5);

	//s2
	s2=GrayNoise.ar(LFSaw.ar(0.5).range(0,0.5));
	s2=BPF.ar(Clip.ar(s2,-0.5,0.5),freq:SinOsc.kr(b/10).range(200,440),
		rq:SinOsc.kr(b/20).range(0.1,0.001));
	s2=FreeVerb.ar(s2,SinOsc.kr(b/10).range(0.1,0.7),room:3,add:s2);
	s2=s2*SinOsc.kr(b/60).range(0,0.5);


	//s3
	s3=Pulse.ar(Decay.kr(Impulse.kr(b*5),b/10).range(f,f+100));
	s3=s3*Decay2.ar(Impulse.ar([b/8,b/4]),decayTime:0.05);
	s3=CombN.ar(s3,maxdelaytime:0.2,delaytime:0.2,decaytime:d);
	s3=FreeVerb.ar(s3,room:1,add:s3);
	s3=s3*SinOsc.kr(b/80).range(0,0.8);


	Mix.new([s1*0.7,s2,s3]);

}).play;



Ndef(\6, {

	var s1, s2, b, f;

	b=4;
	f=Duty.kr(b,0, Dseq([61,63,66,56,54,44,42].midicps,inf));

	s1=SinOsc.ar([f,f+2]*(1..4));
	s1=s1*Decay2.kr(Impulse.kr(b/[2,4]),0.5,b);
	s1=s1*Phasor.kr(Impulse.kr(b/(8..12)),0.0001);
	s1=CombN.ar(s1,b/2,b/2,b,add:s1);
	s1=s1*SinOsc.kr(b/10).range(0.3,0.8);

	s2=WhiteNoise.ar(1).clip(0.7,1)-0.5;
	s2=s2*Decay2.kr(Impulse.kr(b/12),attackTime:0.4,decayTime:0.2);
	s2=HPF.ar(s2,11000);
	s2=Pan2.ar(s2,pos:Duty.kr(b/4,0,Drand([-1,0,1],inf)));
	s2=FreeVerb.ar(s2,room:1,damp:0);

	Mix.new([s1*0.5,s2*2]);

}).play;
)



















