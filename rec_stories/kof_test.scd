///////////////////////////////////////////////////
// History, as it was on Wed May 13 18:31:39 2015.
///////////////////////////////////////////////////

// - 0:0:0 - () 
(
~human={
	var sig,env,fenv,tenv,imp,mod1,mod2;
	mod1 = Duty.kr(4,0,Dseq([1,1,2,1,4,2,4],inf)).lag(1/10);
	mod2 = Duty.kr(4,0,Dseq([1,1.5,1.25,1.125,2,4],inf)).lag(1/10);
	imp = Impulse.ar(1/4,(0..7)++[0.5,0.25]/8);
	imp = TDelay.ar(imp,TExpRand.ar(0.001,0.125,imp));
	env = EnvGen.ar(Env.perc(0.01,2),imp);
	fenv = EnvGen.ar(Env.perc(0.0005,0.025,LFDNoise1.ar(1/[7,8,3,2]).exprange(150.01,350)),imp);
	tenv = EnvGen.ar(Env.perc(0.5,0.0025),imp);

	sig = SinOsc.ar([50,75,50,100]+fenv) * env + (LFSaw.ar(43.2*(mod1*0.5pi)) + SinOsc.ar(4320/(mod2*pi)) * tenv / 8) / 2;
	sig = Vibrato.ar(sig,[4,5,6,7]/4,0.2);
	sig = Limiter.ar(sig.softclip.distort,1,0.01);
	sig = BPF.ar(sig,LFDNoise1.ar(1/4/[7,8,3,2]).exprange(150.01,15000)) + LPF.ar(sig,150);
	sig = CompanderD.ar(sig,0.75,1/2,1/2);

	Splay.ar(sig.flat,0);

};
~human.quant=2;
~human.fadeTime=2;
~human.play;
)

// - 0:0:30.00 - (me) 
(
~q.quant=2;
~q.fadeTime=4;
~q={
	var sig,tb,env,sig2;
	sig = WhiteNoise.ar(1!8) + LFSaw.ar([44,44.1]*(_*2!8)*(1.0001**(1..8))) + SinOsc.ar([8800,880.3*1.5,440.2,4400.1]);

	sig = BPF.ar(sig,110*(1..12),LFSaw.ar(1/32/fib(8)).exprange(0.01,1.0001)**5 ,mul:LFSaw.ar(1/32/fib(8)).range(0.001,1)**3 );


	sig = CompanderD.ar(sig,0.75,1/4,1/10);
	tb = Impulse.ar(1/32/fib(8),0.5);
	env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,6],[3,-3]),tb);
	sig = SinOsc.ar(50!2*(env**(0.02)+1)) * env + sig;

	sig = FreeVerb.ar(sig,0.1*(1..5),10.5/(1..5));

	Splay.ar(sig,0.1,0.5);
};
~q.play;
)

// - 0:1:00.00 - (me) 

(
~human.stop;
~q.stop;
)

)

