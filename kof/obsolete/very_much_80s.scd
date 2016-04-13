


(
~w.fadeTime=4;
~w.quant=4;
~w.play;
~melod = {Duty.kr(4,0,Dseq(powerset([1,1.5,2,1.25,4,1.125,0.5]).scramble.flat,inf))};
~melod.quant=2;
)

(
~w={
	var t,env,sig,tempo;

	tempo = 1/8;

	t = Impulse.ar(tempo*8,1/4*(0..3));
	env = Decay.ar(t,1.75);
	sig = LFSaw.ar(43.2 * pi * [1,2,8,4]*(1.00001**(1..8)/~melod),mul:0.95)*env;

	t = Impulse.ar(tempo*8,1/4*(0..3));
	env = Decay.ar(t,1.5);
	sig = LFSaw.ar(43.2 * pi * [1,2,8,4]*(1.0001**(1..8)/~melod),mul:0.95)*env*sig;


	t = Impulse.ar(tempo,1/4*([0,1,2,3,3.25,3.5]+0.5));
	env = Decay.ar(t,0.3);
	sig = LFSaw.ar(16pi*43.2/~melod,mul:0.5) * env + sig;

	sig = MoogFF.ar(sig,env.sqrt+1*LFTri.ar(1/4/fib(6)).range(300,4000) );


	t = Impulse.ar(tempo*2,1/8*(1..7));
	env = Decay.ar(t,1.5);
	sig = SinOsc.ar(43.2+(1+env.sqrt),mul:0.95) * env + sig;



	t = Impulse.ar(tempo*2,1/8*((0..7)+0.5));
	env = Decay.ar(t,0.45);
	sig = HPF.ar(BrownNoise.ar(0.9!2)*env,1+env.sqrt*3000) + sig;

	t = Impulse.ar(tempo,1/8*((0..7)+0.5));
	env = Decay.ar(t,0.1);
	sig = HPF.ar(WhiteNoise.ar(0.4!2)*env,env.sqrt*10000) + sig;


	sig = CompanderD.ar(sig,0.85,1/1.5,1/6)+sig;
	sig = FreeVerb.ar(sig,0.15,7.5)*1.125+sig;

	Splay.ar(sig,0.1);
}
)
~w.stop(10)
s.scope;