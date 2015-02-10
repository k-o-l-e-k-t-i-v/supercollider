(

Ndef(\a).fadeTime=2;
Ndef(\a).quant=2;
Ndef(\a, {

var s1,s2,s3,s4,f,f2,b
	,d;

	b=2;
	d=Duty.kr(b*4,0,Dseq([b,b*2,b*4,b/2],inf));     //length of CombN
	f=Duty.kr(b/2,0,Dseq([64,65,66,62,55,45],inf));

	f2=
	Duty.kr(b,0,Dseq([

		Dseq([84,85,86,82,92],1),
		Dseq([84,95,96,92,92],1),
		Dseq([104,105,126,128,92],2),
		Dseq([84,185,186,182,92],2)],inf));


	s1=SinOsc.ar(Lag.kr([f,f]),mul:0.2)*Decay2.kr(Impulse.kr([b/16,b/8]),0.4,decayTime:b*4);
	s1=FreeVerb.ar(s1,room:2,mul:0.5,add:s1);
	s2=LFSaw.ar(
		Lag.kr([f2*2,Lag.kr(f2*4,b),f*8,f*4,Lag.kr(f*4,b),f2*8],0.4)
		,mul:SinOsc.kr(b/16).range(0,0.9)).lag(0.02);
	s2=CombN.ar(s2,b,0.2,4,mul:0.5)*SinOsc.kr(b/16).range(0,0.5);

	s3=CombN.ar(Impulse.ar(b/8),0.1,0.1,d,mul:0.5); //d is length of CombN
	s3=Pan2.ar(s3,SinOsc.kr(1));


	s4=Impulse.ar([b/8,b/4],[0,0.2,pi]);
	s4=FreeVerb.ar(s4,mix:1,room:4,damp:1,add:s4);






	Mix.ar([s1 /*bass*/,s2 /*saw*/,s3 /*impulse*/,s4 /*free*/]);


}).play;
)

s.scope(6);

