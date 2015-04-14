

(
~a={
	var t = 1/2/[5,3,6,7];
	var imp = Impulse.ar(t);
	var base = (Select.kr(TRand.kr(0.0001,9,imp),[48,36,60,72,65,63,67,84])+Select.kr(TRand.kr(0.0001,7,imp),[12,24,12+5,3,5,7])).midicps*[1,1.5,1.25,1.125];
	var sig = Formant.ar(base/[1,2,4,1.5,1.25,1.125]+SinOsc.ar([1,2,3,4]*11).range(-4,4),base/64pi,base/32pi) * LFTri.kr(t,pi).exprange(0.00001,0.5);

	sig = Vibrato.ar(sig,[4,5,6,7]*4,0.2);
	// sig = sig + (BPF.ar(GrayNoise.ar(0.01!2)*LFPulse.ar(2/[4,8,16],1.5pi,0.01/[1,2,4]).lag(1/500),[8000,10000,15000]));

	sig = GVerb.ar(sig,100,10);
	sig = HPF.ar(sig,120);
	sig = CompanderD.ar(sig,1/2,1/2,1/2);
	sig = sig + LPF.ar((SinOsc.ar(50!2,pi,mul:0.5) * LFPulse.ar(1/[8,16,32],pi,0.05/[1,2,4])).lag(1/500),100);


	Splay.ar(sig,0.1);

};
~a.play;
)