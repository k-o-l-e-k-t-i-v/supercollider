

(
~gen={
	var sig;
	var speed = 1/[8,400,80,10];
	sig = Gendy1.ar(LFDNoise0.kr(speed).range(1,6),LFDNoise1.kr(speed),LFDNoise1.kr(speed),LFDNoise1.kr(speed),100,800,LFDNoise1.kr(speed),LFDNoise1.kr(speed),12);
	sig = BPF.ar(sig,1840/[1,2,4,8]*SinOsc.ar(1/4/[1,2,4,8]).range(0.1,8));
	sig = GVerb.ar(sig,100)+(sig/2);
	Splay.ar(sig.flat,0.5);
};
~gen.play;
)