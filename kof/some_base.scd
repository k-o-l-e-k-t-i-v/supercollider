
p=ProxySpace.push(s.boot);

(
(
~m.quant=2;
~m={LFTri.ar(1/64).range(0,7)};


~freqMod.quant=2;
~freqMod={LFNoise0.kr(1/8!3,1.5,8).round(1.5).lag(4)};
);

(
~a.quant=2;
~a.fadeTime=2;
~a.play;
~a={
	var sig,notes,base;

	notes=(37+7+(_*7!11)-[0,12,24]).midicps.scramble;

	base = notes/~freqMod*(1.00001**(1..11));

	sig = Blip.ar(base,LFSaw.ar(4).range(8,2),mul:0.3);
	sig = (SinOsc.ar(base/~freqMod/1.5,mul:0.5)*LFSaw.ar(4).range(0,1)) +sig;

	sig=  SelectX.ar(~m,sig);

	Splay.ar(sig);


};
);

(
~a[10]=\filter->{|in|Vibrato.ar(in,[4,5,6],0.2)};
~a[12]=\filter->{|in|BBandPass.ar(in,LFTri.ar(1/4/[1,2,4,8]).range(432.01*2,44),0.25,8)};
~a[14]=\filter->{|in|CompanderD.ar(in,0.5,1,1/25,0.02,0.2,1.5)};
~a[16]=\filter->{|in|Limiter.ar(in,1)};
~a[16]=\filter->{|in|AllpassN.ar(in,0.25,0.25,4)};
~a[18]=\filter->{|in|FreeVerb.ar(in,0.13,0.2)};


);
)