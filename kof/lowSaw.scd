

(
~lowSaw={
	var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2,1.25,1.5],inf));
	var cadence = 1/4/fib(8);
	var base = [24+7,24].midicps*[1,1.5,1.25,2] / mod;
	/////////////////////////////////
	var imp = SinOsc.ar(cadence).exprange(0.00001,1);
	var f = base*([0.5,0.25,1,2,4,0.125]*pi)*[1,1,1.5,2,1.125,1.25,4,8].scramble + LPF.ar(BrownNoise.ar(1!8),5).range(-4,4) * (1.0001**(1..8));
	var sig = [
		LFSaw.ar(f),
		SinOsc.ar(f),
		LFPulse.ar(f),
		VarSaw.ar(f),
		PinkNoise.ar(0.7!2)
	];

	sig = SelectX.ar(LFSaw.ar(cadence).exprange(0.0001,sig.size+1.01),sig.flat) / 8;

	sig = Limiter.ar(sig);
	sig = sig * imp;
	sig = LPF.ar(HPF.ar(sig,40),200) + BPF.ar(sig,SinOsc.kr(cadence).exprange(40.0011,500),0.1) ;
	sig = CompanderD.ar(sig,1/3*2,1/2,1/2);
	sig = GVerb.ar(sig,(10..14)/1.5+10);
	Splay.ar(sig.flat,0.25,0.25);

};
~lowSaw.fadeTime=5;
~lowSaw.quant=2;
~lowSaw.play;
)

(
~ls={
	var sig = LFSaw.ar(1/4!2).exprange(0.0001,1);
	sig = sig * LFSaw.ar(15000/[1,2,4,8],mul:0.1);
	sig = sig * SinOsc.ar(11);
	sig = HPF.ar(sig,100);
	// sig = GVerb.ar(sig,(10..14)/2+10);
	Splay.ar(sig.flat,0,0.1);
};
~ls.fadeTime=5;
~ls.quant=2;
~ls.play;
)


