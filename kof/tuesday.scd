

(
~a={
	var mod = [1,2,0.5,0.25,4,0.75,1,2,4,0.5]/[2,4];
	var tone;
	var sig = SinOsc.ar(SinOsc.ar(11*[1,1.1]).range(44,88),mul:SinOsc.ar(1/16).range(0.0001,0.15));

	sig = sig + BPF.ar(GrayNoise.ar(LFSaw.ar(1/10*[1,1.1]).exprange(0.0001,0.005)),SinOsc.ar(11*[1.1,1.2]).range(100,10000));

	sig = sig * LFTri.ar(1/11/[1,1.1])**2;

	mod = Select.kr(TExpRand.kr(0.001,9,Impulse.kr(1/2/fib(12))),mod);
	sig = CompanderD.ar(sig,1/2,1/2,4);
	tone = LFSaw.ar(432*mod*([8,4,2,1.5]*pi)/(TExpRand.ar(1,8,Impulse.ar(1/2/fib(12))).round([1,2])),mul:LFTri.kr(1/2/fib(12),pi).range(0.0001,0.4) );
	tone = MoogFF.ar(tone,432*pi*mod);
	tone = tone * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);

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
