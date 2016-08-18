currentEnvironment.free;
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;

p.clock.tempo = 60/60;
p.gui;


~rrr1.clear;
~rrr1.stop(fadeTime:10);
~rrr1.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
(~rrr1[0]=Pbind(
	\instrument, \rrr,
	\amp,1,
	\legato, 1.5,
	\octave, 1.7,
	// \degree, [4,2],
	\dur, Pseq([6,2],inf),
	\lag, 0.01,
	\pan, 0,
);)
~rrr1[1]=\filter->{arg in; in*SinOsc.ar(0.125).range(0.1,1)};
~rrr1[2]=\filter->{arg in; LPF.ar(in,Line.kr(1800,12000,20))};
~rrr1[3]=\filter->{arg in; Limiter.ar(GVerb.ar(in,10,0.5,mul:0.1,add:in*0.2))};
~rrr1[2]=nil;