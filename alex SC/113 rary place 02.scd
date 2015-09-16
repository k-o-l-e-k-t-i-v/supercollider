Kolektiv(\alex);
p.clock.tempo_(180/60);

~w.play(vol:0.7, fadeTime:1).quant_(4);
(
~w[0]={
	var sig, env;
	env=EnvGen.kr(Env([0,1,0],[0.1,7]),\trig.tr);
	sig=(LFSaw.ar([\freq.kr(185),\freq.kr+2]).lag(0.02)*LFPulse.kr([1/4,1/4*2]))*env;

};
~w[1]=\set->Pbind(\args, [\trig], \dur, 2, \trig, 1);
~w[2]=\set->Pbind(\args, [\freq], \dur, 12, \freq, Pseq([85,88,91,65,75],inf));
)

~w[30]=\filter-> {arg in; GVerb.ar(in,\room.kr(40,0.4),3)};

~w.scope;
~w.clear;


~d.play(vol:1, fadeTime:1).quant_(4);
(
~d[0]={
	var sig, env;
	env=EnvGen.kr(Env([0,1,0],[0.5,10]),\trig.tr);
	sig=CombN.ar(GrayNoise.ar(0.7),1/\freq.kr,1/\freq.kr,4)*env;

};
~d[1]=\set->Pbind(\args, [\trig], \dur, 6, \trig, 1);
~d[2]=\set->Pbind(\args, [\freq], \dur, 12, \freq, Pseq([45,55,61,65,75],inf));
)
~d[30]=\filter-> {arg in; OnePole.ar(in,[0.2,0.5,0.75,0.65])};
~d[31]=\filter-> {arg in; GVerb.ar(in,\room.kr(200,0.4),30,add:in)};
~d[32]=\filter->{arg in; Limiter.ar(in,0.7)};
~d[33]=\filter->{arg in; LPF.ar(in,\lpf.kr([300,400,100]))};

~d.clear(fadeTime:2);
~d.scope;


~x.scope;
~x.play(vol:0.8, fadeTime:1).quant_(4);
(
~x[0]={
	var sig, env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.04,0.2]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.001,0.04],\welch),\trig.tr);
	sig=SinOsc.ar([fenv, fenv+2],add:Dust2.ar(LFNoise1.kr(0.25).range(40,1500)));
	sig=sig*env;

};
~x[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Rest(2.65),0.35],inf), \trig, 1);
~x[2]=\set->Pbind(\args, [\freq], \dur, 16, \freq, Pseq([65,55,45],inf));
)

~x[30]=\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.9),\room.kr(50,0.4),add:in)};
~x[31]=\filter->{arg in; LPF.ar(in,\lpf.kr(1400))};
~x.clear;






~f.scope;
~f.play(vol:0.5, fadeTime:1).quant_(4);
(
~f[0]={
	var sig, env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.5,12]),\trig.tr);

	sig=BPF.ar(PinkNoise.ar([0.8,0.1,0.6]),\freq.kr+[0.2,0.5,0.25,0.125].reciprocal,rq:LFNoise1.kr(200).range(0.001,0.5));
	sig=sig*env;

};
~f[1]=\set->Pbind(\args, [\trig], \dur, 10, \trig, 1);
~f[2]=\set->Pbind(\args, [\freq], \dur, 10, \octave, [2,4,5], \degree, Pseq([[5,2], [4,3], [6,3]],inf));

)

~f[30]=\filter-> {arg in; GVerb.ar(in,\room.kr(2,2),10)};
~f[31]=\filter->{arg in; LPF.ar(in,\lpf.kr(300))};
~f.clear;


~g.scope;
~g.play(vol:0.1, fadeTime:1).quant_(4);
(
~g[0]={
	var sig, env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.02,0.7]),\trig.tr);

	sig=BPF.ar(GrayNoise.ar(0.8),rq:LFNoise1.kr(200).range(0.001,0.5));
	sig=sig*env;

};
~g[1]=\set->Pbind(\args, [\trig], \dur, 6, \trig, 1);
~g[2]=\set->Pbind(\args, [\freq], \dur, 16, \octave, [2,4,5], \degree, Pseq([[5,2], [4,3], [6,3]],inf));

)

~g[30]=\filter-> {arg in; GVerb.ar(in,\room.kr(20,2),40)};
~g[31]=\filter->{arg in; LPF.ar(in,\lpf.kr(400))};
~g[32]=\set->Pbind(\args, [\lpf], \dur, 12, \lpf, Pseq([200,300,400,600,1200],inf));

~g[33]=\filter-> {arg in; Balance2.ar(in, in,SinOsc.kr(0.25))};
~g.clear;



~b.play(vol:0.2, fadeTime:1).quant_(4);
(
~b[0]={
	var sig, env;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.2],[\step, \step]),\trig.tr);
	sig=HPF.ar(GrayNoise.ar([1,0.6,0.2,0.8]),\freq.kr+[0.25,0.5,0.125].reciprocal);
	sig=sig*env;

};
)
~b[1]=\set->Pbind(\args, [\trig], \dur, 2, \trig, 1);
~b[2]=\set->Pbind(\args, [\freq], \dur, 12, \freq, Pseq([14000,12000,6000,11000],inf));

~b[30]=\filter->{arg in; CombN.ar(in,2,\beat.kr(0.5),4)};
(
~b[31]=\set-> Pbind(\args, [\beat],
	\dur, Pseq([10,4,6,4],inf), \beat, Pseq([0.25,0.5,0.25,1],inf));
)
~b[33]=\filter-> {arg in; GVerb.ar(in,\room.kr([2,80,2,100],0.4),3,add:in)};

~b.scope;
~b.clear;





~n.scope;
~n.play(vol:1, fadeTime:4).quant_(12);
(
~n[0]={
	var sig1,sig2,sig, env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.5,4]),\trig.tr);

	sig1=LFSaw.ar([\freq.kr,\freq.kr+4,\freq.kr+8],add:BrownNoise.ar(0.1)).lag(0.01)*LFPulse.ar([0.5,1]);
	sig2=SinOsc.ar([45,46,47,48])*LFSaw.kr([2,1]);

	sig=Balance2.ar(sig1,sig2,LFSaw.kr(0.25),0.9)*env;

};
)
(
~n[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~n[2]=\set->Pbind(\args, [\freq], \dur, 16, \octave, [3,5,1], \degree,5);

)

~n[30]=\filter-> {arg in; GVerb.ar(in,\room.kr(20,2),1,mul:0.2,add:in*0.7)};
~n[30].clear;
~n.clear;





~m.scope;
~m.play(vol:5, fadeTime:4).quant_(4);

(
~m[0]={
	var sig3, env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.5,0.2]),\trig.tr);
	sig3=LFPulse.ar(\freq.kr+[1,2,3,5,8].reciprocal).lag([0.02,0.001])*env;
	};
)
(
~m[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~m[2]=\set->Pbind(\args, [\freq], \dur, 16, \freq, [65,67,68]);
)
~m[30]=\filter-> {arg in; GVerb.ar(in,\room.kr(20,2),1,mul:0.2,add:in*0.2).clip(-1,1)};
~m[31]=\filter->{arg in; LPF.ar(in,\lpf.kr(700))};
~m[32]=\filter-> {arg in; CombN.ar(in,4,1,4)};
~m.clear;



~k.scope;
~k.play(vol:0.8, fadeTime:4).quant_(4);

(
~k[0]={
	var sig, env, fenv,nenv;
	env=EnvGen.kr(Env([0,1,0],[0.5,0.7]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],[0.001,0.02]),\trig.tr);
	nenv=EnvGen.kr(Env([0,1,0,0.5,0],[0.01,0.4,0.01,0.4]),\trig.tr);
	sig=SinOsc.ar(fenv!2,add:GrayNoise.ar(nenv).clip(-0.2,0.7))*env;
	};
)
(
~k[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig, 1);
~k[2]=\set->Pbind(\args, [\freq], \dur, 16, \freq, [65,67,68]);
)
~k[30]=\filter-> {arg in; GVerb.ar(in,\room.kr(10,2),10,mul:0.2,add:in*0.7).clip(-0.7,0.7)};
~k[31]=\filter->{arg in; LPF.ar(in,\lpf.kr(700,2))};
~k.clear;





