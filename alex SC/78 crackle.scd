(

Ndef(\4).fadeTime=2;
Ndef(\4).quant=2;
Ndef(\4, {
	var b,t,d,n,s1,s2, s3,f,e1, e2, e3, fenv, fenv2, sus;

	b=2;      //tempo
	sus=0.85; //sustain



	f=Duty.kr(b/2,0,Dseq([45,47,52,46,65],inf));
	t=Impulse.kr(b*[0.5,1,0.25,0.75]);
	d=Impulse.kr(b*[0.5,0.25]);
	n=Impulse.kr(b*[2,1.5,0.5,0.75]);
	fenv=Decay.kr(t,0.5).exprange(1,f*3);
	fenv2=Decay.kr(n,0.4).exprange(0.01,f*100);
	e1=EnvGen.kr(Env([0,1,0.5,0],[sus*0.1,sus*0.5,sus*0.4]),t);
	e2=EnvGen.kr(Env([0,1,0.5,0],[sus*0.1,sus*0.5,sus*0.4]),d);
	e3=EnvGen.kr(Env([0,1,0.5,0],[sus*0.1,sus*0.5,sus*0.4]),n);

/*	s1=LFSaw.ar(f*[2,3,5,8,13,21]).fold(-0.5,0.5).lag(0.002);
	s1=s1-CombN.ar(s1,0.25,0.25,b)*0.3;
	s1=s1-DFM1.ar(s1,f,0.1);*/

	s1=Mix.fill(4,{arg i; SinOsc.ar([f,f+2]+fenv)});
	s1=Limiter.ar(s1,0.7)*e1;

	s2=Crackle.ar(1.988!2).clip(0.2,1);
	s2=LPF.ar(s2,400)*5-1.5;
	s2=DelayN.ar(s2,0.2,0.1)*e2;
	s2=FreeVerb.ar(s2,room:1,damp:0);

	s3=BPF.ar(HPF.ar(WhiteNoise.ar, fenv2),freq:fenv2,rq:Decay.kr(d,sus*0.1).exprange(1,0.1));
	s3=Limiter.ar(s3*e3,1)*e2;
	s3=CombN.ar(s3,0.2,0.2,b/4);



	Mix.new([s1,s2,s3*0.2]);


}).play;
)
Ndef(\1).numChannels;
NodeProxy.defaultNumAudio = 3;