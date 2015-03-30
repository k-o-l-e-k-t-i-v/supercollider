

(
~kick.quant=1;
~kick={

	var env,t,sig;

	t = Impulse.ar(1/8,[0,1,2,3]/4);

	env = EnvGen.ar(Env([0,1,0],[1.5,1.75],[3,-4]),t);
	sig = Pulse.ar([1,2,3,1.5].octcps*(1/[1,2,4,8]+1)*pi/4+((env**5.51*PinkNoise.ar(80))+1)*(1.000015**(1..11)),mul:0.15)*env;

	t = Impulse.ar(1/[4,2],[0,0.5,1,1.5,2,2.5,3]/4);
	env = EnvGen.ar(Env([0,1,0],[0.005,0.75],[3,-4]),t);
	sig = SinOsc.ar([44,55] * (env**4+1)) * env * ToggleFF.ar(Impulse.ar(1/[2,4])) + sig;

	t = Impulse.ar(1/4,[0,1,2,3,3.5]+0.5/4);
	env = EnvGen.ar(Env([0,1,0],[0.005,0.15],[3,-4]),t);
	sig = RHPF.ar(WhiteNoise.ar(0.06!2), (env**4000+1000) ) * env + sig;


	t = Impulse.ar(1/48,[0,1,2,3]+0.5/4);
	env = EnvGen.ar(Env([0,1,0],[3.5,0.5],[3,-4]),t);
	sig = RHPF.ar(LFSaw.ar(6.octcps*pi/[1,1.25,1.5,1.125]+SinOsc.ar(11).range(-4,4),mul:0.1), (env.pow(4)+1)*2000 ) * env + sig;


	sig = LPF.ar(sig,44*(8*(1..12))*(LFSaw.ar(1/4/fib(12)).pow(3)+1))+(sig);
	sig = CompanderD.ar(sig,0.5,1/1.45,1/2);
	sig = FreeVerb.ar(sig,0.3,3);

	Splay.ar(sig,0.1);
};
~kick.play;
);
