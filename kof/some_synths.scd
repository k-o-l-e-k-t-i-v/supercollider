

(
~na.quant=2;
~na={
	var imp,sig,separate;
	var mod = Duty.kr([2,4],0,Dseq([0,12,3,5,7,-12],inf))-TExpRand.ar(0.001,15,Impulse.ar(1/4!2)).round(7).lag(1);
	sig = LFSaw.ar(([60,36]+[0,12,0,24,0,36,0,12,0,-12,0,1]+mod).midicps);
	imp = Decay2.ar(Impulse.ar(1/4,(1..16)/16),0.75,0.15);

	sig = sig * imp;

	sig = Mix(sig)/4;

	separate = BPF.ar(sig,1200/12*(1..12),SinOsc.ar(1/4/(1..12)).exprange(0.001,1));

	separate = CompanderD.ar(separate,0.75,1/2,1/4);

	sig = MoogFF.ar(separate,SinOsc.ar(1/[6,7]/(1..12)).range(22,1100)) + (separate/2);


	sig = Mix(sig)/4;

	sig = GVerb.ar(sig/4) + (sig/2);

	sig = CompanderD.ar(sig,0.75,1/2,1/10);

	sig = Pan2.ar(sig,SinOsc.ar([4,7.9]));


	Splay.ar(sig.flat,0.5);
};
~na.play;
)