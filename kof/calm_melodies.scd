
(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,36,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/[1,2,4,8,1.25,1.5,16,32],LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1/2!8));

	sig = sig + (SinOsc.ar(mm.midicps*[1,2,4,1.5],mul:0.2) * Decay.ar(Impulse.ar(1/4,[0,0.25,0.5,0.75]/4),4));

	sig = GVerb.ar(sig,[100,10])/[4,2]+sig;

	Splay.ar(sig.flat,0.25);

};
~pls.play;
)