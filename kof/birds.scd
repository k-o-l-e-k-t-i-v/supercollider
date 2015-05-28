


(
~birdie={
	var imp = Decay2.ar(Dust.ar(1),0.3,0.7);
	var sig = SinOsc.ar(3156!2 + imp.range(-3000,3000) + (BrownNoise.ar(1!2).exprange(0.011,10)-5) * (1.001**(1..8)) ) * imp;
	sig = GVerb.ar(sig,[10,20,30]);
	Splay.ar(sig.flat);
};

~birdie.play;

)