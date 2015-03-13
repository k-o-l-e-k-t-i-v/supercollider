

~s = {SinOsc.ar(1/16).range(0.01,9.01)};
~s.quant =2;
(
~a.fadeTime = 2;
~a={
	var sig,f,s;

	sig=SinOsc.ar(((60+[0,5,7,11,-12,-24,-48,-36,4,-7,-14]).scramble.midicps)*(1.00001**(1..9)));
	sig = sig * LFTri.ar(1/fib(12)).range(1,0);
	sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(1000.01,44.01));
	sig = sig + HPF.ar(BrownNoise.ar({Rand(0.001,0.5)}!8),{Rand(440,12000)}!8);

	sig = SelectX.ar(~s,sig);

	sig = CompanderD.ar(sig,0.9,1,0.01);
	sig= Limiter.ar(sig,0.5,0.01);

	Splay.ar(sig,0.1);
};

~a[50]=\filter->{|in| FreeVerb.ar(in,0.2,100)};

~a.play;
~a.quant=2;

)

s.scope;