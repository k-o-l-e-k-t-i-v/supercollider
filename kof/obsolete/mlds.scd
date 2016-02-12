s.boot;

(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;

Ndef(\a,{


	var a,b,f,f2,hh,sint,hh;

	a = Duty.ar(4,0,Dseq([2,-2,2,5,0,0,0,0],inf));
	b = Duty.ar(4,0,Dseq([0,-2,0,-4],inf));
	f = Duty.kr(Dseq([1/4,1,1].normalize/8,inf),0,Dseq(([60+a,69+b,35+a,57+b]+12).midicps,inf));

	f2 = Duty.kr(4,0,Dseq(([60,65,58,69]).midicps/2pi,inf));

	hh = Duty.kr(Dseq([1/4,1,1].normalize/2,inf),0,Dseq([1,1,1,2],inf));

	sint = SinOsc.ar(f2-12.midicps,mul:0.1) * LFSaw.ar(SinOsc.ar(1/4/[11,22,33,44]).range(0.01,1)*5+111) * SinOsc.ar(1/4/[1,2,3,4]).range(0,1);

	sig =
	Vibrato.ar(
		(
			LFTri.ar(f + SinOsc.ar(1/[11,12,13,14]).range(-4,4) ,mul:0.4) * Decay.ar(Impulse.ar(4),1.5) +
			SinOsc.ar(f * 2 + SinOsc.ar(1/[11,12,13,14]).range(-2,2) ,mul:0.14) * Decay.ar(Impulse.ar(2),1.5) +
			(LFSaw.ar(f * (1..8) + SinOsc.ar(2/[11,12,13,14]).range(-2,2) ,mul:0.2/(1..8)) * Decay.ar(Impulse.ar(2),0.05*(1..8)))

		).softclip +
		RLPF.ar(LFSaw.ar(f2*2,mul:0.5),f2*pi*LFTri.ar(1/(1..11)).range(0.5,1.5))
		,[4,5,6,7],0.2) +
	((BrownNoise.ar(0.25!2) * SinOsc.ar(hh/4).range(0,1)) * LFPulse.ar(hh));


	Splay.ar(
		LPF.ar(
			CompanderD.ar(
				CombN.ar(
					BBandPass.ar(
						sig
						,22000/(1..8),4,SinOsc.ar(1/4/(1..8).scramble).range(0,2))
					*
					LFSaw.ar(1/4/[1,2,4],mul:0.4).squared +
					sint
					,1/32/(1..8),(1..8)*2,(1..8)*4)
				,0.25,1,1/3,0.02,0.02) +
			LFSaw.ar(f2*8pi,mul:0.002)

			,16000) * 2 + (sig / 2)
		,0.25,1,0.5)}).play
)

s.scope;
