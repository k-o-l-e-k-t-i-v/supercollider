

(
~a={
	var t = 1/2/[5,3,6,7];
	var imp = Impulse.ar(t);
	var base = (Select.kr(TRand.kr(0.0001,9,imp),[48,60,65,63,67])+Select.kr(TRand.kr(0.0001,7,imp),[-12,0,12,24,-7,-14,-21])).midicps/2*[1,2,8,4];
	var sig = Formant.ar(base*[1,2,1.5,1.25]+SinOsc.ar([1,2,3,4]*11).range(-4,4),base/4pi,base/8pi) * LFTri.kr(t,pi).exprange(0.00001,0.33);

	sig = Vibrato.ar(sig,[4,5,6,7]*4,0.2);
	// sig = sig + (BPF.ar(GrayNoise.ar(0.01!2)*LFPulse.ar(2/[4,8,16],1.5pi,0.01/[1,2,4]).lag(1/500),[8000,10000,15000]));

	sig = HPF.ar(sig,120);
	sig = GVerb.ar(sig,100,10);
	sig = CompanderD.ar(sig,1/2,1/2,1/2);
	sig = sig + LPF.ar((SinOsc.ar(50!2,pi,mul:0.5) * LFPulse.ar(1/[8,16,32],pi,0.05/[1,2,4])).lag(1/500),100);


	Splay.ar(sig,0.5);

};
~a.play;
)