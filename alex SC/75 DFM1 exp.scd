(
Ndef(\2, {

	~b=4/3;

	~m=Duty.kr(8,0,Dseq([2,4,3,1],inf));
	~f=Duty.kr(4,0,Dseq([66,77,88, Drand([55,66,77],2)],inf));

	~s=LFSaw.ar(Lag.kr(~f,0.2)*[~b,~b*2,~b*~m],mul:LFPulse.ar([~b,~b*2])); // play
	~s=CombN.ar(~s,1,1,2);
	~s=DFM1.ar(~s,freq:LFNoise0.kr(4).range(65,100),res:SinOsc.kr(0.25).range(0.1,0.4),inputgain:0.7,noiselevel:SinOsc.kr(0.125).range(0.0003, 0.002)).lag(0.002);

	~s=GVerb.ar(~s,100,revtime:1,add:~s);
	~s=Splay.ar(Limiter.ar(~s,0.3),1);

}).play;
)

s.scope(4);



(

Ndef(\4, {
	var f, b,m,w, w2,w3;


	b=4;
	m=Duty.kr(4,0,Dseq([0.25,0.125,0.5,1].scramble,inf));

	f=Duty.kr(

		dur:Dseq([Dseries(4,-0.5,3),Dseries(2.5,1,2),5],inf)

		reset:0,
		level:Dseq([43,48,45, Drand([43,50,52,55],2),Drand([55,50,57,60],2)].scramble.midicps,inf)

	);


	w=LFSaw.ar(Lag.kr([f,f*2.5,Lag.kr(f*4.3,0.8),Lag.kr(f*2.1,0.2)],0.1),0).lag(0.02);
	w=Limiter.ar(CombN.ar(w,m,m,4),0.5);
	w=FreeVerb.ar(w,mix:SinOsc.kr(0.25).range(0.3,0.7),room:5);

	w2=DFM1.ar(w,freq:f,res:SinOsc.kr(m).range(0.1,0.8),inputgain:SinOsc.kr(m).range(0.5,1),type:0 /*lowpass*/,
		noiselevel:SinOsc.kr(m*2).range(0.0004,0.002));

	Mix.new([w,w2]);

}).play;
)




