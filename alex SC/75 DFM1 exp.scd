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
