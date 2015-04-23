

(
~a={
	var i = Impulse.kr(1/[5,64],(1..64)+[0.5,0]/64);
	var mod = Select.kr(TExpRand.kr(0.0001,5,i),[1,1.5,2,1.25]);
	var sig;
	var sig1 = SinOsc.ar(43.2*(mod)*8pi/(((1+(1/(1..64)**2)))),8pi/(1..64),mul:0.5/(1..64)) * Decay.kr(i,0.45);
	var sig2 = SinOsc.ar(43.2*mod*2pi/(((1+(1/(1..64)**2)))),8pi/(1..64),mul:0.25/(1..64)) * Decay.kr(i,10.75);

	sig1 = Mix(sig1);
	sig2 = Mix(sig2);


	sig = SelectX.ar(LFTri.ar(1/4/(1..64),0.5)**4+0.0001,[sig1,sig2])/16;
	sig = Mix(sig);
	sig = GVerb.ar(sig,100,3)/8+sig/2;
	Splay.ar(sig,0.1);
};
~a.quant=2;
~a.play;
)

s.scope