p=ProxySpace.push(s);

~t.clear;
~t.play(fadeTime:10, vol:0.8).quant_(2);
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


~f.clear;
~f=NodeProxy.new(s, \audio, 2);
~f.play(fadeTime:2, vol:0.8);
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

~f[30]=\filter->{arg in; CombN.ar(in,2,SinOsc.kr(0.5).range(0.1,1),2)};
~f[31]=\filter->{arg in; Pan2.ar(Mix.ar(GVerb.ar(in,roomsize:40,revtime:20)),SinOsc.kr(2))};
~f[32]=\filter-> {arg in; LPF.ar(GVerb.ar(in,180,[20,10])*0.8,SinOsc.kr(0.025).range(100,4500)).lag(0.01)};

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
~g[2]=\set-> Pbind(\args, [\freq], \dur, 2, \octave,[3,2,1],\degree, Pseq([Pn([4,8],4),Pn([5,7,3],4)],inf));

~g[30]=\filter->{arg in; CombN.ar(in,2,1,4)};
~g[31]= \filter-> {arg in; Limiter.ar(in+ FreeVerb.ar(in,room:[1,0.7],mul:0.8),0.35)};
~g[32]=\filter-> {arg in; LPF.ar(in,\lpf.kr(4800))};




~h.clear;
~h=NodeProxy.new(s, \audio, 2,2);
~h.mold(2);
~h.play(fadeTime:2, vol:0.3);
~h.quant_(2);
~h.clock=TempoClock(126/60).permanent_(true);
(~h[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env.perc(releaseTime:0.08),\trig.tr);
	sig=HPF.ar(WhiteNoise.ar(0.5!2),\freq.kr)*env;

};
)
~h[1]=\set-> Pbind(\args, [\trig], \dur,Pseq([Pn(0.25,4),Rest(1)],inf), \trig, 1);
~h[2]=\set-> Pbind(\args, [\freq], \dur, 2, \octave,[10,9],\degree, Pseq([Pn([8,9],5),[2,4]],inf));

~h[30]=\filter->{arg in; Pan2.ar(Mix.ar(in),\pos.kr)};
~h[31]=\set-> Pbind(\args, [\pos], \dur, Pseq([Pn(0.2,4),Rest(0.8)],inf), \pos, Pseq([0],inf));
~h[32]=\filter-> {arg in; GVerb.ar(in,100,20,mul:0.8,add:in)};

~h[34]=\filter-> {arg in; LPF.ar(in, \lpf.kr(8000))};



~n.clear;
~n=NodeProxy.new(s, \audio, 2,2);
~n.mold(2);
~n.play(fadeTime:2, vol:0.3);
~n.quant_(2);
~n.clock=TempoClock(126/60).permanent_(true);
(~n[0]={

	var sig;
	sig=LFPulse.ar([1,2,3,5,8]/4)*BPF.ar(BrownNoise.ar([0.3,0.5]),\freq.kr);

};
)
~n[1]=\set-> Pbind(\args, [\freq], \dur, 2, \octave,Pseq([[5,9], [4,7], [2,8], [7,3]],inf),\degree, Pseq([Pn([8,9],5),[2,4]],inf));
~n[30]=\filter-> {arg in; GVerb.ar(in,400,20)};








~m.clear;
~m=NodeProxy.new(s, \audio, 2,2);
~m.mold(2);
~m.play(fadeTime:10, vol:0.3);
~m.quant_(2);
~m.clock=TempoClock(126/60).permanent_(true);
(~m[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env.perc(releaseTime:6),\trig.tr);
	sig=LFPulse.ar(\freq.kr+[1,3,5,8,13,21].reciprocal)*LFSaw.ar([2,1,0.5,0.25,3])+FreeVerb.ar(CombN.ar(Impulse.ar([2,0.125],[0,0.1,0.2]),1,0.1),room:2);
	sig=sig+(SinOsc.ar(\freq.kr+[1,3,5].reciprocal+[400,800])*Decay2.kr(Impulse.kr([2,0.25,1,0.125,0.5]),decayTime:0.2));
	sig*env;
};
)
~m[1]=\set-> Pbind(\args, [\trig], \dur,5, \trig, 1);
~m[2]=\set-> Pbind(\args, [\freq], \dur, 20, \octave,Pseq([[2,1],[3,1],[4,2]],inf),\degree, Pseq([Pn([8,9],3),[2,4]],inf));
~m[30]=\filter-> {arg in; GVerb.ar(in,40,[5,4],SinOsc.kr([0.25,0.5]).range(0.1,1),add:in.lag(0.01))};
~m[31]=\filter-> {arg in; LPF.ar(in, \lpf.kr(1500))};




~b.clear;
~b.play(fadeTime:2, vol:0.2).quant_(2);
~b.clock=TempoClock(126/60).permanent_(true);
(
~b[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.1],curve:[\welch, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*2,\freq.kr],[40,0.01],curve:[\welch, \welch]),\trig.tr);
	sig= LFSaw.ar(fenv!2,mul:0.4).lag([0.001,0.002])+SinOsc.ar(fenv!2+80,mul:0.6);
	sig=sig+(LFSaw.kr([2,5,2/5])*BrownNoise.ar(0.4));
	sig=sig*env;};
)
~b[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pn(0.6,3),Rest(0.6),Pn(0.4,2)],inf), \trig, 1);
~b[2]=\set-> Pbind(\args, [\freq], \dur, 1, \octave, [1,2] , \degree, [2,4,8,6]);

~b[30]=\filter-> {arg in; GVerb.ar(in,[90,40,80],[20,50,10],SinOsc.kr([0.125,0.025]).range(0.1,1),mul:[0.2,0.4])};
~b[31]=\filter-> {arg in; LPF.ar(in, \lpf.kr(1000))};
~b[32]=\set-> Pbind(\args, [\lpf], \dur, 10, \lpf, Pseq([Pseq([150,250,350,500,700,1500],1),2500],1));




~k=NodeProxy.new(s, \audio, 2);
~k.play(fadeTime:2, vol:1);
~k.quant_(2);
~k.clock=TempoClock(126/60).permanent_(true);
(~k[0]={
	var sig, env, fenv, nenv;

	env=EnvGen.kr(Env(times:[0.01,0.2],curve:[\welch, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],times:[0.01,0.04],curve:[\welch, \welch]),\trig.tr);
	nenv=EnvGen.kr(Env([0,\noise.kr,0,\noise.kr*2,0],times:[0.01,0.01,0.01,0.01,],curve:[\welch, \welch]),\trig.tr);

	sig=SinOsc.ar(fenv!2+[1,2,3,5,8,13,21,33].reciprocal,add:WhiteNoise.ar(nenv))*env;
	// Pan2.ar(sig);
};
)
~k[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pn(0.25,4),Rest(1)],inf), \trig, 1);
~k[2]=\set-> Pbind(\args, [\freq], \dur, 2, \octave,[1,2],\degree, Pseq([Pn(Pseq([2,4,3],1),16),Pn([4,6],4)],inf));
~k[3]=\set-> Pbind(\args, [\noise], \dur, 2, \noise, Pseq([Pseq([Pn(0.1,4),Pn(0,3)],4),Pn(0,10)],inf));


~k[32]=\filter->{arg in; Limiter.ar(CompanderD.ar(in,1,0.8,SinOsc.kr(0.125).range(0.2,1.5)),0.6)};
~k[33]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,20,[0.5,0.7,0.2],[0.1,0.5,0.6],add:in*2),0.7)};
~k[34]=\filter-> {arg in; LPF.ar(in,\lpf.kr(400))};



~klang=NodeProxy.new(s, \audio, 2);
~klang.play(fadeTime:2, vol:1);
~klang.quant_(2);
~klang.clock=TempoClock(126/60).permanent_(true);
(~klang[0]={
	var sig, env, fenv, nenv;

	env=EnvGen.kr(Env(times:[0.01,0.2],curve:[\welch, \welch]),\trig.tr);
	sig=Klank.ar(`[\freq.kr+[1,2,3,5,8,13,21,33],nil,[1,2,3,5,8,13,21,33].reciprocal],env
	// Pan2.ar(sig);
};
)
~klang[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pn(0.25,4),Rest(1)],inf), \trig, 1);
~klang[2]=\set-> Pbind(\args, [\freq], \dur, 2, \octave,[1,2],\degree, Pseq([Pn(Pseq([2,4,3],1),16),Pn([4,6],4)],inf));
~klang[3]=\set-> Pbind(\args, [\noise], \dur, 2, \noise, Pseq([Pseq([Pn(0.1,4),Pn(0,3)],4),Pn(0,10)],inf));


~klang[32]=\filter->{arg in; Limiter.ar(CompanderD.ar(in,1,0.8,SinOsc.kr(0.125).range(0.2,1.5)),0.6)};
~klang[33]=\filter-> {arg in; Limiter.ar(GVerb.ar(in,20,[0.5,0.7,0.2],[0.1,0.5,0.6],add:in*2),0.7)};
~klang[34]=\filter-> {arg in; LPF.ar(in,\lpf.kr(400))};
