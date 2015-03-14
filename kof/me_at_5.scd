


(

~a.play;
~a={
	var sigs,mod,mod2;

	mod=m.kr(0,2)*10;
	mod2=m.kr(0,3).range(1.0000001,1.05);

	sigs=[
		LFSaw.ar(43.2*mod*(mod2**(1..8)) ),
		LFPulse.ar(43.2*2*mod*(mod2**(1..8))),
		LFCub.ar(43.2*4*mod*(mod2**(1..8))),
		SinOsc.ar(43.2*8*mod*(mod2**(1..8))),
		VarSaw.ar(43.2*1.5*mod*(mod2**(1..8))),
		LFSaw.ar(43.2*3*mod*(mod2**(1..8))),
		LFSaw.ar(43.2*6*mod*(mod2**(1..8))),
		LFSaw.ar(43.2*9*mod*(mod2**(1..8)))
	];


	sigs=Select.ar(~n,sigs);
	sigs=BBandPass.ar(sigs,LFSaw.ar(m.kr(0,4)*16+1/4).range(22000*m.kr(0,5),22));
	sigs=FreeVerb.ar(sigs,m.kr(0,3),100);


	Splay.ar(sigs,0.1,m.kr(0,1));

}
)