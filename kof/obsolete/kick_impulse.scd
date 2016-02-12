

(
~a.play;
~a.quant=2;
~a = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(4,0,Dseq([1,1.25,1.125,1.5,2,4],inf));

	t = Impulse.ar(1/2,1/16*[0,2,3,4,6,8,10,12,14,16,17]);
	env = Decay.ar(t,TExpRand.ar(0.1,0.75,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.15,t)).exprange(0.0001,10.01+(sel*1000.0));

	sig = SinOsc.ar(50+fenv,mul:0.85) * env;
	sig = CompanderD.ar(sig,0.85,1,1/10);

	Splay.ar(sig,0.1);
};
)