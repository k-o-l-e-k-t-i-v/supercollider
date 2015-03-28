
(
~xoxo.quant=2;
~xoxo.play;
~xoxo={
	var t,t2,t3,env,env2,env3,sig,sig2,sig3,temp,l1,l2,l3,melod;

	melod = Duty.kr(1/4,0,Dseq(powerset([1.25,1.5,2,1,1.125]).scramble.flat,inf));

	temp = 1/2;
	l1 = 1;
	l2 = 0.5;
	l3 = 0.15;

	t = Impulse.ar(temp/2,1/8*[0,1,2,3,4,5,6,7,7.25,7.5,7.75]);
	t2 = Impulse.ar(temp,1/4*([0,1,2,3]));
	t3 = Impulse.ar(temp,1/4*([0,1,2,3]+0.5));

	env = Decay.ar(t,l1);
	env2 = Decay.ar(t2,l2);
	env3 = Decay.ar(t3,l3);

	sig = (SinOsc.ar(50!2+(Decay.ar(t,0.02).exprange(1.0001,4400.0) ))*env);
	sig = Resonz.ar(sig,Decay.ar(t,0.1).exprange(4000.01,44));

	sig2 = LPF.ar((SinOsc.ar(432.0*(_*melod!4) )*env2),Decay.ar(t2,0.02).exprange(1400.01,43.2) );

	sig3 = HPF.ar(WhiteNoise.ar(0.2!2)*env3,Decay.ar(t2,0.02).exprange(14000.01,432.0));


	sig = CompanderD.ar(sig,0.75,1/1.5,1/4);

	sig = FreeVerb.ar(sig+sig2+sig3,0.1,0.5);

	Splay.ar(sig,0);

}
)