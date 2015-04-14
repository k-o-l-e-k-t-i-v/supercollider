

(
~a={
	var tone;
	var sig = SinOsc.ar(SinOsc.ar(11*[1,1.1]).range(44,88),mul:0.5);

	sig = sig + BPF.ar(GrayNoise.ar(LFSaw.ar(1/10*[1,1.1]).exprange(0.0001,0.2)),SinOsc.ar(11*[1.1,1.2]).range(100,10000));

	sig = sig * LFTri.ar(1/11/[1,1.1])**2;

	sig = CompanderD.ar(sig,1/2,1/2,4);
	tone = LFSaw.ar(43.2*([8,4,2,1]*pi)/(TExpRand.ar(1,8,Impulse.ar(1/4/fib(12))).round([1,1.5])),mul:LFTri.kr(1/4/fib(12),pi).range(0.0001,0.4) );
	tone = MoogFF.ar(tone,[44,440,4400]);

	sig = sig + tone;

	sig = GVerb.ar(sig,100,10,0.5,0.2,30)/6+sig/3;

	sig = HPF.ar(sig,16);
	sig = LPF.ar(sig,4000);
	sig = CompanderD.ar(sig,0.75,1/1.5,4);

	sig = Limiter.ar(sig).softclip(-0.9,0.9);

	Splay.ar(sig,0.1,0.5);
};
~a.play;
)
