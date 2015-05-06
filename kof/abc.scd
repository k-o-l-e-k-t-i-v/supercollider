

(
~abc={
	var sel = SelectX.kr(TRand.kr(0,8,Impulse.kr(1/4!4)).lag(1),[1,2,4,8,3,1,2,8]);
	var sig = LFSaw.ar(SinOsc.ar(1/440/(1..8)).range(55,66));
	sig = PitchShift.ar(sig,0.2,SinOsc.ar(1/8/(1..8)).range(0.9,1.1));
	sig = Resonz.ar(sig,60,SinOsc.ar(0.1*(1..8)).range(0.1,1.1));
	sig = CombN.ar(sig,0.2,0.2,4) + (SinOsc.ar(1400*sel,mul:0.005) * LFPulse.ar([4,5,6,7]));
	sig = Mix(sig)!2 * 0.75;
	sig = CompanderD.ar(sig,1/2,1/2,1/2);
	sig = Pan2.ar(sig,SinOsc.ar(sel));
	sig = GVerb.ar(sig,10,3)/2 + sig/2;

	Splay.ar(sig.flat,0.1,0.13);
};
~abc.play;
)
