

(
~lowSaw={
	var cadence = 4/fib(16);
	var base = 43.2*[1,1.5,1.25,2];
	var imp = SinOsc.ar(cadence).exprange(0.00001,1);
	var f = base*([0.5,0.25,1,2,4,0.125]*pi)*[1,1,1.5,2,1.125,1.25,4,8].scramble + LPF.ar(BrownNoise.ar(1!8),5).range(-2,2) * (1.001**(1..8));
	var sig = [
		LFSaw.ar(f),
		SinOsc.ar(f),
		LFPulse.ar(f),
		VarSaw.ar(f)
	];

	sig = SelectX.ar(LFSaw.ar(cadence).exprange(0.0001,sig.size+0.01),sig.flat) / 4;

	sig = Limiter.ar(sig);
	sig = sig * imp;
	sig = LPF.ar(HPF.ar(sig*2,40),200) + BPF.ar(sig,SinOsc.kr(cadence).exprange(40.0011,15000),0.1) / 4;
	sig = CompanderD.ar(sig,1/3*2,1/2,1/2);
	sig = GVerb.ar(sig,(10..14)/10+10);
	Splay.ar(sig.flat,0.25);

};
~lowSaw.fadeTime=5;
~lowSaw.quant=2;
~lowSaw.play;
)