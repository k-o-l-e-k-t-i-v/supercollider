
(
~b.play;
~s = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

~s.quant=2;
~b.quant =2;
)

(
~b={
	var sigs,sel,env,f,l;

	sigs = [
		SinOsc.ar(43.2),
		HPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Blip.ar(1986,{TExpRand.ar(10,100,Impulse.ar(4!4))} ),
		RLPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Pluck.ar(Pulse.ar(4000),Impulse.ar(4),0.5,0.5)
	];

	sel = Select.ar(~s,sigs);
	sel = CompanderD.ar(sel,0.9,1,1/10);
	sel = FreeVerb.ar(sel,0.12,2.5);

	Splay.ar(sel);

};
)


///uuuuu hello ^^  