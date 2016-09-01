
(
currentEnvironment.free;
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;
)
p.clock.tempo = 60/60;
p.gui;


~drujba.clear;
~drujba.stop(fadeTime:10);
~drujba.play(vol:1, fadeTime:4, numChannels:2).quant_(4);
(~drujba[0]=Pbind(
	\instrument, \zit,
	\amp,1,
	\legato, 0.8,
	\freq,50,//Pseq([200,400,1200,100,65,200,400],inf),
	\noise, 1,
	\dur, 0.1,//Prand([Pseq([Pn(0.05*40), Rest(2)],2),Pseq([Pn(0.05*20), Rest(3)],1)],inf),
);)
~drujba[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,[40,80],revtime:LFSaw.kr(1/16).range(4,40),damping:SinOsc.kr(0.125).range(0.3,0.8),mul:0.1,add:in*0.5))};
~drujba[7]=\filter->{arg in; LPF.ar(in, SinOsc.kr(1/32).range(200,1500))};


~zit1.clear;
~zit1.stop(fadeTime:10);
~zit1.play(vol:0.3, fadeTime:4, numChannels:2).quant_(4);
(~zit1[0]=Pbind(
	\instrument, \zit,
	\amp,Pseq([1,0.5],inf),
	\legato, 0.7,
	\freq,5000,
	\noise, 1,
	\dur, 0.1,
);)
~zit1[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,20,10,mul:0.6,add:in*0.5))};
~zit1[7]=\filter->{arg in; HPF.ar(in*SinOsc.kr([1/8,1/16]).range(0.01,0.8),SinOsc.kr(1/32).range(12000,9000))};



~noiserand1.clear;
~noiserand1.stop(fadeTime:10);
~noiserand1.play(vol:0.1, fadeTime:4, numChannels:2).quant_(4);
(~noiserand1[0]=Pbind(
	\instrument, \noiserand,
	\amp,1,
	\legato, 0.4,
	\freq,50,
	\dur, 12,
);)
~noiserand1[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in*LFSaw.kr(2),[40,80],[10,12],mul:0.8,add:in*0.5))};
~noiserand1[7]=nil;