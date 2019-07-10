

(
~gen={
	var sig;
	sig = DWGBowed.ar(50,0.5,1,1,1,LFTri.kr(1/4).range(0.002,0.94));
	sig = DWGSoundBoard.ar(sig);
	sig = LPF.ar(sig,500);
	Splay.ar(sig,0.15,0.1);
};
~gen.play;
)
