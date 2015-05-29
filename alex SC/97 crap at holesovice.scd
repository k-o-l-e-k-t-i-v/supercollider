(
~o[0]={
	var s1, s2, s3, e1, e2, b, freq, fe, s4;
	b=2;
	freq=Duty.kr(20,0,Dseq([1300,1800,600,900,440,900],inf));
	e1=Decay.kr(Impulse.kr([b/21,b/9,b/3,b/12]),10);
	fe=Decay.kr(Impulse.kr(b/9),0.1).exprange(200,65);

	s1=LFSaw.ar([300,900,1200]).clip(0,0.2)*e1;
	s1=LPF.ar(s1, freq);

	s2=WhiteNoise.ar(1).clip(-0.2,1)*Decay.ar(Impulse.ar([b/3,b/6,b/9]),0.3);

	s3=SinOsc.ar([freq,freq+200, freq-200])*Decay.ar(Impulse.ar(b/9),0.3);
	s3=CombN.ar(s3,0.5,0.5,12);

	s4=SinOsc.ar([fe,fe+2])*Decay.kr(Impulse.kr(b/9),0.5);

	Mix.ar([s1,s2,s3,s4]);

};
~o.play;
~o.fadeTime=8;
~o[30]=\filter-> {arg in; FreeVerb.ar(in,room:2,add:in)};

)





(
~o[0]={
	var s1, s2, s3, e1, e2, b, freq, fe, s4;
	b=4;
	freq=Duty.kr(8,0,Dseq([80,85,195,120],inf));
	e1=Decay.kr(Impulse.kr([b/3,b/3/2,b/6]),0.7);
	fe=Decay.kr(Impulse.kr(b/9),0.1).exprange(400,freq);

	s1=SinOsc.ar([fe,fe+2])+WhiteNoise.ar(0.2).clip(0,0.2);
	s1=s1*e1;

	s2=WhiteNoise.ar([1,2]).clip(-0.2,1)*Decay.ar(Impulse.ar([b/3,b/6,b/9]),0.2);

	s3=SinOsc.ar([freq,freq+200, freq-200])*Decay.ar(Impulse.ar(b/3),0.3);
	s3=CombN.ar(s3,0.5,0.5,12);

	s4=SinOsc.ar([fe,fe+2])*Decay.kr(Impulse.kr(b/9),0.5);

	Mix.ar([s1,s2,s3,s4]);

};
~o.play;
~o.fadeTime=8;
~o[30]=\filter-> {arg in; FreeVerb.ar(in,room:2,damp:1,add:in)};

)
	