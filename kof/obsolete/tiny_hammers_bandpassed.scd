

p = ProxySpace.push(s);

~mod.quant = 2;
~mod = {Duty.kr(2,0,Dseq([1,1.5,2,1.25,0.5,0.75,4,8,0.5],inf)).lag(1/4)};

~a.play;
~a.quant = 2;
(
~a = {
	var sig;
	sig= BBandPass.ar(SinOsc.ar(43.2*~mod*(2.01**(1..8))),SinOsc.ar(1/128*(1..32)).range(33,16000),0.1,4);
	sig = sig + (HPF.ar(WhiteNoise.ar(0.3!2),10000)*Pulse.ar(1/16,1/16*(1..8)));
	sig = CombN.ar(sig,0.25,0.25,8);
	sig = sig * Decay.ar(Impulse.ar(4/[1,2,4,8],[1,2,4,8]/8));
	sig = sig + ((SinOsc.ar(44 * (Pulse.ar(1,[0,1/8,1/8*2,1/8*4])+1.0),mul:[0.1,0.3,0.15])) * Decay.ar(Pulse.ar(1/2,[0,1/8,1/8*2,1/8*4]),0.15)) ;
	sig = CompanderD.ar(sig,0.5,1,1/10,0.01,0.05);
	sig = FreeVerb.ar(sig,0.133,10);
	sig = RLPF.ar(sig,440+LFTri.ar(0.1).range(0,18000)) * 2;

	Splay.ar(sig);

};

~a.mold(2);
)