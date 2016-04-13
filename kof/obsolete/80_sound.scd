
(
~sel={Duty.kr(4,0,Dseq([1.5,1.25,1.125,2],inf)).lag(1/16)};
~sel.quant =2;

~sel2={Duty.kr(4,0,Dseq([1.5,1.25,1.125/2,2],inf))};
~sel2.quant =2;
)

(
~a.play;
~a.quant=2;
~a={
	var in,m,hat,kick,pat1,pat2;

	pat1=[2,1]*2;
	pat2=[4,8]/2;

	kick = SinOsc.ar(55*(4*Decay.ar(Impulse.ar(pat1),0.1225)+1),mul:0.7)* Decay.ar(Impulse.ar(pat1),1.5);
	hat = RHPF.ar(WhiteNoise.ar(0.2!2),2200*[1,2,4,8]) * Decay.ar(Impulse.ar(pat2),0.45);
	m = VarSaw.ar(43.2*[1,2,4,8]*~sel2.kr,mul:0.2);
	in = Ringz.ar(Impulse.ar(4), 43.2*(_*~sel.kr!12) ,2.5,mul:1/(1..12)) + m + hat + kick / 2.0;
	in = CompanderD.ar(in,0.75,1/1.15,1/10).softclip;
	in = BBandPass.ar(in,LFTri.ar(1/32*fib(8)).range(44,12000),1,1,in/2);
	Splay.ar(in,0.1);
}
)

