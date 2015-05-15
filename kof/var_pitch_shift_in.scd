p=ProxySpace.push(s);

(
~filt.fadeTime=4;
~filt={
	var sig = AudioIn.ar([0,1]);
	sig = PitchShift.ar(sig,0.2,SinOsc.ar(50/fib(12)).range(0.85,1.125));
	sig = GVerb.ar(sig,100);
	sig = CompanderD.ar(sig,0.5,1/2,1/2)/2+(sig/2);
	Splay.ar(sig.flat);
};
~filt.mold(2);
~filt.play;
)


~filt.stop(20)

//hm, no sound here. everything goes under -1.