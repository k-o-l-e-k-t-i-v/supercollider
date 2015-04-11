p=ProxySpace.push(s);
(
~u[0]={
	var b,h,s1,s2,t,d,m,f1,f2,len;

	b=2;
	t=Impulse.kr(b*[0.15,0.3,0.6,0.9]);
	f1=[55,180,220,660,820];
	len=[b/[4,8,16,12,10]];
	h=Harmonics.new(20);

	s1=SinOsc.ar(f1.ramp(1.0,1.0)*f1,add:BrownNoise.ar(0.7))*Decay2.kr(t,len);
	s1=FreeVerb.ar(s1,room:1);

	// Mix.fill(8,{s1*0.2});
};
~u.play;
~u.mold(2);
)

(
~y[0]={
	var b, s1, s2, s3, t,d,f1,f2,noise,add,fe;

	b=1;

	t=Impulse.kr(b*[0.3,0.6]);

	f1=Duty.kr(b,0,Dseq([65,60,45,55],inf));
	fe=Decay.kr(t,b*0.02).exprange(0.01,f1);
	noise=[BrownNoise.ar(0.1),
		GrayNoise.ar(0.1),

		WhiteNoise.ar(0.1)];
	add=SelectX.ar(Stepper.kr(t,0,max:2),noise);


	s1=SinOsc.ar(65,add:noise)*LFSaw.ar(b*[0.25,0.75])**4;
	s1=GVerb.ar(s1,50,2,1)*0.5+s1;

	s2=SinOsc.ar([f1,f1+2]+fe)*Decay2.kr(t,decayTime:0.25);

	s3=SinOsc.ar(65,add:BrownNoise.ar(0.3))*LFSaw.ar(45,[0,0.001,0.0002],add:LFSaw.ar(25)
	)+BrownNoise.ar(0.4);

	Limiter.ar(s3,0.2);

};
~y.play;
~y.mold(2);
)

(
~a[0]={
	var b,s1,s2,t,add;
	b=2;
	t=Impulse.kr(b*[0.3,0.6,0.15,1.2]);
	add=WhiteNoise.ar(0.051);

	s1=LFSaw.ar(LFSaw.kr([0.25,0.5,0.75,1],[0,1,2,3.14],
		add:LFNoise0.ar(500).range(165,1200))

	).lag(0.02);

	s1=DFM1.ar(s1,400,SinOsc.kr(0.125).range(0.1,0.7),noiselevel:SinOsc.kr(0.125).range(0.003,0.0003));
	s1=s1*Decay.kr(Impulse.kr(0.15!2),b*2);
	s1=FreeVerb.ar(s1,room:2);
	s2=SinOsc.ar([65,67],add:add)*LFPulse.ar([65,67]);
	s2=s2*Decay.kr(t,b);


	// Mix.new([Limiter.ar(s1+s2,0.5)]);




};
~a.play;
~a.mold(2);
)






















