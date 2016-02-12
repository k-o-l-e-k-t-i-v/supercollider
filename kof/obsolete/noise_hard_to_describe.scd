



(

~a={
	var sig;
	sig = Klank.ar({`[Array.fill(20,{ExpRand(44,14480)}),nil,Array.fill(20,{ExpRand(0.01,1)})]}!16,SelectX.ar(LFTri.ar(1/32).range(0.0,16.1),LPF.ar(PinkNoise.ar(0.001!16),22000/(1..16).scramble)));
	sig = Mix.ar(sig);
	sig = BBandPass.ar(sig,18800/32*(1..16)+80,0.15,SinOsc.ar(1/4/(1..32).scramble,{ExpRand(0,2pi)}!16).exprange(0.00001,1));
	sig = CompanderD.ar(sig,1/1.2,1/2);
	sig = FreeVerb.ar(sig,0.153,1.5);
	Splay.ar(sig,0.1);

};
~a.play.quant_(4);
)
