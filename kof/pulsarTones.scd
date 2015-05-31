

(
~pulses.quant=2;
~pulses={
	var mod = Duty.kr(4,0,Dseq([2,1.5,2,1.25,2,1.125,2]*pi,inf));
	var sig = SinOsc.ar([1,2,4,8,3,1.5,1.25,1.125]*432/mod*(1.00001**(1..8)),mul:0.5);
	sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)/8),1);

	8.do{|i|
		sig = CombN.ar(sig,0.0133,i,i);
	};

	sig = Resonz.ar(sig,4000/(1..8),SinOsc.ar(1/4/fib(8)).exprange(0.01,1),1/((1..8)/8+1));
	sig = HPF.ar(sig,60);
	sig = LPF.ar(sig,4000) + ((LFSaw.ar(60,mul:0.55) * LFPulse.ar(1/32,(1..8)/8,0.004)));
	sig = GVerb.ar(sig,10)/4+sig;
	sig = CompanderD.ar(sig,0.75,1/2,1/2);

	Splay.ar(sig.flat,0.1);
};
~pulses.play;

)
