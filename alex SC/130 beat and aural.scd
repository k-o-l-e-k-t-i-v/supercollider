currentEnvironment.free;
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;

p.clock.tempo = 128/60;

//next up create a variable that modulates frequencies up and down for simultaneous peaks
//a few more strange events
//noise control invert
//blow a bit
//dust+combN
//long mod noise
//////////////////////////////////////////////////////////////////////////////////////////////

~tum1.stop(freeTime:10);
~tum1.play(vol:0.07, fadeTime:4, numChannels:2).quant_(4);
(~tum1[0]=Pbind(
	\instrument, \tum,
	\amp, Pseq([1!3,0.5,1],inf),
	\legato, 1,
	\pan, Pseq([-1!2,1!2,0],inf),
	\octave, [2,1],
	\degree, [3,6],
	\dur, Pseq([Pseq([2,[0.5,0.5,0.5,0.5,0.5,-1],1].convertRhythm)],inf),
	\rq, Pseq([Pseries(2,0.1,100),Pseries(0.1,0.1,100)],inf),
);)
~tum1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf.kr(8800,2)),0.7)};
~tum1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.2)+in,0.7)};
// ~tum1[4]=nil;


~bum1.stop(fadeTime:10);
~bum1.play(vol:0.04, fadeTime:4, numChannels:2).quant_(4);
(~bum1[0]=Pbind(
	\instrument, \bum,
	\amp,1,
	\legato, 1,
	\freq, [44,45],
	\dur, Pseq([Pseq([1,Rest(1)],4)],inf)
);)
~bum1[6]=\filter->{arg in; Limiter.ar(in)};


// ~aural1.stop(fadeTime:10);
~aural1.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
(~aural1[0]=Pbind(
	\instrument, \aural,
	\amp,Prand([0.8,0.4,0.6],inf)/4,
	\legato, 1.5,
	\octave, Prand([[5,6],[4,2],[5,4],[3,6]],inf)-1,
	\degree, Prand([[1,5],[4,7],[7,2],[2,4],[2,6],[4,2]],inf),
	\dur, 2
);)
~aural1[5]=\filter->{arg in; GVerb.ar(in,[40,60],[8,4],mul:0.2)+in};
~aural1[6]=\filter->{arg in; LPF.ar(in,\lpf.kr(2000,4))};
~aural1[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, 10);
// ~aural1[7]=nil;


~zit.stop(fadeTime:10);
~zit.play(vol:0.01,fadeTime:4, numChannels:2).quant_(4);
(~zit[1]=Pbind(
	\instrument, \zit,
	\dur, Pseq([Pseq([2,[0.5,0.5,-0.5,0.5,0.5,-1],1].convertRhythm), Rest(2)],inf),
	\legato,0.3,
	\octave, [4,8,6]-2,
	\degree,2,
	\amp, Pseq([1,0.5],inf),
	\pan, Pseq([1,0,-1,-1,1,-1],inf),
	\hpf,500,
	\noise, 0.6,
););
~zit[3]=\filter->{arg in; AllpassN.ar(Splay.ar(in),0.02)};
~zit[5]=\filter->{arg in; GVerb.ar(in,20,[4,6],mul:0.2,add:in)};
~zit[6]=\filter->{arg in; LPF.ar(in, 1800)};
// ~zit[4]=nil;


~drib.stop(fadeTime:4);
~drib.play(vol:0.02,fadeTime:4, numChannels:2).quant_(4);
(~drib[1]=Pbind(
	\instrument, \dribble,
	\dur, Pseq([Rest(7),1],inf),
	\legato,0.5,
	\octave, [4,5,7],
	\degree,[2,4,8],
	\amp, 0.6,
	\lag, [0.4,0.2],
	\f2, 5

););
~drib[4]=\filter->{arg in; LPF.ar(in, 10000)};
~drib[5]=\filter->{arg in; GVerb.ar(in,120,[4,6],mul:0.2,add:in)};



~vrr.stop(fadeTime:10);
~vrr.play(vol:0.7,fadeTime:4, numChannels:2).quant_(4);
(~vrr[1]=Pbind(
	\instrument, \vrr,
	\dur, Pseq([Rest(16),1],inf),
	\legato,0.2,
	\freq, Pseq([20,1500,40,Prand([7200,8000,6000,12000],2)],inf),
	\amp, 1.5,
	\lag, [0.04,0.02],
););
~vrr[4]=\filter->{arg in; LPF.ar(in, 10000)};
~vrr[5]=\filter->{arg in; CombN.ar(in,2,1,4)};
~vrr[6]=\filter->{arg in; GVerb.ar(in,20,[4,6],mul:0.2,add:in)};
