p=ProxySpace.push(s);
currentEnvironment.clear;

{SinOsc.ar}.play;

~in.scope;
~in[0]={Mix.ar(AudioIn.ar([1,0]))};
~in.play(numChannels:2);


~dis1.clear;
~dis1.play(vol:1, fadeTime:2, numChannels:2).quant_(2);
(
~dis1[0]={
	var sig, env;

	env=EnvGen.kr(Env(times:[0.01,0.2],curve:\welch),\trig.tr);
	sig=Formant.ar(\freq.kr,\freq.kr+[20,50,30],add:AudioIn.ar(1)*LFSaw.ar([3,1]));
	sig=sig*env;
};
)

~dis1[1]=\set-> Pbind(\args, [\trig], \dur, Pseq([Pn(0.3,3), Rest(1.1)],inf), \trig,1);
~dis1[2]=\set-> Pbind(\args, [\freq], \dur, 2, \octave, [3,4], \degree, Pseq([2,4,7,5,3],inf));
~dis1[3]=\filter-> {arg in; Limiter.ar(in, 1)};

~dis1[30]=\filter-> {arg in; BPF.ar(GVerb.ar(in,[40,2], [2,3]),\lpf.kr(650),mul:2)}

~dis1[31]=\set-> Pbind(\args, [\lpf], \dur, 6, \lpf, Pseq([200,2000,65,400],inf));
~dis1[32]=\filter->{arg in; Limiter.ar(in, 1)};



~dis2.stop;
~dis2.play(vol:1, fadeTime:2, numChannels:2).quant_(2);
(
~dis2[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,1],curve:\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*[6,4,8],\freq.kr], [0.001, 0.04] ,curve:\welch),\trig.tr);

	sig=SinOsc.ar(fenv+[1,2,3,5,8],[1,2,3,5,8],add:GrayNoise.ar([0.02,0.1,0.05]))+(AudioIn.ar([0,1])*LFSaw.kr(5));
	sig=sig*env;

};
)

~dis2[1]=\set-> Pbind(\args, [\trig], \dur, 2, \trig, 1);
~dis2[2]=\set-> Pbind(\args, [\freq], \dur, 4, \octave, [1,2,4], \degree, [2,4,6,8]);

~dis2[30]=\filter-> {arg in; Mix.ar(Limiter.ar(GVerb.ar(in, [20,40],[5,2]),0.5))};



~dis3.stop;
~dis3.play(vol:1, fadeTime:2, numChannels:2).quant_(2);
(
~dis3[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.01,0.2],curve:\welch),\trig.tr);
	sig=PitchShift.ar(AudioIn.ar(1),windowSize:0.5,pitchRatio:0.4,pitchDispersion:0.02,timeDispersion:0.002);
	sig=sig*env;
};
)

~dis3[1]=\set-> Pbind(\args, [\trig], \dur, 0.5, \trig, 1);
~dis3[2]=\set-> Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[3,1],[2,3]],inf), \degree, [2,4,6,8]);

~dis3[30]=\filter-> {arg in; GVerb.ar(in, [120,40],[5,2])};
~dis3[31]=\filter->{arg in; Limiter.ar(in,1)};



~dis4.stop;
~dis4.play(vol:1, fadeTime:2, numChannels:2).quant_(2);
(
~dis4[0]={
	var sig, env, fenv, noise;

	noise=EnvGen.kr(Env([0.01,0.05,0.04,0.01],[0.1,0.02,0.1],curve:\welch),\trig.tr);
	env=EnvGen.kr(Env(times:[0.01,1.5],curve:\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr,\freq.kr+(fib(10)*2)], [0.001, 0.04,0.8] ,curve:\welch),\trig.tr);

	sig=LFSaw.ar(fenv+fib(10)).lag([0.01,0.02,0.03,0.04,0.05]);
	sig=(sig+ClipNoise.ar(noise*0.4))*env;
};
)

~dis4[1]=\set-> Pbind(\args, [\trig], \dur, 3, \trig, 1);
~dis4[2]=\set-> Pbind(\args, [\freq], \dur, 3, \octave, Pseq([[4,8],5,[6,4],[6,5],[7,6]],inf), \degree, [2,4,6,8]);

~dis4[29]=\filter-> {arg in; CombN.ar(in,1,0.02)};
~dis4[30]=\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2), [20,40],[8,12,4])};



~dis5.scope(2);
~dis5.stop;
~dis5.play(vol:0.7, fadeTime:3, numChannels:2).quant_(2);
(
~dis5[0]={
	var sig, env, fenv, noise;

	// noise=EnvGen.kr(Env([0.01,0.05,0.04,0.01],[0.1,0.02,0.1],curve:\welch),\trig.tr);
	env=EnvGen.kr(Env(times:[0.1,0.5],curve:\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*2,\freq.kr,\freq.kr+(fib(10)*8)], [0.01, 0.4,0.8] ,curve:\welch),\trig.tr);

	sig=RLPF.ar(LFSaw.ar(fenv+fib(10)),650,SinOsc.kr(2).range(0.01,1))+(AudioIn.ar([0,1])*LFSaw.kr(2));
	sig=sig*env;
};
)

~dis5[1]=\set-> Pbind(\args, [\trig], \dur, 2, \trig, 1);
~dis5[2]=\set-> Pbind(\args, [\freq], \dur, 6, \octave, Pseq([[7,5]],inf), \degree, [2,4,6]);

~dis5[30]=\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2), [20,40],[8,12])};
~dis5[31]=\filter-> {arg in; LPF.ar(in,1800)};
~dis5[31]=nil;





~dis6.stop;
~dis6.play(vol:1, fadeTime:2, numChannels:2).quant_(2);
(
~dis6[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[0.4,1.6],curve:\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr,\freq.kr+(fib(10)*2)], [0.001, 0.04,0.8] ,curve:\welch),\trig.tr);

	sig=PitchShift.ar(Mix.ar(AudioIn.ar([0,1]))*VarSaw.ar([2,1]),0.2,pitchRatio:0.4,pitchDispersion:0.02);
	sig=sig*env;
};
)

~dis6[1]=\set-> Pbind(\args, [\trig], \dur, 2, \trig, 1);
~dis6[2]=\set-> Pbind(\args, [\freq], \dur, 4, \octave, Pseq([[4,8],5,[6,4],[6,5],[7,6]],inf), \degree, [2,4,6,8]);

~dis6[29]=\filter-> {arg in; CombN.ar(in,1,0.02)};
~dis6[30]=\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2), [20,40],[8,12,4])};




~dis7.stop;
~dis7.play(vol:0.1, fadeTime:8, numChannels:2).quant_(8);
(
~dis7[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env(times:[1,8],curve:\welch),\trig.tr);
	sig=SinOsc.ar(\freq.kr(220)+fib(10))*Decay.kr(Impulse.kr(1/[0.5,0.25,0.75,2,5,8]),[0.2,0.1]);
	sig=sig*env;
};
)

~dis7[1]=\set-> Pbind(\args, [\trig], \dur,8, \trig, 1);
~dis7[2]=\set-> Pbind(\args, [\freq], \dur, 1, \octave, Pseq([[4,5],[4,6],[8,3],[5,7],[2,3]],inf), \degree, [2,4,6,8]);
~dis7[30]=\filter->{arg in; CombN.ar(in,2,0.4,1)*2};
~dis7[31]=\filter->{arg in; GVerb.ar(in,[200,180],[10,12])};

~dis7[31]=nil;


