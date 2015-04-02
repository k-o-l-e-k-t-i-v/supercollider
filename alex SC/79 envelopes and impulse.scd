p=ProxySpace.push(s);

(
~d={
	var b, f, t, r, s1, e1;

	b=3;
	t=Impulse.kr([2,5]);
	f=Duty.kr(b,0,Dseq([65,67,62,58,67,58],inf));
	e1=EnvGen.kr(Env.perc(releaseTime:b/2),t);

	s1=[
		LFSaw.ar([f,f+2]).clip(0.1,0.6).lag(0.02)*4,
		FreeVerb.ar(SinOsc.ar([f,f+20])+GrayNoise.ar(1).clip(0.9,1),SinOsc.kr(b*2),0.7),
		PinkNoise.ar*Dust2.ar([TExpRand.kr(20,50,t),5],10).lag(0.2)*20,
	];

	r=Duty.kr(Dseq([0.2,1,Drand([0.25,0.5],1)],inf),0, Dseq([0,1,2],inf));
	s1=Select.ar(r,s1)*e1;
};
~d.play;
)


(
~e={
 var s3,f;

 f=Duty.kr(3,0,Dseq([65,67,62,58,67,58],inf));

 s3=FreeVerb.ar(SinOsc.ar([f,f+20])+GrayNoise.ar(1).clip(0.95,1),SinOsc.kr(0.5),0.5);
 s3=Limiter.ar(s3,1);

};
~e.play;
)

(
~q={
	var s1,e1,s2,e2, b,t,d, w,f,g;

	b=0.25;
	t=Impulse.kr([0.5,0.75,1.25,2,1,4]);
	d=Impulse.kr([0.5,0.25]);
	g=Duty.kr(b/4,0,Dseq([Dseries(1,0.25,5)],inf));
	w=Duty.kr(b/4,0,Dseq([Dseries(b,b/4,10)],inf));
	e1=EnvGen.kr(Env.new([0,1,0],[b/5,b]),t);
	e2=EnvGen.kr(Env.perc(releaseTime:0.2),t);

	// s1=BrownNoise.ar(1).fold(-0.5,0.5).lag(0.8)*10;
	s1=BrownNoise.ar+GrayNoise.ar(0.5);
	s1=BPF.ar(s1,TExpRand.kr(25,85,Impulse.kr(5)),rq:SinOsc.kr(w/10).range(0.001,1));
	// s1=s1+Crackle.ar(1.9,1);
	s1=Limiter.ar(s1,0.1);
	s1=s1*e1;

	s2=HPF.ar(WhiteNoise.ar(SinOsc.kr(b*10)+LFSaw.kr(b/4)+Pulse.kr(b*5)),11000);
	s2=s2*e2*0.5;
	s2=FreeVerb.ar(s2,SinOsc.kr(b/4).range(0.3,1),SinOsc.kr(b/4).range(0.5,1),damp:SinOsc.kr(b/4).range(0,1));


	Mix.new([s1,s2]);

};
~q.play(0,2);

)

(
~a={
	var s1,f,b;
	b=0.5;
	f=Duty.kr(b/4,0,Dseq([Dseries(b,b/4,10)],inf));

	s1=BPF.ar(BrownNoise.ar,TExpRand.kr(425,85,Impulse.kr(f)),rq:SinOsc.kr(f/10).range(0.001,1));

	s1=s1*SinOsc.ar(f);
	s1=Pan2.ar(s1,SinOsc.kr(f));
	s1=FreeVerb.ar(s1,room:1,damp:SinOsc.kr(f*2).range(0,1));

};
~a.play;
)


(

~w[0]={
	var fenv,b,f,f2,e1,e2,e3,e4,s1,s2,s3,s4,t,d,m;

	b=3;
	t=Impulse.kr(b*[0.25,0.75]);
	d=Impulse.kr(b*[1.25,0.75]);
	m=Impulse.kr(b*[0.125,0.125]);

	f=Duty.kr(b,0,Dseq([65,67,62,58,67,58],inf));
	f2=Duty.kr(b/2,0,Dseq([110,440,220,330,660,440,220],inf));
	fenv=Decay.kr(t,0.2).exprange(1,f*3);

	e1=EnvGen.kr(Env.perc(0.2,releaseTime:b/2),t);
	e2=EnvGen.kr(Env.perc(releaseTime:0.1),d);
	e3=EnvGen.kr(Env.adsr(b*0.1,b*0.3,0.7,b*0.6),m);
	e4=EnvGen.kr(Env.adsr(b*0.1,b*0.3,0.7,b*0.6),m);


	s1=SinOsc.ar([f,f+2]+fenv)*e1;
	s2=HPF.ar(WhiteNoise.ar(0.1),9000)*e2;
	s3=FreeVerb.ar(s2,2,0)*e3*300;
	s4=SinOsc.ar([f2*10,f2*12,Lag.kr(f2,0.5),Lag.kr(f2+20,0.2)])*e4;


	Mix.new([Limiter.ar(s1+s2,1),s3]);

};
~w.play;
)

NodeProxy.mold(8);
