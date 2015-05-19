
(
~qwe={
	var imp = Impulse.ar(1/2,(0..7)++[0.5,7.5,7.75]/8);
	var sig = DynKlank.ar(`[(1..20),nil,{ExpRand(0.001,2)}!20],imp,1,Decay.ar(imp,1).exprange(5.01,65));
	sig = HPF.ar(sig,20);
	sig = sig + (RHPF.ar(WhiteNoise.ar(0.74!2),LFDNoise1.ar(1/4!8,10000,12000),SinOsc.ar(11/fib(12),0.5).exprange(0.2,0.6)) * Decay2.ar(imp,0.25,0.0035));
	Splay.ar(sig,0.25);
};
~qwe.play;
)