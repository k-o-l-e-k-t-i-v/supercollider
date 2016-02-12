

(
~osmosis={
	var l,m,h;
	var cl,cm,ch;

	var modular = LFSaw.ar(11/(1..7)).range(0,11);
	var a = LFTri.ar(2200/(1..8)+modular,mul:0.04);
	a = a + SinOsc.ar(55*[1,2,1.5]+(modular.lag(0.01)/10),mul:0.8);

	a = a * Decay.kr(Impulse.kr(2/[1,2,8,4],(1..8)/8),0.6/[1,2,4,8]);

	l = LPF.ar(a,110*modular.lag(0.2));
	m = BPF.ar(a,220*modular.lag(0.4),0.15)*2;
	h = HPF.ar(a,1800*modular.lag(0.2));


	///// compressor party
	cl = LFSaw.kr(1/4/(1..8),0.5).exprange(1.0001,1/TExpRand.kr(0.2501,3,Impulse.kr(1!2)).lag(1) );
	cm = LFSaw.kr(1/2/(1..8),0.5).exprange(1.0001,1/TExpRand.kr(0.2501,3,Impulse.kr(1/2!2)).lag(2));
	ch = LFSaw.kr(1/3/(1..8),0.5).exprange(1.0001,1/TExpRand.kr(0.2501,3,Impulse.kr(1/4!2)).lag(4));

	l = CompanderD.ar(l,0.75,cl,1/4);
	m = CompanderD.ar(m,0.75,cm,1/4);
	h = CompanderD.ar(h,0.75,ch,1/4);
	/////


	a = (l+m+h);

	a = GVerb.ar(a,10,2)/3.5+a/1.5;

	a = a.softclip;

	Splay.ar(a,0.5,1);

};

~osmosis.play;
)