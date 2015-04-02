



(

~a={
	var sig;
	sig = Klank.ar({`[Array.fill(20,{ExpRand(44,14480)}),nil,Array.fill(20,{ExpRand(0.01,1)})]}!16,Impulse.ar(1/4,(0..15)/16),1,40,4.15/(1..32).scramble+0.2);
	sig = Mix.ar(sig);
	sig = BBandPass.ar(sig,18800/32*(1..16)+80,0.15,SinOsc.ar(4/(1..32).scramble,{ExpRand(0,2pi)}!16).exprange(0.00001,1));
	sig = CompanderD.ar(sig,1/1.2,1/2);
	sig = FreeVerb.ar(sig,0.153,1.5);
	Splay.ar(sig,0.1);

};
~a.play.quant_(4);
)
