

(
~lowSaw={
	var imp = SinOsc.ar(1/fib(16)).exprange(0.00001,1);
	var sig = LFSaw.ar(43.2*([0.5,0.25,1,2]*pi)*[1,1,1.5,2,1.125,1.25,4,8].scramble + LPF.ar(BrownNoise.ar(1!8),5).range(-10,20) * (1.001**(1..8)),mul:0.125);
	sig = sig * imp;
	sig = LPF.ar(HPF.ar(sig*2,20),100) + BPF.ar(sig,SinOsc.kr(4/fib(16)).exprange(50.0011,5000)) / 4;
	sig = Limiter.ar(sig);
	sig = CompanderD.ar(sig,1/3*2,1/2,1/2);
	sig = GVerb.ar(sig,(10..14)/10+10);
	Splay.ar(sig.flat,0.25);

};
~lowSaw.fadeTime=5;
~lowSaw.quant=2;
~lowSaw.play;
)