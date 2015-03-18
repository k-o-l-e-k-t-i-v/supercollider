(
Ndef(\2, {

	~f=Duty.kr(4,0,Dseq([65,74,85, Drand([54,65,75],2)],inf));
	~s=DFM1.ar(LFSaw.ar(~f*[4/3,4/3*2,4/3*4],mul:LFSaw.ar([4/3/2,4/3/4])),freq:LFNoise0.kr(4).range(65,100),res:SinOsc.kr(0.25).range(0.1,0.4),inputgain:0.7,noiselevel:SinOsc.kr(0.125).range(0.0003, 0.001)).lag(0.002);

	~s=GVerb.ar(~s,100,revtime:0.5,add:~s);
	~s=Splay.ar(Limiter.ar(~s,0.3),1);

}).play;
)

s.scope(4);