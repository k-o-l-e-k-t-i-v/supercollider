p=ProxySpace.push(s);

(
~w={
	var b,t,f,fenv,s1,s2,e1,e2;

	b=2;
	t=Impulse.kr([b/4,b/6]);
	f=Duty.kr(b,0,Dseq([65,45,50],inf));
	fenv=Decay.kr(t,b*0.4).exprange(1,f*4);
	e1=Decay2.kr(t,decayTime:b*0.2);
	e2=Decay2.kr(t,decayTime:b*2);

	s1=BPF.ar(BrownNoise.ar(0.5)/*+WhiteNoise.ar(0.02)*/,f+fenv,0.11);
	s1=s1*LFSaw.kr([f+20,f+20]).lag(0.02);
	s1=s1*e1;
	s2=SinOsc.ar([f,f+2],[0,pi])*BrownNoise.ar(0.1);
	// s2=DelayC.ar(s2,0.2,0.2);
	s2=s2*e2;
	// s2=GVerb.ar(s2,50,2,damping:0.1,drylevel:1);



	Mix.new([s1+s2]);


};
~w.play;
)

(
~b={
	var b,f,f2,fenv,frq,frq2,t,m,d,s1,s2,s3,e1,e2,e3;
	b=1;
	f=Duty.kr(b,0,Dseq(45*[1,1.25,1.5,0.75,2],inf));
	f2=Duty.kr(b/2,0,Dseq(640*[2,1.25,1.5,0.75,2],inf));

	t=Impulse.kr(b*[0.25,1,2,1.5]);
	m=Impulse.kr(b*[0.25,0.125]);
	d=Impulse.kr(b*[0.3,0.6,0.9]);

	fenv=Decay.kr(t,b*0.2).exprange(0.1,f*4);
	frq=Decay.kr(t,b*0.4).exprange(0.1,4);
	frq2=Decay.kr(d,b*0.4).exprange(0.1,1);

	e1=Decay2.kr(t,decayTime:b);
	e2=Decay2.kr(m,decayTime:b*2);
	e3=Decay2.kr(d,decayTime:b*0.2);


	s1=BPF.ar(BrownNoise.ar(1),f+fenv,frq)*e1;
	s2=LFPar.ar(45*[1,1.2])*Pulse.ar([45/2,45/4]);
	s2=GVerb.ar(s2,roomsize:2,revtime:0.4,damping:0,drylevel:0,earlyreflevel:1,taillevel:4);
	s2=Limiter.ar(s2*e2,0.5);

	s3=SinOsc.ar([f2,f2+2],mul:0.002)+BPF.ar(PinkNoise.ar(0.2),TExpRand.kr(f2,f2*4),frq2)*10;
	s3=CombN.ar(s3*e3,b,b/5,b);


	Mix.new([s1,s2,s3]);
};
~b.play;
)

(

~f={
	var b,f,f2,fenv,frq,frq2,t,m,d,s1,s2,s3,e1,e2,e3;
	b=4;











};
~f.play;
)









