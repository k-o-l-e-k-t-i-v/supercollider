

(
~a={
	var f = Duty.kr(4,0,Dseq([60,63,65,64].midicps,inf)).lag(1/2);
	var t = Impulse.ar(1/8,(0..7)/8++((0..3)/4));
	var env = Decay.ar(t,4);
	var sig2 = 0;
	var sig = 0;

	f = f * Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf));

	sig = SinOsc.ar(50+(env+0.0001**30.01*250+1));

	sig2 = (SinOsc.ar(f.lag(1/8)/([1.5,1.25,1,2])*(1.001**(1..8)),pi).lag(SinOsc.kr(1/4/(1..8)).exprange(0.00001,0.001))*LFTri.ar(1/4/[1,2,4,8],pi).exprange(0.01,0.2) ) / 4;

	sig2 = sig2 + (SinOsc.ar(f.lag(1/4)/([1.5,1.25,1,2])*(1.0001**(1..8))*20+SinOsc.kr(1/[1,2,4,8]).range(-10,10),pi).lag(SinOsc.kr(1/4/(1..8)).exprange(0.00001,0.001))*LFTri.ar(1/4/[1,2,4,8],pi).exprange(0.01,0.2) ) / 8;


	sig2 = Vibrato.ar(sig2,[4,5,6,7],0.3).distort;
	sig2 = CombN.ar(sig2,0.02,4,32);

	sig = sig2 + (sig * env);

	sig = HPF.ar(sig,40);
	sig = LPF.ar(sig,1500);


	t = Impulse.ar(1/8,(0..7)++[0.25,0.5]+0.5/8);
	env = Decay.ar(t,[0.25,1]);
	sig2 = BPF.ar(WhiteNoise.ar(0.25!7).distort,LFDNoise0.kr(2!4).range(1400,20000));
	sig2 = CombN.ar(sig2,0.015,0.018,32);
	sig2 = BPF.ar(sig2.distort,LFDNoise1.kr(20!4).range(1400,20000)) + sig2 / 10;

	sig = sig2 * env + sig;


	sig = CompanderD.ar(sig,0.75,1/2,1/8).softclip;
	sig = Limiter.ar(sig,0.9);
	sig = GVerb.ar(sig)/5+sig/3;

	Splay.ar(sig,0.1);
};
~a.play;
~a.quant=4;

~barrel={
	var sig2;
	var sig = PinkNoise.ar(0.1!4);
	var t = Impulse.ar(1/8,(0..3)/4);
	var times = TExpRand.ar(1.01,8,t);
	var slopes = TExpRand.kr(0.33,2,t);
	var freq = TExpRand.kr(20.01,12000,t);


	var env1 = EnvGen.ar(Env([20000,freq,4],[1.2,1.2]*times,[3,-3]*slopes),t);
	var env2 = EnvGen.ar(Env([0.01,1,0.001],[1.2,1.2]*times,[3,-3]*slopes),t);
	var env3 = EnvGen.ar(Env([0,1,0],[1.2,1.2]*times,[3,-3]*slopes),t);


	sig = BBandPass.ar(sig,env1,env2,env3);

	sig2 = DynKlank.ar(`[Array.fill(12,{TExpRand.ar(55.01,140,t).round(44/pi).lag(1/8)}),nil,Array.fill(4,{TExpRand.ar(1.001,4,t)})],sig/20.0);
	sig2 = Limiter.ar(sig2,0.75);

	sig2 = GVerb.ar(sig2)/5+sig/2;
	sig2 = HPF.ar(sig2,200);
	sig2 = LPF.ar(sig2,14000);
	sig2 = CompanderD.ar(sig2,0.5,1/1.5,1/2)/2;

	Splay.ar(sig2,0.1,0.75);
};
~barrel.quant=2;
~barrel.play;


)


s.scope