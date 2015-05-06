

(
~a={
	var m = Duty.kr(4,0,Dseq([1,2,4,8,1.2,1.25,1.125,1],inf));
	var mod = Duty.kr(1/4,0,Dseq([1,2],inf)).lag(1/20)*8/(m*0.5pi);
	var sig = LFSaw.ar(50*mod,mul:0.5).distort;


	sig = MoogFF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(22,4000));
	sig = sig + (PinkNoise.ar(0.5!2) * Decay.ar(Impulse.ar(1/4,(0..3)/16)));

	sig = sig.distort + (SinOsc.ar(50!2)*LFPulse.ar(1/4,0,0.25));


	sig = GVerb.ar(sig)/4+sig/2;

	sig= CompanderD.ar(sig,1/2,1/2,1/2);

	sig = sig / 2;

	Splay.ar(sig.flat,0.1,0.5);

};
~a.quant=2;
~a.play;
)
