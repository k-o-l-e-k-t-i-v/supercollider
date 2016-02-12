p=ProxySpace.push(s);
(
~kick.quant=4;
~kick={

	var env,t,sig;

	t = Impulse.ar(1/2,[0,2,4,6]++[0.5]/8);

	// basic layer, deep tone
	env = Decay2.ar(t,0.002,0.5+TExpRand.ar(0.05,0.5,Impulse.ar(4)));
	sig = SinOsc.ar(44+(env**5*100),0.5)*env;

	// little noise hit in the beginning
	env = Decay2.ar(t,0.0002,0.19,0.9,0.000001);
	sig =LPF.ar(WhiteNoise.ar(0.6!2),800+(env**2*2000))*env + sig;

	// tail, deep tone
	env = Decay2.ar(t,0.005,1.0,0.9,0.000001);
	sig = SinOsc.ar(44.1!2+(env**4.8))*env+sig;

	// makeup
	sig = CompanderD.ar(sig,0.9,1/1.45,1/2);

	Splay.ar(sig,0.1);
};
~kick.play;
);

s.scope;


(
~hat.quant=4;
~hat={

	var env,t,sig;

	t = Impulse.ar(1/4,(0..7)+0.5++[0.25,0.5,0.75]/8);


	//his in the beginning
	env = Decay2.ar(t,0.0002,0.149,0.9,0.000001);
	sig = HPF.ar(WhiteNoise.ar(0.8!2),400-(env**2*200))*env;


	//his in the beginning
	env = Decay2.ar(t,0.02,0.59,0.9,0.0001);
	sig = RHPF.ar(WhiteNoise.ar(0.1!2),12000+(env**1.51*8000))*env+sig;



	sig = CompanderD.ar(sig,0.9,1/1.25,1/2);

	Splay.ar(sig,0.1);
};
~hat.play;
)


//very cool. I've been doing this with Synths and delay because it's easier to control time-wise