



(
~a={
	var sig;
	sig = Klank.ar(`[Array.fill(200,{ExpRand(4,2000)}),nil,Array.fill(200,{ExpRand(0.001,1)})], PinkNoise.ar(0.06!2),1,40,1.1);
	sig = BBandPass.ar(sig,22000/16*(1..16),0.25,SinOsc.ar(1/2/(1..16).scramble).range(0,1));
	sig = FreeVerb.ar(sig,0.13,1.25);
	Splay.ar(sig,0.1);

};
~a.play;
)
