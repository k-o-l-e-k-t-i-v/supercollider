s.scope(8);
p=ProxySpace.push(s);

(
~y[0]={
	var b, s1, s2, s3,s4,s5, t,d,h,f1,f2,noise,add,fe;

	b=2;
	h=Harmonics.new(4);
	t=Impulse.kr(b*[0.25,0.025]);

	f1=Duty.kr(b*4,0,Dseq([65,75,85,75],inf));
	fe=Decay.kr(t,b*0.5).exprange(0.01,f1*4);

	f2=Duty.kr(b/4,0,
		Dseq([Dseq([660,440,220],2),
			Dseq([660,220,440],2),
	Dseq([880,110,880],2)],inf));

	noise=[BrownNoise.ar(0.1),
		GrayNoise.ar(0.1),
		WhiteNoise.ar(0.051)];
	add=SelectX.ar(Stepper.kr(t,0,max:2),noise);


	s1=SinOsc.ar(f1,add:noise)*LFSaw.ar(b*[0.25,0.125])**4;
	s1=GVerb.ar(DelayN.ar(s1,0.2,0.2),100,2,0,drylevel:0)*0.5+s1;

	s2=SinOsc.ar([f1,f1+2]+fe)*Decay2.kr(t,decayTime:0.25);

	s3=HPF.ar(WhiteNoise.ar(0.2),Decay.kr(Impulse.kr(0.25),0.2).exprange(1,11000));
	s3=s3*Decay.kr(Impulse.kr(0.25),0.25);
	s3=CombN.ar(s3,0.25,0.5,b);
	s3=Pan2.ar(s3,Duty.kr(1/0.25,0,Dseq([-1,1],inf)));
	s3=FreeVerb.ar(s3,room:0.5,damp:0);


	s4=SinOsc.ar(h.decay(1.5)*f2)*Decay2.kr(Impulse.kr(3),decayTime:0.25);
	s4=s4*Decay.kr(Impulse.kr(0.25),decayTime:1);


	Limiter.ar(s1*0.7+s2+s3+(s4*0.2),0.2);

};

~y.play;
)

(
~a[0]={
	var b,s1,s2,t,add;
	b=2;
	t=Impulse.kr(b*[0.3,0.9]);
	add=WhiteNoise.ar(0.051);

	s1=LFSaw.ar(LFSaw.kr([0.25,0.5,0.75,1],[0,1,2,3.14],
		add:LFNoise0.ar(500).range(165,1200))

	).lag(0.02);

	s1=DFM1.ar(s1,400,SinOsc.kr(0.125).range(0.1,0.7),noiselevel:SinOsc.kr(0.125).range(0.003,0.0003));
	s1=s1*Decay.kr(Impulse.kr(0.15!2),b*2);
	s1=FreeVerb.ar(s1,room:2);
	s2=SinOsc.ar([65,67],add:add)*LFSaw.ar([65,67]);
	s2=s2*Decay.kr(t,b);


	// Mix.new([Limiter.ar(s1+s2,0.5)]);

	Splay.ar(s1+s2);



};
~a.play;
// ~a.mold(2);
)
(
~q[0]={
	var b, f1,s1,amp;

	b=1;
	h=Harmonics.new(10);
	f1=Duty.kr(b,0,Dseq([110,120,100,120,84],inf));
	d=Impulse.ar(b*[0.5,0.75,0.125,0.0125]);
/*	amp=SinOsc.kr(0.25).range(0,1);*/

	s1=SinOsc.ar(h.ramp(1.0,1.0)*f1)
	*Decay2.ar(d,decayTime:b);
	// s1=FreeVerb.ar(s1,damp:1,room:0.5);
	s1=Splay.ar(s1,1);



};
~q.play;
)
{SinOsc.ar(55)}.play;
{Splay.ar(SinOsc.ar([66,67,68,69],add:BrownNoise.ar(0.015)))}.play;
{Splay.ar(SinOsc.ar([66,66.5,67,67.5,68,68.5,69],add:BrownNoise.ar(0.015)))}.play;













