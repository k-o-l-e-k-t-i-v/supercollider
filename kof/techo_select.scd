
(
~seven.quant =2;
~seven.play;
~s.quant=2;
~s = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

~seven={

	var sigs,sel,env,f,l;

	sigs = [
		SinOsc.ar(70),
		HPF.ar(WhiteNoise.ar(0.2!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Blip.ar(1986,{TExpRand.ar(10,100,Impulse.ar(4!4))} ) / 4,
		RLPF.ar(WhiteNoise.ar(0.2!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Pluck.ar(Pulse.ar(4000),Impulse.ar(4),0.5,0.5) / 8
	];

	sel = Select.ar(~s,sigs);
	sel = CompanderD.ar(sel,0.9,1,1/10);
	//sel = FreeVerb.ar(sel,0.12,~n7);

	Splay.ar(sel.flat,0.2,~n7);

};
)

