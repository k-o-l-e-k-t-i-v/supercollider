
(
~poi={
	var h,l,saw;
	var a = VarSaw.ar(55+(0.55*(32/(1..16))),mul:SinOsc.ar(4/(1..16)).exprange(0.001,0.1) ).distort;
	a = CombN.ar(CompanderD.ar(a,0.75,1/4,1/4),0.133,4,8).softclip;
	a = Mix(a).softclip * (Decay.ar(Impulse.ar(4/[2,4,8],(0..3)/4),0.24)**2);


	saw = LFSaw.ar(43.2*[1,2,4,8]*(1.00001**(1..8)),mul:0.2);
	saw = BPF.ar(saw,SinOsc.kr(8/(1..4)).range(50,12000));


	l = LPF.ar(a,250);
	h = HPF.ar(a+saw,1250);

	a = h/16+l;
	a = HPF.ar(a,15)/2;
	a = GVerb.ar(a,20);

	Splay.ar(a.flat,0.1);
};
~poi.fadeTime=5;
~poi.quant=2;
~poi.play;
)

s.scope