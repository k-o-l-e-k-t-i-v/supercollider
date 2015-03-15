(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;
Ndef(\2, {

	var sig, lag, f, b;

	b=Duty.kr(4,
		reset:0,
		level:Dseq([Dseries(1,1,3),Dseries(3,-1,2)],inf));

	f=Duty.kr(4,0,Drand([440,420,400,480,500],inf));
	lag=Duty.kr(2,0,Dseq([0.002, 0.0009, 0.002],inf));


	sig=LFSaw.ar(Lag.kr(f,lag*100)+(2,4..12),(0..0.4)).clip(-0.2,0.7).lag(lag);
	sig=sig*LFPulse.ar([b,b*4/3]).lag(0.02);
	sig=CombN.ar(sig,maxdelaytime:0.8,delaytime:0.85,decaytime:2);
	sig=DelayN.ar(sig,0.8,delaytime:0.2);

	sig=Splay.ar(sig);


}).play;
)

(
Ndef(\4).fadeTime=2;
Ndef(\4).quant=2;
Ndef(\4, {

	var sig,lag, f, b;

	b=Duty.kr(6,
		reset:0,
		level:Dseq([Dseries(1,1,2),Dseries(3,-1,1),Dseries(0.5,1,2)],inf));

	f=Duty.kr(4,0,Drand([65,67,63,61,67],inf));
	lag=Duty.kr(2,0,Dseq([0.002, 0.0009, 0.002],inf));

	sig=VarSaw.ar([f,f+2,Lag.kr(f,0.1)])+SinOsc.kr([f,f+2]);
	sig=sig*LFPulse.kr([b,b/2],mul:10).lag(0.002);
	sig=sig*Pulse.ar([b,b+(b/2)]);
	sig=Limiter.ar(sig,level:0.7);



}).play;
)