s.boot;
p=ProxySpace.push();



(
~one={
	var trig = 1/[1,2,3,4];
	var sig = Pulse.ar(trig) * SinOsc.ar(LFSaw.ar(trig/96).exprange(33.001,22000),Pulse.ar(trig));
	Splay.ar(sig);
};
~one.play();
)
