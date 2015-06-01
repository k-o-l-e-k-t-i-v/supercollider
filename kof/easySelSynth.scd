

(
~slam.quant=2;
~slam={
	var siz = Duty.kr(4,0,Dseq([2,20,2,40,2,100],inf));
	var sig = Pulse.ar(4/fib(8));
	sig = CompanderD.ar(sig,0.9,1/2,1/2);
	sig = sig * (LFPulse.ar((1..10)/100+[55,75]) ++ WhiteNoise.ar(0.2!2) ++ LFSaw.ar(90!2) ++ SinOsc.ar(43.2*[1,1.25,1.5,2]));

	sig = GVerb.ar(sig,siz,7,0.991,0.7,35);

	sig = CompanderD.ar(sig,0.9,1/2,1/2);

	Splay.ar(sig.flat,0.1,0.25);
};
~slam.play;
)