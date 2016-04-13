
(
Ndef(\inp).quant = 2.0;
Ndef(\inp).fadeTime = 8.0;


Ndef(\inp,{
	var s,s2,s3,f1,f2,sig,sigh,sigm,sigl;
	s3 = Select.kr(Stepper.kr(Impulse.kr(1/4/8/8/[1,2,4,8]),max:3),[1,1.5,4,1]);
	s2 = Select.kr(Stepper.kr(Impulse.kr(1/4/8/[1,2,4,8]),max:3),[1,1.5,2,1]);
	s = Select.kr(Stepper.kr(Impulse.kr(1/8/8/[1,2,4,8]),max:3),[1.5,1.25,1.5,1]);


	f1 = [44,44.1*2,45*3,45*1.25]*(s2*s3*s*pi.sqrt)+LFNoise0.kr(8!4).lag(0.5).range(-2,2);
	f2 = [44,44.1*1.5,45*2,45*1.5]*(s*16/s2*pi.sqrt)+LFNoise0.kr(8!4).lag(0.5).range(-2,2)+LFSaw.ar(11/[1,2,3,5]).range(-5,10000).lag(0.0001);

	f2 = CombN.ar(f2,0.5,0.5,8);
	sig = Pan2.ar(
		AllpassC.ar(
			SinOsc.ar(f1.scramble.lag(16),(f2/102.40).range(-pi,pi),mul:0.233) + LFSaw.ar(f2,mul:0.233).lag(0.00001+SinOsc.ar([0.01,0.03,0.02,0.041]*1/4/[1,2,3,5,8]).range(0.00001,0.02)) * LFSaw.ar(1/4/[1,2,3,5,8]).squared
			,3,0.033,20)
		,SinOsc.ar(1.1));

	sigh = HPF.ar(sig,4000+SinOsc.ar((1..10)/100.13).range(-1000,10000),0.33) ;
	sigm = BPF.ar(sig,2000+SinOsc.ar((1..10)/101.217).range(-1000,3000),0.33) ;
	sigl =	LPF.ar(sig,500+SinOsc.ar((1..10)/102.331).range(-480,1500),0.33) ;

	//////////////////////////////////
	Splay.ar(
		BBandPass.ar(
			(CompanderD.ar(sigl,0.75,1,0.25,0.06,0.06) + CompanderD.ar(sigm,0.75,1,0.25,0.022,0.022) + CompanderD.ar(sigh,0.015,1,0.015)) * 48.0
			,SinOsc.ar((1..20)/2000.0).range(5,16000),{ExpRand()*2}!20)
)}).play;

)

Ndef(\inp).stop(10)