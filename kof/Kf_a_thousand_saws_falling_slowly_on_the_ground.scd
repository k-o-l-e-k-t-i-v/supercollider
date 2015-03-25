
s.reboot;
(
Ndef(\setOsc).quant = 2.0;
Ndef(\setOsc,{
	var set;
	set = [1,2,4,8,16,32,64,128,256,512,1024,2048] * 8888;

	Splay.ar(
		BPF.ar(
			LFSaw.ar(11+((1..1000)/set),mul:0.125)
			,m.kr(0,1)*22000)
		,1,1)
}).play;
)

s.scope;
