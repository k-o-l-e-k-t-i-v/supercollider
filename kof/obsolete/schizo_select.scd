
(
~a.play;
~s = {Duty.kr(1/4,0,Dseq([0,1,2,3,0,0,0,0],inf))};

~oct = {Duty.kr(8,0,Dseq([0,12,24,36],inf))};

~m = {Duty.kr(1,0,Dseq([60,65,64,65,67,63,72]-~oct,inf))};

~m.quant=2;

~s.quant=2;
~a.quant=2;
~a.fadeTime = 0.01;
)

(
~a={
	var sigs,sel,env,f,l;

	l = [0.25,0.5,0.5,0.25];

	f = ~m.midicps;

	env = Decay.ar(Impulse.ar(8),Select.kr(~s,l));

	sigs = [
		SinOsc.ar(43.2*(env.exprange(10.0001,1.01))),
		Blip.ar(f*1.5,TExpRand.ar(10,100,Impulse.ar(1!4))),
		Pluck.ar(Saw.ar(f*(1-env)),Impulse.ar(4),0.5,0.5),
		HPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4)))
	];

	sel = Select.ar(~s,sigs) + LFSaw.ar(f*(1..8),mul:0.5);
	sel = BBandPass.ar(sel,LFSaw.ar(4/[1,2,4,8]).exprange(16000.01/(1..8),44)) + (sel*env);
	sel = CompanderD.ar(sel,0.75,1,1/10);
	sel = FreeVerb.ar(sel,0.2,0.5);

	Splay.ar(sel);

};
)