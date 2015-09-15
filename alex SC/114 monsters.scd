p=ProxySpace.push(s);


~g.play( vol:0.5, fadeTime:2).quant_(1);
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

~g[30]=\filter-> {arg in;GVerb.ar(in,roomsize:\room.kr(2),revtime:30,add:in).clip(-0.7,0.7)};
~g[31]=\set-> Pbind(\args, [\room], \dur, 4, \room, Pseq([Pseries(40,-4,8),4,Pn(2,4)],inf));
~g[32]=\filter-> {arg in; LPF.ar(in,\lpf.kr(200))};
~g[33]=\set-> Pbind(\args, [\lpf], \dur, 4, \lpf, Pseq([Pseries(1200,-100,5),400],inf));
// ~g[34]=\filter-> {arg in; FreeVerb.ar(in,room:1,damp:0.1,add:in)};
)