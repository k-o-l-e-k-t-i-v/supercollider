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

~w[0]={
	var fenv,b,f,f2,e1,e2,e3,e4,s1,s2,s3,s4,t,d,m;

	b=6;
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
