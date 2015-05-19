

(
~na.quant=4;
~na.fadeTime=0.02;
~na={
	var imp,sig,separate,note;
	var mod = Duty.kr([2,4],0,Dseq([0,12,3,5,7,-12],inf)) + (TRand.kr(0.001,36.0,Impulse.kr(1/8/(1..12))).round(12)+TRand.kr([-48,-12],13,Impulse.kr(1/4!2)).round([12,12])) + SinOsc.kr(4,SinOsc.kr(1/(1..12),mul:8pi),mul:0.02);

	var env2 = Decay.ar(Impulse.ar(2),0.5);
	var sig2 = GrayNoise.ar(0.5!4) + SinOsc.ar(44*[1,2,4,8]*pi);

	note = ([36,24+7]+[0,12,0,24,0,36,0,12,0,-12,0,1]+mod).midicps;

	sig = [
		LFPar.ar(note),
		LFSaw.ar(note,mul:0.2),
		SinOsc.ar(note),
		LFPulse.ar(note,mul:0.2),
		VarSaw.ar(note)
	];

	sig = SelectX.ar(SinOsc.ar(1/4/(1..16)).range(0,sig.size+0.01),sig);

	imp = Decay2.ar(Impulse.ar(1/4,(1..16)/16),LFSaw.ar(1/4/(1..12)).range(0.1,0.75),0.15);

	sig = sig * imp;

	sig = Mix(sig)/4;

	separate = Notch.ar(sig,LFSaw.ar(1/(1..12)).range(400,12000)/12*(1..12),SinOsc.ar(4/(1..12)).exprange(0.001,2));

	separate = CompanderD.ar(separate,0.75,1/2,1/4);

	sig = MoogFF.ar(separate,SinOsc.ar(1/[6,7]/(1..12)).range(22,14000)) + (separate/2);


	sig = Mix(sig)/4;

	sig = Vibrato.ar(sig,[4,5,6,7],0.2);


	sig2 = Vibrato.ar(sig2,[4,5,6,7],0.2);
	sig2 = CombN.ar(sig2,0.01*(1..8),0.01*(1..8),8);
	sig2 = Normalizer.ar(sig2,0.5);
	sig2 = BBandPass.ar(sig2,LFTri.ar(1/8/[1,2,4,8]).exprange(16000.0001,33),0.5);
	sig2 = HPF.ar(sig2,150);
	sig2 = GVerb.ar(sig2)/1.75+sig2/1.25;
	sig2 = CompanderD.ar(sig2,0.75,1/2,1/4);

	env2 = Mix.fill(2,env2);
	sig2 = sig2 + (SinOsc.ar(50*(env2**10*0.001+1),mul:0.95) * env2);
	sig2 = sig2 + (SinOsc.ar(150*(env2**10*0.001+1),mul:0.5) * env2);

	sig2 = CompanderD.ar(sig2,0.75,1/1.5,1/1.5) / 2;

	// sig = PitchShift.ar(sig,0.1,env2.range(0.91,1));

	sig = GVerb.ar(sig/2+(sig2/3),[10,50]) + (sig/3+(sig2/4));

	sig = Pan2.ar(sig,SinOsc.ar([4,7.9]))/8;


	Splay.ar(sig.flat,0.5);
};
~na.play;
)

