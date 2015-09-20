Kolektiv(\alex);

~d.clear;
~d.play(vol:0.7, fadeTime:2);
(~d[0]={
	var sig, env, fenv, penv, renv;

	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\welch,\step]), \trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr, \freq.kr*8, \freq.kr], [0.01,0.05]), \trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1,1], [0.1,1,0.5]), \trig.tr);

	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.2)*Decay.ar(Impulse.ar([2,3,1]),0.5),penv);
	sig*env;
};
)
~d[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([4,2],inf), \trig,1);
(~d[2]=\set-> Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[2,3],[3,2],[1,2,3]],inf),
\degree, Pseq([[1,4,2], [5,1,2]],inf) );)
~d[30]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,[10,40],10),0.7)};
~d[31]=\filter-> {arg in; LPF.ar(in,\lpf.kr(200))};


~f.clear;
~f.scope;
~f.play(vol:0.1, fadeTime:2);
(~f[0]={
	var sig, env, fenv, penv, renv;

	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\welch,\step]), \trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr, \freq.kr*3, \freq.kr], [0.1,1]), \trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \trig.tr);
	renv=EnvGen.kr(Env([0.01,0.001,0.3], [1,0.5]), \trig.tr);


	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3,1]);
	sig*env;
};
)
~f[1]=\set-> Pbind(\args, [\trig], \dur, 4, \trig,1);
(~f[2]=\set-> Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[4,6,5],[5,3,7],[6,3]],inf),
\degree, Pseq([[4,2,8], [5,7,2]],inf) );)

~f[30]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};



~g.clear;
~g.play(vol:0.06, fadeTime:2);
(~g[0]={
	var sig, env, fenv, penv, renv;

	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\welch,\step]), \trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr, \freq.kr*3, \freq.kr], [0.01,1]), \trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \trig.tr);

	sig=LFSaw.ar([\freq.kr,\freq.kr+2,\freq.kr+4,\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\freq.kr,renv)
	).lag([0.001, 0.002, 0.003,0.004]);
	sig=Balance2.ar(sig*LFSaw.ar([0.125,0.05]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(1));
	sig*env;
};
)
~g[1]=\set-> Pbind(\args, [\trig], \dur, 10, \trig,1);
(~g[2]=\set-> Pbind(\args, [\freq], \dur, 8, \octave, Pseq([[2,3],[1,3],[2,3]],inf),
\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)

~g[30]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10,add:in*0.2),0.7)};

~g[31]=\filter->{arg in; LPF.ar(in, \lpf.kr(2400))};




