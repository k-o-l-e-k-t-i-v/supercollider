
s.boot();

p = ProxySpace.push();


(
	~one.fadeTime=5;
~one={
	var tone = [60,65,63,67].midicps;
	var tempo = 105/60/24/[1,2,3,4,5,6,7,8,9,10].nthPrime;
	var detune = 1;
	var len = LFSaw.ar(tempo)*1+0.01;
	var sig = SinOsc.ar(LFSaw.ar(tempo).exprange(35,16000) + SinOsc.ar(tempo*240,mul:detune), pi * SinOsc.ar(tempo/32,add:1),mul:0.7);
	sig = LPF.ar(sig,18000) * Pulse.ar(tempo*240/[1,2,3,4]).softclip;
	sig = CombL.ar(sig,len/(1..10).nthPrime,1/tone,2/4).softclip;
	Splay.ar(sig,1,0.24);
};
~one.quant=4;
~one.play();
)
