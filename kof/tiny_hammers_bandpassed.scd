
p = ProxySpace.push(s);

~mod.quant = 2;
~mod = {Duty.kr(4,0,Dseq([1,1.5,2,1.25,0.5,0.75,4],inf))};

~a.play;
~a.quant = 2;
(
~a = {
	var sig;
	sig= BBandPass.ar(LFSaw.ar(43.2*~mod*(2.0001**(1..8))),SinOsc.ar(1/128*(1..32)).range(44,22044),0.1,4);
	sig = CombN.ar(sig,0.5,0.65,32);
	sig = sig * Decay.ar(Impulse.ar(8/[1,2,4,8]),0.1);
	sig = CompanderD.ar(sig,0.5,1,1/10);
	sig = FreeVerb.ar(sig,0.133,10);
	sig = RLPF.ar(sig,440+LFTri.ar(0.1).range(0,8000)) * 2;

	Splay.ar(sig);

};

~a.mold(2);
)