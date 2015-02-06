

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

	s2=GVerb.ar(s2,roomsize:100,revtime:1,drylevel:0);

	s3=HPF.ar(WhiteNoise.ar(0.2),f2/2)*Decay.kr(Impulse.kr([b/2,b/4]),0.1);

	s4=Dust.kr([b/4,b/6])*GrayNoise.ar;


	Mix.new([s1,s3*0.5,s4]);


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

















