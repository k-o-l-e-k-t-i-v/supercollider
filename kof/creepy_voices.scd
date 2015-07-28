

(
~gen={
	var sig;
	var speed = 1/[8,400,80,10];
	sig = Gendy1.ar(LFNoise2.kr(speed).range(1,6),LFNoise2.kr(speed),LFNoise2.kr(speed),LFNoise2.kr(speed),100,800,LFNoise2.kr(speed),LFNoise2.kr(speed),12);
	sig = BPF.ar(sig,1240/8*[1,2,4,8]*SinOsc.ar(1/4/[1,2,4,8]).range(0.1,8));
	sig = GVerb.ar(HPF.ar(sig,800),30)/4+(LPF.ar(sig,800));
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
	Splay.ar(sig.flat,0.5);
};
~gen.play;
)
