(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;
Ndef(\2, {

	var b, m,n,d,r, fenv, e1, e2, e3,e4, f, f2, f3, s1, s2, s3, s4;
	b=3;

	m=Impulse.kr(b*[0.25,0.5,0.75,1].scramble);
	n=Impulse.kr(b*[0.75,0.125]);
	d=Impulse.kr(b*[0.5,0.25]);

	f=Duty.kr(b*2,0,Dseq([45,40,48,40,35,45],inf));
	f2=Duty.kr(b,0,Dseq([4500,8000,6000,5000],inf));
	f3=Duty.kr(b,0,Dseq([[48,52,55],[64,74,69],[59,62,67],[59,62,67]].midicps,inf));

	fenv=Decay.kr(m,0.1).exprange(1,f*8);

	e1=Decay2.kr(m,decayTime:TExpRand.kr(0.25,1.25,m));
	e2=Decay2.kr(m,decayTime:TExpRand.kr(0.2,0.3,m));
	e3=Decay2.kr(d,b/2);

	s1=SinOsc.ar(f+fenv)*e1;
	s1=Limiter.ar(s1,0.7);
	s1=Splay.ar(s1,1);

	s2=HPF.ar(GrayNoise.ar.clip(0.7,1),f2)*e2;
	s2=FreeVerb.ar(s2,room:SinOsc.kr(0.25).range(0.5,1.2),damp:1,mul:2,add:s2);
	s2=Splay.ar(s2,0.2);

	s3=SinOsc.ar([f3,f3+2])*e3;
	s3=CombN.ar(s3,b*2,b/4,b*2);


	s4=LPF.ar(GrayNoise.ar,200)*e2;
	s4=FreeVerb.ar(s4,mix:0.3,room:0.7,damp:1);


	Mix.new([s1,s2]);


}).play;
)
