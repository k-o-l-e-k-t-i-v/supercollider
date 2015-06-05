
(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)


(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)