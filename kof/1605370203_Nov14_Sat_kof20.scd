s.boot;
p=ProxySpace.push();
~tempo={SinOsc.kr(1/15).range(105/120,140/120)};

// pulse synth ///////////////////////////////////////

(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4;
~pulse={
	var sig = SinOsc.ar(40!2,Pulse.ar(~tempo*2)) * (LFSaw.ar(~tempo*2)**0.2);
	sig = RLPF.ar(sig,LFSaw.kr(1/15).range(500,15000),0.2);
	Splay.ar(sig,0.5,0.25);
};
~pulse.play;
);
~pulse.stop(4);
~pulse.clear;
~pulse.pause;
~pulse.resume;
