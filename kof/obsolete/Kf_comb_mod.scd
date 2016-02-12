s.boot;


(

Ndef(\ss).quant = 2.0;
Ndef(\ss).fadeTime = 2.0;

Ndef(\ss,{
	var sig,efx;
	Splay.ar(
	sig = (LFSaw.ar([90,60],SinOsc.kr(0.1).range(-pi,pi),mul:0.2) * Decay.ar(Impulse.ar(8/[1,2,4,8]),0.5));
	efx = CombN.ar(sig,LFSaw.kr(4).range(0.08,0.4),LFSaw.kr(4).range(0.01,0.2),1,1,sig).softclip

)}).play;

)

Ndef(\ss).stop(10)