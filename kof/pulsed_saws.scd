
// wait 5sec after exec

(
~absolute.quant=2;
~absolute.fadeTime=5;
~absolute={
	var sig = LFSaw.ar([50,75,50,100,1000]*(1.0001**(1..8)));
	var sig2 = HPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4/fib(8)).exprange(400,14000));
	var imp = Pulse.ar(4/fib(8));
	var imp2 = Pulse.ar(2/fib(8),0.25);

	sig = sig * imp;
	sig2 = sig2 * imp2;

	sig = sig + sig2;

	8.do{|i|
		sig = CombN.ar(sig,0.25*i,0.25*i,1*i);
	};

	sig = Resonz.ar(sig,50+SinOsc.ar(1/4/fib(8)).exprange(0.01,12000));
	sig = GVerb.ar(sig,[100,10])/4+sig;

	sig = CompanderD.ar(sig,4/3,1/2,1/2);

	Splay.ar(sig.flat,0.25,0.125);
};
~absolute.play;
)