p=ProxySpace.push(s);


~t.play(fadeTime:10, vol:0.2).quant_(2);
~t.clock=TempoClock(126/60).permanent_(true);
(
~t[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[2,0.01],curve:[\welch, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*1.5,\freq.kr],[2,0.01],curve:[\welch, \welch]),\trig.tr);
	sig= LFSaw.ar(fenv!2,mul:0.2)+LFNoise2.ar(SinOsc.kr(0.25).range(80,100),0.1)+SinOsc.ar([40.1,51.0],mul:0.2);
	sig=sig*env;};
)
~t[1]=\set-> Pbind(\args, [\trig], \dur, 24, \trig, 1);
~t[2]=\set-> Pbind(\args, [\freq], \dur, 10, \octave, Pseq([1],inf), \degree, Pseq([Pn([2,1],4),[2,-4]],inf ));


~t[30]=\filter-> {arg in; GVerb.ar(in,[20,10,40,2],[15,40,12,20],mul:0.5,add:LPF.ar(in*0.7,200))};
~t[31]=nil;



~f=NodeProxy.new(s, \audio, 2);
~f.play(fadeTime:2, vol:0.2);
~f.quant_(2);
~f.clock=TempoClock(148/60).permanent_(true);
(~f[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.02],curve:[\welch, \welch]),\trig.tr);
	sig=HPF.ar(WhiteNoise.ar(0.5)+ClipNoise.ar(0.1),\freq.kr)*env;
	// Pan2.ar(sig);
};
)
~f[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pn(1,2),Pn(0.25,2),Rest(2.25)],inf), \trig, 1);
~f[2]=\set-> Pbind(\args, [\freq], \dur, 12, \freq, 11000);

~f[30]=\filter->{arg in; CombN.ar(in,2,SinOsc.kr(0.5).range(0.1,0.01),2)};
~f[31]=\filter->{arg in; Pan2.ar(Mix.ar(GVerb.ar(in,roomsize:40,revtime:20)),SinOsc.kr(2))};
~f[32]=\filter-> {arg in; LPF.ar(GVerb.ar(in,180,20)*0.8,SinOsc.kr(0.025).range(100,4500)).lag(0.01)};

~f.rebuild
~f.scope


~g=NodeProxy.new(s, \audio, 2);
~g.play(fadeTime:2, vol:2);
~g.quant_(2);
~g.clock=TempoClock(148/60).permanent_(true);
(~g[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.2],curve:[\welch, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],times:[0.01,0.04],curve:[\welch, \welch]),\trig.tr);
	sig=SinOsc.ar(fenv!2+[1,2,3,5,8,13,21,33].reciprocal)*env;
	// Pan2.ar(sig);
};
)
~g[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pn(1,2),Pn(0.25,2),Rest(0.25),Pn(1,2),Rest(1)],inf), \trig, 1);
~g[2]=\set-> Pbind(\args, [\freq], \dur, 2, \octave,[3,1,2],\degree, Pseq([Pn([2,6],4),Pn([5,7,3],4)],inf));

~g[30]=\filter->{arg in; CombN.ar(in,2,1,4)};
~g[31]= \filter-> {arg in; Limiter.ar(in+ FreeVerb.ar(in,room:[1,0.7],mul:0.4),0.5)};