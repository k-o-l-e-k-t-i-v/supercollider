

(
~untercross.fadeTime=2;
~untercross.quant=2;
~untercross={
	var imp = Decay.ar(Impulse.ar(1/32,(0..15)+[0.5,0.25]/16),2).exprange(0.0001,1);
	var sig = LFSaw.ar([50,100,200]*[20,40]*(imp**4)) * imp;
	// sig = Normalizer.ar(sig,1);
	sig = GVerb.ar(sig,[3,10,100]);
	sig = CompanderD.ar(sig,0.5,1/3,1/3);
	Splay.ar(sig.flat,0.01,LFSaw.ar(1/8/fib(12)).exprange(0.00001,1),1);
};
~untercross.play;
)



(
~untercross2.fadeTime=2;
~untercross2.quant=2;
~untercross2={
	var imp = Decay.ar(Impulse.ar(1/64,(0..15)+[0.5,0.25]/16),2).exprange(0.0001,1);
	var sig = LFSaw.ar([50,100,200]*[200,400]*(imp**4)) * imp;
	// sig = Normalizer.ar(sig,1);
	// sig = GVerb.ar(sig,[3,10,100]);
	sig = CompanderD.ar(sig,0.5,1/3,1/3);
	Splay.ar(sig.flat,0.01,LFSaw.ar(1/8/fib(12)).exprange(0.00001,1),1);
};
~untercross2.play;
)



(
~untercross3.fadeTime=2;
~untercross3.quant=2;
~untercross3={
	var imp = Decay.ar(Impulse.ar(1/128,(0..15)+[0.5,0.25]/16),2).exprange(0.0001,1);
	var sig = GrayNoise.ar(0.001!2) * imp;
	// sig = Normalizer.ar(sig,1);
	// sig = GVerb.ar(sig,[3,10,100]);
	sig = CompanderD.ar(sig,0.5,1/2,1/3);
	Splay.ar(sig.flat,0.01,LFSaw.ar(1/8/fib(12)).exprange(0.00001,1),1);
};
~untercross3.play;
)