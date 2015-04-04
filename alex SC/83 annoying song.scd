p=ProxySpace.push(s);


(

~i={
	var b,t,d,env,s1,s2,env2,f,top ;
	b=1;

	top=Duty.kr(b,0,Dseq([Dseries(1,-0.05,16),Dseries(0.01,0.05,20)],inf));
	f=Duty.kr(b*4,0,Dseq([110,240,600,200,440,400,220],inf));

	t=Impulse.kr(b*[0.25,0.5,0.75,1]);
	d=Impulse.kr(b*[0.25,0.75,1,0.125]);
	env=Decay2.kr(d,decayTime:b*3);
	env2=Decay2.kr(t,decayTime:b/8);

	s1=GrayNoise.ar(1!4)+LFSaw.ar(45*(1..12))
	+SinOsc.ar([f*(1..8),f+400,f+200,f+402,f+200]);
	s1=BPF.ar(s1,185*(1..4),Decay.kr(t,0.02).range(0.0001,top),0.1)*env;
	s1=Limiter.ar(s1,0.4);

	s2=HPF.ar(WhiteNoise.ar(top*(-1)+1),11000)*env2;
	s2=Splay.ar(FreeVerb.ar(s2,room:2,mul:1),1);

	Mix.new([s1,s2]);

};
~i.play;
)
