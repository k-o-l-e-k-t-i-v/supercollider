(
Ndef(\setOsc).quant = 2.0;
Ndef(\setOsc,{

	~set = [1,2,4,8,16,32,64,128,256,512,1024,2048] * 8888;

	Splay.ar(
		LPF.ar(
		LFSaw.ar(11+((1..1000)/~set),mul:0.125)
	,8800)
	,1,1)
}).play;
)

s.scope;