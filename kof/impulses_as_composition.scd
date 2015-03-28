

(
~a.play;
~a.quant=4;
~a = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(4,0,Dseq([1,1.25,1.125,1.5,2,4],inf));

	t = Impulse.ar(1/4,1/4*[0,1,1.25,2,3,3.25,3.75]);
	env = Decay.ar(t,TExpRand.ar(0.5,5.75,t));
	fenv = Decay.ar(t,TExpRand.ar(0.2,0.15,t)).exprange(0.0001,1.01+(sel*1000.0));

	sig = SinOsc.ar(44+fenv,mul:0.85) * env;
	sig = CompanderD.ar(sig,0.75,1,1/10);

	Splay.ar(sig,0.1);
};
)

(
~hiss.play;
~hiss.quant=4;
~hiss = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(1/2,0,Dseq([1,1.125,2,4],inf));

	t = Impulse.ar(1/4,1/4*[0.5,1.5,2.5,3.5]);
	env = Decay.ar(t,TExpRand.ar(0.15,0.5,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.15,t)).exprange(100.0001,10.01+(sel*5000.0));

	sig = WhiteNoise.ar(0.2!2) * env;
	sig = HPF.ar(sig,fenv);
	sig = CompanderD.ar(sig,0.75,1,1/10);

	Splay.ar(sig,0.1);
};

)

(
~tone.play;
~tone.quant=4;
~tone = {
	var env,fenv,sig,t,sel,tone;
	sel = (60+[5,7,9,4,-7,-12,-24,12,24,12,-24,-48]+36).scramble;

	t = Impulse.ar(1/8,1/16*[0,1,2,3]);
	env = Decay2.ar(t,0.25,TExpRand.ar(0.5,0.95,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.5,t)).exprange(10.01+(15000.0),10.0001);

	sig = LFSaw.ar(sel.midicps*(1.00001**(1..8))+SinOsc.ar([4,5,6,7],0,4),mul:0.025) * LFSaw.ar(8/(fib(12))).range(0,1);
	sig = Resonz.ar(sig,fenv);
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.1);
};

)

(
~subtone.play;
~subtone.quant=4;
~subtone = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(4,0,Dseq((60+[5,7,9,4,-7,-12,-14,24,48]-12).pyramid.scramble,inf));

	t = Impulse.ar(1/8,1/4*[0,1,2,3]);
	env = Decay2.ar(t,0.25,TExpRand.ar(0.5,0.95,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,1.5,t)).exprange(10.01+(15000.0),10.0001);

	sig = LFSaw.ar(sel.midicps*(1.00001**(1..8)),mul:0.05) * LFSaw.ar(1/4/(1..8)).range(0,1);
	sig = BBandPass.ar(sig,fenv*SinOsc.ar(1/4/(1..8)).range(1,0.1) );
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.1);
};

)