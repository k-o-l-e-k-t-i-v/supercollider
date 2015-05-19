

(
~na.quant=2;
~na.fadeTime=4;
~na={
	var imp,sig,separate;
	var mod = Duty.kr([2,4]*4,0,Dseq([0,12,3,5,7,-12],inf)) + (TRand.kr(0.001,36.0,Impulse.kr(1/8/(1..12))).round(12)-24) + SinOsc.kr(4,SinOsc.kr(1/(1..12),mul:8pi),mul:0.02);
	sig = LFPar.ar(([60,36]+[0,12,0,24,0,36,0,12,0,-12,0,1]+mod).midicps);
	imp = Decay2.ar(Impulse.ar(1/4,(1..16)/16),LFSaw.ar(1/4/(1..12)).range(0.1,0.75),0.15);

	sig = sig * imp;

	// sig = PitchShift.ar(sig,0.2,imp.range(0.15,1.01).round(0.25));

	sig = Mix(sig)/4;

	separate = BPF.ar(sig,LFSaw.ar(1/(1..12)).range(2400,12000)/12*(1..12),SinOsc.ar(4/(1..12)).exprange(0.001,2));

	separate = CompanderD.ar(separate,0.75,1/2,1/4);

	sig = MoogFF.ar(separate,SinOsc.ar(1/[6,7]/(1..12)).range(22,14000)) + (separate/2);


	sig = Mix(sig)/4;

	sig = Vibrato.ar(sig,[4,5,6,7],0.2);

	sig = GVerb.ar(sig/2,[10,50,100,200]) + (sig/3);


	sig = CompanderD.ar(sig,0.75,1/2,1/4);

	sig = Pan2.ar(sig,SinOsc.ar([4,7.9]))/4;


	Splay.ar(sig.flat,0.5);
};
~na.play;
)