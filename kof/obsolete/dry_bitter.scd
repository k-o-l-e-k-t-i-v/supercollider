p=ProxySpace.push(s);

(
~qwe.quant=2;
~qwe={
	var imp = Impulse.ar(1/2,(0..7)++[0.5,7.5,7.75]/8);
	var sig = DynKlank.ar(`[(1..20),nil,{ExpRand(0.001,2)}!20],imp,1,Decay.ar(imp,1).exprange(5.01,65));
	sig = HPF.ar(sig,20);
	sig = sig + (RHPF.ar(WhiteNoise.ar(0.74!2),LFDNoise1.ar(1/4!8,10000,12000),SinOsc.ar(11/fib(12),0.5).exprange(0.2,0.6)) * Decay2.ar(imp,0.25,0.0035));
	Splay.ar(sig,0.25);
};
~qwe.play;
)

//cool ^^


(
~wer.quant=2;
~wer={
	var imp = Impulse.ar(1/2,(1..8)++0.5/8);
	var sig = DynKlank.ar(`[{1.rrand(20)/20}!10,nil,{1.rrand(20)/20}!10],imp,1/10,Decay.ar(imp,1/LFDNoise1.ar(1/4!2).exprange(1.01,10)).exprange(43.01,12000));
	sig = HPF.ar(sig,40)/2;
	Splay.ar(sig,0.5,0.08);
};
~wer.play;
)



(
~ert.quant=2;
~ert={
	var imp = Impulse.ar(1/2,(1..8)++[0,0.5,0.25]+0.00125/8);
	var sig = DynKlank.ar(`[{1.rrand(20)/10}!10,nil,{1.rrand(20)/100}!10],imp,1/2,Decay.ar(imp,1/LFDNoise1.ar(1/fib(10)).exprange(0.01,2)).exprange(1200,143.01));
	sig = HPF.ar(sig,10);
	Splay.ar(sig,0.5,0.8);
};
~ert.play;
)
