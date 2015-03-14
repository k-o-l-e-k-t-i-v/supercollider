
(
~m.quant=4;
~m={LFSaw.ar(1/4).range(0,7)};
~a.map(\sel,~m);

~m2.quant=4;
~m2={LFNoise0.kr(1).range(0,2).round(1/2)};
~a.map(\freq,~m2);

~a.fadeTime=4;
~a.quant=2;
~a.play;


)

(
~a[0]={|len=1,freq=1,sel=0|
	var sigs = [
		LFSaw.ar(432/8*freq*(1.001*(1..8))),
		WhiteNoise.ar(1!2),
		LFSaw.ar(432/4*freq*(1.0001*(1..8))),
		BrownNoise.ar(1!2),
		LFSaw.ar(432*freq*(1.00001*(1..8))),
		GrayNoise.ar(1!2),
		LFSaw.ar(43.2*freq*(1.00001*(1..8)))
	];

	sigs = Select.ar(sel,sigs) * Decay.ar(Impulse.ar(4,0.5));

	Splay.ar(sigs)
};
~a.mold(2);

);

(

~a[10]=\filter->{|in| BBandPass.ar(in,LFSaw.ar(4).exprange(888,22.22))};
~a[12]=nil;//\filter->{|in| Resonz.ar(in,LFTri.ar(1/4/[1,2,4,8]).exprange(888,33),2,1.5)};
~a[14]=nil;//\filter->{|in| LPF.ar(in,LFTri.ar(1/16).exprange(250.01,12500))};
~a[16]=\filter->{|in| CompanderD.ar(in,0.95,1,1/10)};
~a[18]=\filter->{|in| Limiter.ar(in,1)};
~a[20]=\filter->{|in| FreeVerb.ar(in,0.1,1)};

);




