Kolektiv(\alex);
Kolektiv.print;

p=ProxySpace.push(s);

~g.play( vol:0.6, fadeTime:2).quant_(1);
(
~g[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\welch, \lin]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr*2, \freq.kr], [0.01, 0.04,0.2],[\welch, \lin]),\trig.tr);

	sig=RLPF.ar(
		GrayNoise.ar(Array.fill(4, {LFNoise2.kr(2).range(0.2,1)})),
			freq:fenv+[1,2,3,5,8,13].reciprocal,
			rq:Array.fill(4,{ LFNoise1.kr(5).range(0.001,1)}),
			mul:0.2);
	sig=sig*env;
};)
(
~g[1]=\set-> Pbind(\args, [\trig], \dur, 4, \trig, 1);
~g[2]=\set-> Pbind(\args, [\freq], \dur, 4, \freq, Prand([165,85,220],inf));

~g[30]=\filter-> {arg in;GVerb.ar(in,roomsize:\room.kr(20),revtime:30,add:in).clip(-0.7,0.7)};
~g[31]=\set-> Pbind(\args, [\room], \dur, 4, \room, Pseq([Pseries(40,-4,8),4,Pn(2,4)],inf));
~g[32]=\filter-> {arg in; LPF.ar(in,\lpf.kr(200))};
~g[33]=\set-> Pbind(\args, [\lpf], \dur, 4, \lpf, Pseq([Pseries(1200,-100,5),400],inf));
// ~g[34]=\filter-> {arg in; FreeVerb.ar(in,room:1,damp:0.1,add:in)};
)
~g.clear;

~c.play( vol:0.4, fadeTime:2).quant_(1);
(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1,05],[\welch, \lin]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4), \freq.kr], [0.01, 0.04],[\welch, \lin]),\trig.tr);

	sig=LFPulse.ar([1,2,3,5]/7,0,[0.1,0.5,0.7])*VarSaw.ar(fenv!2);
	sig=sig*env;
};)

~c[1]=\set->Pbind(\args, [\trig], \dur, 2, \trig,1);
~c[2]=\set-> Pbind(\args, [\freq], \dur, 2, \freq,Pseq([Pn(85,4), Pn(95, 2), Prand([75,64,78],2)],inf));
~c[30]=\filter-> {arg in; Balance2.ar(in, in+(GrayNoise.ar(LFNoise1.kr(0.5).range(0.1,0.5))*Decay.ar(Impulse.ar([0.5,0.25]),0.01)),0)};
~c[31]=\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};
~c[32]=\filter-> {arg in; LPF.ar(in,\lpf.kr(400))};
~c[33]=\set->Pbind(\args, [\lpf], \dur, 2, \lpf,Pseq([200,120,800,4000],inf));


~c.clear;
~c[31]=nil;


~f.play( vol:0.1, fadeTime:2).quant_(1);
(
~f[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\welch, \lin]),\trig.tr);
	sig=SinOsc.ar(\freq.kr(400)*([1,2,3,5]/4))+BrownNoise.ar(0.2)*Decay2.ar(Impulse.ar([0.25,0.125]),2,0.1);
	sig=sig*env;
};)

~f[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig,1);
~f[2]=\set-> Pbind(\args, [\freq], \dur, 2, \freq,Pseq([Pn(1650,4), Pn(1450, 2), Prand([750,640,780,75,85],2)],inf));
~f[31]=\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};
~f[32]=\filter-> {arg in; RLPF.ar(LPF.ar(in,\lpf.kr(200)),\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1))};
~f[33]=\set-> Pbind(\args, [\rez], \dur, 2, \rez,Pseq([Pn(650,4), Pn(450, 2)],inf));
~f[34]=\set->Pbind(\args, [\lpf], \dur, 2, \lpf,Pseq([400,1200,2000,4000,200],inf));

~f.clear(fadeTime:2);



~h.play( vol:0.3, fadeTime:2).quant_(1);
(
~h[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.1],[\step, \step]),\trig.tr);
	sig=SinOsc.ar(\freq.kr(400)*([1,2,3,5]/4))+GrayNoise.ar(0.2);
	sig=sig*env;
};)

~h[1]=\set->Pbind(\args, [\trig], \dur, 4, \trig,1);
~h[2]=\set-> Pbind(\args, [\freq], \dur, 2, \freq,Pseq([Pn(9500,4), Pn(700, 2), Prand([7500,6400,7800,7500,8500],2)],inf));


~h[25]=\filter-> {arg in; CombN.ar(in,4,\del.kr(0.25),2)};
~h[26]=\set-> Pbind(\args, [\del], \dur, Pseq([16,12,8],inf), \del, Pseq([0.25,0.5,1],inf));
~h[31]=\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:5,drylevel:SinOsc.kr(0.125).range(0.1,1),add:in)};


~h.clear(fadeTime:2);


~r.play( vol:0.2, fadeTime:2).quant_(1);
(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1,5],[\welch, \lin]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4), \freq.kr], [0.01, 0.04],[\welch, \lin]),\trig.tr);
	sig=LFSaw.ar([\freq.kr, \freq.kr+[1,2,3,5].reciprocal]).lag(\lag.kr(0.01,2));
	sig=sig*env;
};)

~r[1]=\set->Pbind(\args, [\trig], \dur, 6, \trig,1);
~r[2]=\set-> Pbind(\args, [\freq], \dur, 8, \freq,Pseq([Pn(35,4), Pn(50, 2), Prand([175,164,178,175,185],2)],inf));
~r[31]=\filter-> {arg in; GVerb.ar(in,roomsize:80,revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};
~r[32]=\filter-> {arg in; LPF.ar(in,\lpf.kr(200))};
~r[34]=\set->Pbind(\args, [\lpf], \dur, 2, \lpf,Pseq([400,1200,2000,4000,2000],inf));