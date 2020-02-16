


p.push();
p.pop
(
~a={
	var f = [440,221,110]/.x[1,2,3,4] + SinOsc.kr([2,3,4,5]);
	var phase = SinOsc.kr(1/(1..12));
	var amp = LFTri.kr(1/4/(1..12));
	var sel = LFTri.kr(1/16);
	var sig = [
		SinOsc.ar(f[0],phase[0]*2pi,mul:amp[0]),
		PinkNoise.ar(amp[1]),
		LFSaw.ar(f[1],phase[1]*2pi),
		SinOsc.ar(f,phase*2pi)
	];
	sig = LPF.ar(sig,1900);
	sel = LPF.ar(sig,10).lag(0.1);
	sig = Normalizer.ar(SelectX.ar(sel*sig.size+1,sig));
	Splay.ar(sig,SinOsc.kr(1/4/(1..4)),0.25);
};
)
~a.play;
~a.draw;