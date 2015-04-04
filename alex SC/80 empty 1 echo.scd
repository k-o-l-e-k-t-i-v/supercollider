p=ProxySpace.push(s);



(
~o={
	var s1,s2,s3,s4,b,t,f,fenv,env,env2;

	b=3;
	t=Impulse.kr([b/10,b/5]);
	f=Duty.kr(0.02,0,Dseq([[116,257,631,397,771]],inf));
	fenv=EnvGen.kr(Env.new([8000,f,0,f,0],[b*0.01,b*0.2,b*0.2,b*0.1],\welch),t);
	env=Decay2.kr(t,b*0.1,b*0.7);
	env2=Decay2.kr(t,b*0.1,b*0.3);

	//freq
	s1=LFSaw.ar([f+fenv,f]).clip(-0.8,0.5)+(BrownNoise.ar(0.121)*SinOsc.ar(40));
	s1=BPF.ar(s1,f,Decay.kr(t,b*0.8).exprange(1,0.1));
	s1=s1*env;

	//bum begining
	s2=BPF.ar(BrownNoise.ar(0.5),45,Decay.kr(t,b*0.8).exprange(1,0.1))+BrownNoise.ar(0.1)*env2*0.2;

	//last part also
	s3=s2+GVerb.ar(s2,roomsize:2,revtime:0.7,damping:0.1,drylevel:0.0,taillevel:14);


	//filter the reverb
    s4=BPF.ar(s2,f,1,20);

	Limiter.ar(Mix.new([s2*0.051,(s1+s3+s4)*20]),0.3);


};
~o.play;
)