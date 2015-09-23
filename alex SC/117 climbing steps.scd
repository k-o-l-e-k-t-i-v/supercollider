p=ProxySpace.push(s);
currentEnvironment.free;

//voices
~o.play( vol:0.5, fadeTime:2).quant_(4);
(
~o[0]={
	var sig, env, nenv, fenv;

	env=EnvGen.kr(Env(levels:[0,1,0],times:[1,4],curve:[\welch,\lin]), \trig.tr);
	fenv=EnvGen.kr(Env(levels: [1,\top.kr(5,2),0.5],times:[1,4],curve:[\step,\lin]), \trig.tr);
	nenv=EnvGen.kr(Env(levels:[0,0.7,0,0.2],times:[0.5,2,0.5],curve:[\welch,\step, \welch]), \trig.tr);

	sig= BPF.ar(WhiteNoise.ar([0.5,1,2,0.7,0.4,3,2])+GrayNoise.ar(1),\freq.kr*[1,2,3,5,8].reciprocal,
		rq:LFSaw.ar([0.5,0.125,3]).range(0.1,0.01),mul:2)*LFSaw.ar(fenv!2);
	sig*env;
};
)
~o[1]=\set-> Pbind(\args, [\trig], \dur, 5, \trig,1 );
~o[2]=\set-> Pbind(\args, [\freq], \dur, 4, \freq, Pseq([400,165,850,600,200,1200,330,220,110,770],inf) );
~o[3]=\set-> Pbind(\args, [\top], \dur, 7, \top, Prand([2,10,5,3],inf) );

~o[30]=\filter-> {arg in; Rotate2.ar(in, LPF.ar(in, \lpf.kr(400)),SinOsc.kr(1))};
~o[31]=\filter-> {arg in; GVerb.ar(in,100,revtime:20,damping:LFNoise2.kr(1/5).range(0.1,0.8),inputbw:0.7,maxroomsize:140)}


//climbing up stairs
~n.play( vol:0.5, fadeTime:2).quant_(4);
(
~n[0]={
	var sig, env, nenv, fenv;

	env=EnvGen.kr(Env(levels:[0,1,0],times:[1,4],curve:[\welch,\lin]), \trig.tr);
	fenv=EnvGen.kr(Env(levels: [1,\top.kr(5,2),0.5],times:[1,4],curve:[\step,\lin]), \trig.tr);
	nenv=EnvGen.kr(Env(levels:[0,0.7,0,0.2],times:[0.5,2,0.5],curve:[\welch,\step, \welch]), \trig.tr);

	sig= BPF.ar(WhiteNoise.ar([0.5,1,2,0.7,0.4,3,2])+GrayNoise.ar(1),\freq.kr*[1,2,3,5,8].reciprocal,
		rq:LFSaw.ar(fenv!2).range(1,0.001),mul:2)*LFSaw.ar(fenv!2);
	sig*env;
};
)
~n[1]=\set-> Pbind(\args, [\trig], \dur,6, \trig,1 );
~n[2]=\set-> Pbind(\args, [\freq], \dur, 4, \freq, Pseq([65,85,150,200,400],inf));
~n[3]=\set-> Pbind(\args, [\top], \dur, 6, \top, Pseq([2,6],inf) );

~n[30]=\filter-> {arg in; Rotate2.ar(in, LPF.ar(in, \lpf.kr(400)),SinOsc.kr(1))};
~n[31]=\filter-> {arg in; GVerb.ar(in,40,revtime:2,damping:0.01,inputbw:0.2,maxroomsize:140)}
