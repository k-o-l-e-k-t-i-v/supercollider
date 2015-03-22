



(
~z.play;
~sq.quant=2;
~mel.quant=2;
~mel={Duty.kr(4,0,Dseq([12,24,12-7,24-7,-12],inf))};
~sq={Duty.kr(Dseq([1/4,1/8].normalize/8,inf),0,Dseq(([60,24,72,36,63,24,67,72,60,24,72,36,63,24,65,60-7]+~mel.kr).midicps,inf))};
)

(
~z.quant=2;
~z.fadeTime=2;
~z={
	var sig,freq,amp,gens;

	sig = SinOsc.ar(~sq.kr/[1,2,4],mul:0.4/[3,2,1]);
	sig = BBandPass.ar(sig,SinOsc.ar(1/4/[1,2,3,4]).range(4440,22)) + (sig/2);
	sig = Limiter.ar(sig,0.9);
	sig = CompanderD.ar(sig,0.75,1,1/10);
	sig = CombN.ar(sig,1/2,1/2,1);
	sig = FreeVerb.ar(sig,0.133,1);
	Splay.ar(sig,0);
};
)

