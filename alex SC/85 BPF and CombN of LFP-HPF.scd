p=ProxySpace.push(s);

(
~d={var s1, b, f, top;
	b=1;
	top=Duty.kr(b,0,Dseq((1..12).invert,inf));

	s1=BPF.ar(GrayNoise.ar(1),LFNoise0.kr(b/(top*(1..4))).range(85,460).round(24),
		rq:	LFNoise0.kr(b/(top*(1..4))).range(0.00001,0.001));
	s1=DFM1.ar(s1,LFNoise0.kr(b/(top*(1..12))).range(88,800).round(8),
		res:LFNoise0.kr(b/(1..10)).range(0.1,0.7),noiselevel:0.00001)+s1;
	s1=s1*6;
	s1=GVerb.ar(s1,revtime:0.2,damping:1,spread:0.1,drylevel:0,taillevel:1)*0.1+s1;

	s1=Limiter.ar(s1,0.1);




};
~d.play;
)




(
~a={var b, top, s1, s2,s3,x;

	b=2;
	x=Duty.kr(b,0,Dseq((8600,8400..200),inf));

	s1=BPF.ar(WhiteNoise.ar(1),LFNoise0.kr(b/(1..35)).range(x,46).round(24),
		rq:	LFNoise0.kr(b/(1..5)).range(0.00001,0.005));
	s1=DFM1.ar(s1,res:LFNoise0.kr(b*[0.25,0.5,1,1.5]).range(0.1,1))+s1;

	s2=CombN.ar(HPF.ar(s1,6000),0.5,0.5,20);

	s3=CombN.ar(LPF.ar(s1,200),0.5,0.5,2);

	Mix.new([s1,s2,s3]);


};
~a.play;
)