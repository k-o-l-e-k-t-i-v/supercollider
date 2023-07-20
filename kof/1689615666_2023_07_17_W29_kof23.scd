p.push()


~tempo={110/120}

(
~lat.fadeTime=2;
~lat={
	var base = LFSaw.ar(~tempo*4/[1,2,3]).exprange(40.02,1600);
	var freq = base * (2**(([1,5,8]/12)));
	var sig = LFSaw.ar(freq,mul:2pi) + LFTri.ar(~tempo/[2,3,4]).range(0,0.01pi);
	sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);
	sig = LeakDC.ar(sig);
	sig = sig * Pulse.ar(~tempo*4/[1,2,3]);
	//sig = sig * Pulse.ar(~tempo*7/[1,4,7]);
	sig = CombN.ar(sig,2/freq,1/freq,LFNoise1.kr(~tempo*4/[1,2,3]).exprange(0.01,1.9));
	sig = LPF.ar(sig,freq*3)/2 + sig;
	sig = GVerb.ar(sig,60,3)/8+sig;
	sig = CompanderD.ar(sig,3/4,1/2,1);
	sig = LeakDC.ar(sig);
	Splay.ar(sig,0.95,0.025);
};
~lat.play;
)
