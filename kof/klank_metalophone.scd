



(
~a={
	var sig;
	sig = Klank.ar({`[Array.fill(20,{ExpRand(80,8800)}),nil,Array.fill(20,{ExpRand(0.01,1)})]}!16,Impulse.ar(1/4,(0..31)/32),1,40,3.11/(1..32).scramble);
	sig = Mix.ar(sig);
	sig = BBandPass.ar(sig,8800/16*(1..16)+80,0.15,SinOsc.ar(10/(1..16).scramble).range(0,1));
	sig = CompanderD.ar(sig,1/1.2,1/2);
	sig = FreeVerb.ar(sig,0.153,1.5);
	Splay.ar(sig,0.1);

};
~a.play;
)
