

currentEnvironment.free;
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;

p.clock.tempo = 128/60;
p.gui;

AutoIDE.run;


~kick.clear;
~kick.stop(fadeTime:40);
~kick.play(vol:1, fadeTime:4, numChannels:2).quant_(4);
(~kick[0]=Pbind(
	\instrument, \kick,
	\amp,1,
	\freq, [44,45],
	\dur, Pseq([Pseq([4,[0.1!4,-1,0.1,-0.1,0.1!3,-0.1].flatten,3].convertRhythm),
		Pseq([4,[0.1!4,-1,0.1,0.1,0.1!3,-0.1].flatten,3].convertRhythm)
	],inf),
	\top, 40,

););
~kick[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,30,mul:0.5,add:in*0.5),0.6)};
~kick[7]=\filter->{arg in; LPF.ar(in,SinOsc.kr(1/32).range(400,200))};
~kick[6]=nil;

~bum.clear;
~bum.stop(freeTime:10);
~bum.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
(~bum[0]=Pbind(
	\instrument, \bum,
	\legato,0.2,
	\amp, 1,
	\dur,Pseq([1,Rest(1)],inf),
	\pan, 0,
	\freq, [45,47],

););
~bum[3]=\filter->{arg in; LPF.ar(in,\lpf4.kr(120,2))};
~bum[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,80,4,mul:0.2)+in)};
~bum[4]=nil;


m=Group.new;
~zit2.clear;
~zit2.stop(freeTime:20);
~zit2.play(vol:0.01, fadeTime:4, numChannels:2,group:z, group:m).quant_(4);
(~zit2[0]=Pbind(
	\instrument, \zit,
	\amp, 0.8,
	\dur,Pseq([Pseq([4,[0.1!4,-1,-0.1,-0.1,-0.1!3,-0.1].flatten,3].convertRhythm),
		Pseq([4,[0.1!4,-1,-0.1,0.1,-0.1!3,-0.1].flatten,3].convertRhythm)
	],inf),

	\pan, 0,
	\freq, 15000,
	\hpf, 10000,
	\legato, 0.1,
	\noise, 0.1,
););
~zit2[3]=\filter->{arg in; AllpassC.ar(in,0.02)};
~zit2[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,20,4,mul:0.2)+in)};
~zit2[4]=nil;


d=Group.new;
~drujba.clear;
~drujba.stop(fadeTime:20);
~drujba.play(vol:0.8, fadeTime:4, numChannels:2,group:d).quant_(4);
(~drujba[0]=Pbind(
	\instrument, \zit,
	\amp,1,
	\legato, 0.8,
	\freq,40,//Prand([200,400,1200,100,65,200,400],inf),
	\noise, 0.7,
	\dur, 0.2,//Prand([Pseq([Pn(0.05*40), Rest(2)],2),Pseq([Pn(0.05*20), Rest(3)],1)],inf),
););
~drujba[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,[40,80],revtime:LFSaw.kr(1/16).range(4,40),damping:SinOsc.kr(0.125).range(0.6,0.9),mul:0.1,add:in*0.5),0.7)};
~drujba[7]=\filter->{arg in; LPF.ar(in, SinOsc.kr(1/32).range(200,800))};


z=Group.new;
~zit1.clear;
~zit1.stop(fadeTime:10);
~zit1.play(vol:0.00001, fadeTime:4, numChannels:2, group:z).quant_(4);
(~zit1[0]=Pbind(
	\instrument, \zit,
	\amp,0.02,
	\legato, 0.7,
	\freq,Prand([4000,2000,2000,4000],inf),
	\noise, 0.5,
	\hpf, 9000,
	\dur, Pseq([0.1,Rest(0.1)],inf)
););
~zit1[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,20,10,mul:0.6,add:in*0.5))};
~zit1[8]=\filter->{arg in; HPF.ar(in*SinOsc.kr(1/32).range(0.1,0.8),SinOsc.kr(1/32).range(12000,9000))};
~zit1[8]=nil;


// ~noiserand1.clear;
// ~noiserand1.stop(fadeTime:10);
// ~noiserand1.play(vol:0.0002, fadeTime:4, numChannels:2).quant_(4);
// (~noiserand1[0]=Pbind(
// 	\instrument, \noiserand,
// 	\amp,1,
// 	\legato, 0.02,
// 	\freq,500,
// 	\dur, 12,
// 	\noise, Prand([0.5,0.3],inf),
// 	\hpf, Prand([1200,1500,1800],inf),
// );)
// ~noiserand1[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in*LFSaw.kr(2),[40,80],[10,12],mul:0.8,add:in*0.5))};
// ~noiserand1[7]=nil;

g=Group.new;
~otto.clear;
~otto.stop(fadeTime:30);
~otto.play(vol:0.7, fadeTime:4, numChannels:2, group:g).quant_(4);
(~otto[0]=Pbind(
	\instrument, \ottto,
	\amp,Pseq([0.5,0.2],inf),
	\legato, 3,
	\dur, 8,
	\octave, Pseq([Pn([3,2],4),Pn([1,2],4),Pn([6,4],2)],inf)+1,
	\degree, [2,3]+2,
	\dist, Pseries(2,1,400),

););
~otto[3]=\filter->{arg in; LPF.ar(in,3800)};
~otto[4]=\filter->{arg in; Rotate2.ar(Mix.new(in),Mix.new(DelayN.ar(HPF.ar(in,\hpf.kr(2000)),0.6,0.2)),SinOsc.kr(0.125))};
~otto[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,[60,80],[10,8],mul:0.6,add:in*0.2))};
~otto[7]=nil;

