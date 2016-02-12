
s.boot;

(
Ndef(\conv,{
	var sig1,sig2;
	sig1 = RLPF.ar(WhiteNoise.ar(1!2),LFSaw.ar(1/8/[1,2,4,8]).range(22,22000));
	sig2 = LFSaw.ar(TExpRand.ar(22,22000,Impulse.ar(1/8/[1,2,4,8]!16)).round(43.2).lag(8*[1,2,4,8]) );

	sig1 = Normalizer.ar(sig1) /32;
	sig2 = Normalizer.ar(sig2) /32;

	Splay.ar(
		Compander.ar(
			CombN.ar(
				Convolution.ar(sig1,sig2,1024,0.5)
				,1,1.001,32)
			,0.25,1,1/10) * LFSaw.ar(1/8/[1,2,4,8]).exprange(0.001,1)
	);

}).play;
)
