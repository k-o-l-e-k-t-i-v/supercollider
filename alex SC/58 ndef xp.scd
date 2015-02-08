

(

Ndef(\s).fadeTime=2;
Ndef(\s).quant=2;
Ndef(\s, {
var s1,s2,s3, b, b1,f,f2, lag;

	b=6;
	b1=Duty.kr(b,0,Dseq([[b/6,b/2],[b/2,b/3],[b/2,b/4],[b/2,b/4]],inf));
	// lag=Duty.kr(4,0,Dseq([0.002,0.02,0],inf));
	f=Duty.kr(8,0,Dseq([[65,67],[45,42],[60,62],[75,72],[45,42]],inf));
	f2=Duty.kr(8,0,Dseq([1800,1600,1200,1100,900,1400],inf));
	lag=Duty.kr(b*2,0,Dseq([0.002,0.02,0.004],inf));


	s1=HPF.ar(Sweep.ar(Dust.ar(b1),0.051)*GrayNoise.ar(0.2),f2);
	s2=Sweep.ar(Impulse.ar(b1),0.1)*VarSaw.ar([f+40,f+42,f+44,f+46],0,0.2,1.5);
	s2=FreeVerb.ar(s2,room:2,mul:4,add:SinOsc.ar(f/2,mul:0.1));

	s3=LFSaw.ar(f2/10)*Decay.kr(Impulse.kr([b,b/3]),0.001);
	s3=CombN.ar(s3,0.002,0.002,lag);

	Mix.new([s1,s2,s3]);


}).play;
)

Ndef(\s).stop;

(

{HPF.ar(Sweep.ar(Dust.ar([1,3]),0.1)*WhiteNoise.ar(0.2),1100)+
Sweep.ar(Impulse.ar([1,3]),0.1)*VarSaw.ar(100,0,0.3)}.play;
)

s.scope(8);


(
Ndef(\c).fadeTime=2;
Ndef(\c).quant=2;
Ndef(\c, {
var s1,s2,s3, s4, b, b1,f,f2, lag;

	b=4;

	f=Duty.kr(8,0,Dseq([[65,67],[45,42],[60,62],[75,72],[45,42]],inf));
	f2=Duty.kr(2,0,Dseq([880,660,1200,440,660,440],inf));

	s1=Limiter.ar((DelayN.ar(Pulse.ar(4),0.3,0.001)*SinOsc.kr([f,f+1,f+2],mul:0.4)),0.9)*Decay2.kr(Impulse.kr([b,b/2]),decayTime:0.7);

	// s2=GVerb.ar(s1,roomsize:100,revtime:1,drylevel:0);

	s3=HPF.ar(WhiteNoise.ar(0.2),f2/2)*Decay.kr(Impulse.kr([b/2,b/4]),0.1);

	s4=Dust.kr([b/4,b/6])*GrayNoise.ar;


	Mix.new([s1,s2,s3*0.5,s4]);


}).play;
)




{Limiter.ar((DelayN.ar(Pulse.ar(4),0.3,0.001)*SinOsc.kr(65,mul:0.4)),0.9)*Decay2.kr(Impulse.kr([4,2]),decayTime:0.7)}.play;

(
Ndef(\d).fadeTime=2;
Ndef(\d).quant=2;
Ndef(\d, {
var s1,s2,s3, s4, b, b1,f,f2, lag;

	b=4;
	f=Duty.kr(4,0,Dseq([45,47,50,47],inf));
	f2=Duty.kr(4,0,Dseq([880,660,220,660,440],inf));

	s1=BPF.ar(GrayNoise.ar,SinOsc.kr(200).range(f,f*2),SinOsc.kr(100).range(0.1,0.001));

	s1=Limiter.ar(s1,0.5)*Decay2.kr(Impulse.kr([b/16,b/8]),0.1,2); /////////////////////////////////b
	s1=GVerb.ar(s1,200,add:BPF.ar(GrayNoise.ar(0.4),f,0.1)*Decay.kr(Impulse.kr([b/16,b/8]),1.5));


	s2=Mix.fill(5,{SinOsc.ar(40+[2,1,3,4],(0..0.1))})*Decay2.kr(Impulse.kr([b/16,b/16]),0.2,3);
	s2=Limiter.ar(s2,0.1);


	s3=Saw.ar([300,302]).lag(0.002)*Decay2.kr(Impulse.kr([b/16,b/16]),0.7);
	s3=DelayN.ar(s3,1,1);

	Mix.new([s1,s2]);


}).play;
)



s.scope(4);

(
Ndef(\x).fadeTime=2;
Ndef(\x).quant=2;

Ndef(\x, {

	var b, s1,s2,s3,s23,s4,s5,e1,e2,e3,e4,f,f2;

	b=Duty.kr(Dseq([2,2,4,2],inf),0,Dseq([1,2,8,4],inf));
	f=Duty.kr(b,0,Dseq([45,47,55,65,45,70],inf));
	f2=Duty.kr(b/2,0,Dseq([3400,3700,3500,3200,3000,3400],inf));


	e1=Decay2.kr(Impulse.kr([b/4,b/4]),0.2,2);
	// e2=Decay2.kr(Impulse.kr([b/2,b/4]),0.2,2);
	e3=Decay2.kr(Impulse.kr([b/16,b/32]),0.1,3);
	e4=Decay2.kr(Impulse.kr([b/2,b]),0.1,0.5);
	e4=Decay2.kr(Impulse.kr([b/2,b/2]),0.01,0.02);


	s1=LFTri.ar(Lag.kr(LFNoise2.kr(f2).range(f-10,f)*[1,2,1.2,2.2],0.2),pi*(0..0.2),LFTri.kr(f-20).range(0,0.2)).lag(0.02);

	s2=GrayNoise.ar(0.8).clip(0.6,0.9)*e1;
	s2=GVerb.ar(s2,roomsize:10);
	s23=Limiter.ar((s1+s2),0.5)*e1;

	s3=Mix.fill(5,{SinOsc.ar(f/1.3*(1..2))});
	s3=Limiter.ar(s3,0.2);

	s4=Mix.fill(4,{SinOsc.ar(f*1.5+(1..3))});
	s4=Limiter.ar(s4,0.4)*e4;

	s5=CombN.ar(LFTri.ar(f2*(1,1..2))*e4,maxdelaytime:0.2,delaytime:0.2,decaytime:1);
	s5=GVerb.ar(s5,roomsize:50,revtime:1);


	Mix.new([s23*0.2,s3,s4,s5]);



}).play;
)




(

{~q=SinOsc.ar(400,mul:5)*Decay2.kr(Impulse.kr(0.25),decayTime:0.1);
	~s=CombN.ar(~q,0.2,0.2,1,add:~q);
	~m=FreeVerb.ar(~s,room:1);
}.play;
)


{Phasor.kr(Impulse.kr(0.5),rate:0.00001,end:0.01)}.plot(1);

Env.f test!
EnvGen.kr(Env.asr(0.5,0.8,0.1),1,doneAction:2);

(

Ndef(\q).fadeTime=2;
Ndef(\q).quant=2;
Ndef(\q, {
var s1,s2,s3, e1,e2,e3, b, b1,f,f2, lag;

	b=4;

	f=Duty.kr(b/2,0,Dseq([45,47,55,65,45,70],inf));
	f2=Duty.kr(0.2,0,Dseq([1200,1400,1100,1000,1200,1600],inf));

	e1=Decay2.kr(Impulse.kr([b/4,b/2]),0.3,4);
	e2=Duty.kr(Dseq([b+2,0.2,0.2,0.2,1.4],inf),0,Dseq([0,0.1,0.2,0.5,0.2],inf));
	e3=Decay2.kr(Impulse.kr([b,b*2]),0.1,0.2);
	e3=Decay2.kr(Impulse.kr([b/16,b/32]),0.1,3);


	s1=LFSaw.ar(Lag.kr(f*1.5+(1..4),0.1),[0,1,pi]).lag(0.02);
	s1=DelayN.ar(s1,2);
	s1=Limiter.ar(s1,0.5)*e1;

	s2=BPF.ar(GrayNoise.ar([e2,e2]),LFTri.kr(200).range(f*8,f*4).lag([0.5,0.2,0.4]),0.001,mul:40);
	s3=HPF.ar(WhiteNoise.ar(0.5),SinOsc.kr(200).range(f2*10,f2))*e3;

	Mix.new([s1,s2,s3]);


}).play;
)




s.scope(8);



(
Ndef(\3).fadeTime=2;
Ndef(\3).quant=2;
Ndef(\3, {
	var s1,s2,s3,s4, e1,e2,e3, b, b1,f,f2, lag;

	b=4;


	f=Duty.kr(b/4,0,Dseq([45,47,55,65,45,80],inf));
	f2=Duty.kr(b/4,0,Dseq([8800,4400,6600,1100,1880,1880],inf));

	e1=Decay2.kr(Impulse.kr([b/4,b/2]),decayTime:2);
	e2=Decay2.kr(Impulse.kr([b/8,b/4]),decayTime:0.1);
	e3=Decay2.kr(Impulse.kr([b/8,b/4]),decayTime:0.1);

	s1=LFPulse.ar([b,b/2],width:0.5,add:-0.5).lag(SinOsc.kr(0.125).range(0,0.0002));
	s2=LFSaw.ar(f+(1.1..2)).lag(0.02)*e1;
	s3=WhiteNoise.ar(0.8)*e2;
	s3=FreeVerb.ar(s3,room:1);

	s4=SinOsc.ar(f2)*e3;



	Mix.new([s1,s2,s3,s4]);

}).play;
)


(

Ndef(\r).fadeTime=2;
Ndef(\r).quant=2;
Ndef(\r, {

	var s1,s2,s3,s4, e1,e2,e3,e4,b,b2,f,f2,p, lag;

	b=4/3;
	b2=Duty.kr(b*4,0,Dseq([b/8,b/4,b/2],inf));

	f=Duty.kr(b*2,0,Dseq([16600,18800,15500,18800],inf));
	f2=Duty.kr(b*2,0,Dseq([45,55,45,65],inf));
	p=Duty.kr(b,0,Dseq([-1,1],inf));

	e1=Decay2.kr(Impulse.kr([b*4,b*2]),decayTime:0.1);
	e2=Decay2.kr(Impulse.kr([b/2,b/4]),decayTime:0.15);
	e3=Decay2.kr(Impulse.kr(b*2),0.001,decayTime:0.01);
	e4=Decay2.kr(Impulse.kr(b2),0.2,decayTime:b/2);

	s1=SinOsc.ar(f*(0.5..1))*e1;
	s2=Saw.ar(f/4*(1..1.2))*e2;
	s2=CombN.ar(s2,decaytime:0.8);
	s3=HPF.ar(WhiteNoise.ar(0.8),11000)*e3*10;
	s3=Pan2.ar(s3,p);

	s4=LFSaw.ar([55,57]).lag(0.02)*e4;

	Mix.new([s1,s2,s4]);

}).play;

)

Bus.audio(s,1);








