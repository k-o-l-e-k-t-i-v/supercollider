
(
currentEnvironment.free;
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;
)
p.clock.tempo = 60/60;
p.gui;


~raw.clear;
~raw.play(vol:0.7, fadeTime:2, numChannels:2).quant_(2);
(
~raw[0]={
	var sig, env,fenv;

	env=EnvGen.kr(Env([0,1,0],[0.5,2]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],[0.1,0.04]),\trig.tr);

	sig=LFSaw.ar([\freq.kr, \freq.kr+[1,2,3,5,8].reciprocal]).lag([0.01,0.02]);
	sig=sig+LFPulse.ar(fenv+fenv+fib(1).reciprocal).lag(0.8);
	sig=sig*env;
});

~raw[1]=\set-> Pbind(\args, [\trig], \dur,4, \trig, 1);
~raw[2]=\set-> Pbind(\args, [\freq], \dur,Pseq([4,2,2,Rest(8)],inf), \freq, Pseq([Pn(65,1),Pn(205,1),Pn(35,1), Rest(1)],inf));
~raw[30]=\filter-> {arg in; GVerb.ar(Pan2.ar(Splay.ar(in),SinOsc.kr(0.25)),[80,65],[10,8],drylevel:SinOsc.kr([0.125,0.0125]).range(0.1,1),mul:0.7)};
~raw[31]=\filter->{arg in; LPF.ar(in,\lpf2.kr(200,4))};
~raw[32]=\set-> Pbind(\args, [\lpf2], \dur,6, \lpf2, Prand([200,400,600,800,1200],inf));
~raw[33]=\filter-> {arg in; Limiter.ar(in, 0.5).range(-0.8,0.8)};




~tz.clear;
~tz.stop(fadeTime:10);
~tz.play(vol:0.1,fadeTime:4, numChannels:2).quant_(4);
(~tz[1]=Pbind(
	\instrument, \zit,
	\dur, Pseq([Pseq([4,[0.25!4,-1].flatten,1].convertRhythm), Rest(2)],inf),
	\legato,0.2,
	\octave, [4,7,5]+Pseq([Pn(1,5),Pn(2,5),Pn(-1,5)],inf),
	\degree,[2,8],
	\amp, Pseq([1,0.25],inf),
	\pan, Pseq([1,0,-1,-1,1,-1],inf),
	\hpf,50,
	\noise, Pseq([Pseries(0.1,0.2,2),Pseries(1,-0.2,2)],inf) ,

););
~tz[3]=\filter->{arg in; AllpassN.ar(Splay.ar(in),0.02)};
~tz[5]=\filter->{arg in; GVerb.ar(in,20,[4,6],mul:0.2,add:in)};
~tz[6]=\filter->{arg in; LPF.ar(in, \lpf2.kr(200,4))};
~tz[7]=\filter->{arg in; in*SinOsc.kr(0.125).range(0.6,1)};



~bumnoise.clear;
~bumnoise.stop(fadeTime:10);
~bumnoise.play(vol:0.02, fadeTime:4, numChannels:2).quant_(4);
(~bumnoise[0]=Pbind(
	\instrument, \bum,
	\amp,1,
	\legato, 1,
	\freq, [44,45],
	\noise, Pseq([Pn(0.02,6),Pn(0.2,6),Pn(0.1,6)],inf),
	\dur, Pseq([1,Rest(1)],inf)
);)
~bumnoise[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,120,revtime:4,damping:SinOsc.kr(0.125).range(0.3,0.8),mul:0.1,add:in*0.5))};



~noisedfm.clear;
~noisedfm.stop(fadeTime:10);
~noisedfm.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
(~noisedfm[0]=Pbind(
	\instrument, \noiselong,
	\amp,1,
	\legato,0.5,
	\octave, 5,
	\degree, [5,6,9],
	\dur, 8,
	\pan, 1/Pkey(\dur),

);)
~noisedfm[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in*LFSaw.kr(5),120,8,mul:0.1,add:in*0.5))};

