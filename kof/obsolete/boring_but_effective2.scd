
(
~xoxo.quant=2;
~xoxo.play;
~xoxo={
	var t,t2,t3,env,env2,env3,sig,sig2,sig3,temp,l1,l2,l3,melod;

	melod = Duty.kr(8,0,Dseq(powerset([1.25,1.5,1,0.75]).scramble.flat,inf));

	temp = 1/2;
	l1 = 0.5;
	l2 = 1.75;
	l3 = 0.125;

	t = Impulse.ar(temp/2,1/8*[0,1,2,3,4,5,6,7,7.25,7.5,7.75]);
	t2 = Impulse.ar(temp*[2,1],1/4*([0,0.5,1,1.25,1.5,1.75,2,3,3.5]));
	t3 = Impulse.ar(temp/2,1/4*([0,1,2,3,3.5,3.75]+0.5));

	env = Decay.ar(t,l1);
	env2 = Decay2.ar(t2,0.06,l2);
	env3 = Decay.ar(t3,l3);

	sig = (SinOsc.ar(50!2+(Decay.ar(t,0.02).exprange(1.0001,4400.0) ))*env);
	sig = Resonz.ar(sig,Decay.ar(t,0.1).exprange(4000.01,44));

	sig2 = LFSaw.ar(([24,36,24+4,24+4]+LFNoise0.ar(1/4!3).range(0,40).round(12)).midicps*(_*melod!4)*(SinOsc.ar(4.01).range(1.000001,1.001)**(1..8)),mul:0.295/(1..4));
	sig2= sig2 * SinOsc.ar(4/[1,2,4,8]).range(0,1);
	sig2=CombC.ar(sig2,0.002,4,32) * env2;

	sig3 = HPF.ar(WhiteNoise.ar(0.4!2)*env3,Decay2.ar(t2,0.02,0.07).exprange(14000.01,432.0));


	sig = CompanderD.ar(sig,0.95,1/1.25,1/6);

	sig = FreeVerb.ar(sig+sig2+sig3,0.1,0.5)*4;

	Splay.ar(sig,0);

}
)