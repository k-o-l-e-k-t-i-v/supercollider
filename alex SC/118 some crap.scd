{SinOsc.ar()}.play;
(octave: 2, degree:4,dur:10).play;

p=ProxySpace.push(s);

~u.play(vol:0.2, fadeTime:2);
(
~u[0]={
	var sig, env, envp, envn;

	env=EnvGen.kr(Env(times:[0.5,1],curve:[\lin, \welch]),\trig.tr);
	envp=EnvGen.kr(Env(levels: [0,-1,1],times:[0.5,1],curve:[\lin, \welch]),\trig.tr);
	envn=EnvGen.kr(Env(levels: [1,0,1,0],times:[0.5,0.5,0.5],curve: [\step, \welch, \lin]),\trig.tr);

	sig=LFPulse.ar([\freq.kr(35,0.04),\freq.kr(35,0.04)+4]).lag([0.001,0.002,0.003])+
	(LFSaw.ar([2,3])*GrayNoise.ar(envn).clip(-0.2,1));

	sig=Balance2.ar(sig,sig,envp)*env;
};)
~u[1]=\set-> Pbind(\args, [\trig], \dur, 2, \trig, 1);
~u[2]=\set->Pbind(\args, [\freq], \dur, 2, \freq, Pseq([4500,25,35],inf));

~u[30]=\filter->{arg in; GVerb.ar(in, SinOsc.kr([0.125,0.025]).range(15,20),[4,12],[0.2,0.8],maxroomsize:120)};
~u[31]=\filter->{arg in; LPF.ar(in,\lpf.kr(6200))};


~g.play(vol:0.2, fadeTime:2).quant_(2);
(
~g[0]={
	var sig, sig1,sig2, env, envp, envn;

	env=EnvGen.kr(Env(times:[0.04,0.05],curve:[\lin, \welch]),\trig.tr);
	envp=EnvGen.kr(Env(levels: [0,-1,1],times:[0.04,1],curve:[\lin, \welch]),\trig.tr);
	envn=EnvGen.kr(Env(levels: [0.4,0,0.2,0],times:[0.04,2],curve: [\step, \welch, \lin]),\trig.tr);

	sig1=SinOsc.ar(\freq.kr(9000))*env;
	sig2=WhiteNoise.ar(envn)*LFPulse.ar([2,5],width:0.3);
	sig=Balance2.ar(sig1,sig2,envp);
};)
~g[1]=\set-> Pbind(\args, [\trig], \dur, 1, \trig, 1);
~g[2]=\set->Pbind(\args, [\freq], \dur, 4, \freq, Pseq([7500,9550,8650],inf));

~g[30]=\filter->{arg in; GVerb.ar(in, 40,[4,12],maxroomsize:120)};


~v.play(vol:0.2, fadeTime:2).quant_(2);
(
~v[0]={
	var sig, sig1,sig2, env, envp, envn;

	env=EnvGen.kr(Env(times:[0.4,5],curve:[\lin, \welch]),\trig.tr);
	envp=EnvGen.kr(Env(levels: [0,-1,1],times:[1,1],curve:[\lin, \welch]),\trig.tr);

	sig1=LFSaw.ar(\freq.kr+[20,30,40].reciprocal).lag([0.001,0.002,0.003])*env;
	sig2=SinOsc.ar(\freq.kr+[50,60,70].reciprocal)*env;
	sig=Balance2.ar(sig1,sig2,envp);
};)
~v[1]=\set-> Pbind(\args, [\trig], \dur, 1, \trig, 1);
~v[2]=\set->Pbind(\args, [\freq], \dur, 4, \octave, Pseq([4,5,2,3],inf), \degree, Pseq([[4,2,6],[3,6],[5,2],],inf));

~v[30]=\filter->{arg in; GVerb.ar(in, 40,[4,12],maxroomsize:120)};
