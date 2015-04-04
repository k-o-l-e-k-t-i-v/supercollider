

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

	Splay.ar(sig,0.1);
};
~q.play;
)
