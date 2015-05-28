

(
~lowSaw={
	var imp = SinOsc.ar(1/4/fib(16)).exprange(0.00001,1);
	var f = 50*([0.5,0.25,1,2]*pi)*[1,1,1.5,2,1.125,1.25,4,8].scramble + LPF.ar(BrownNoise.ar(1!8),5).range(-10,20) * (1.001**(1..8));
	var sig = [
		LFSaw.ar(f),
		SinOsc.ar(f),
		LFPulse.ar(f),
		VarSaw.ar(f)
	];

	sig = SelectX.ar(SinOsc.ar(1/8/fib(16)).range(0,sig.size+0.01),sig.flat) / 8;

	sig = sig * imp;
	sig = LPF.ar(HPF.ar(sig*2,20),100) + BPF.ar(sig,SinOsc.kr(1/4/fib(16)).exprange(40.0011,15000),0.1) / 4;
	sig = Limiter.ar(sig);
	sig = CompanderD.ar(sig,1/3*2,1/2,1/2);
	sig = GVerb.ar(sig,(10..14)/10+10);
	Splay.ar(sig.flat,0.25);

};
~lowSaw.fadeTime=5;
~lowSaw.quant=2;
~lowSaw.play;
)