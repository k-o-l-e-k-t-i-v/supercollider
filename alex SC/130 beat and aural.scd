p=ProxySpace.push(s);

// ~tum1.stop(freeTime:10);
~tum1.clock=TempoClock(128/60).permanent_(true);
~tum1.play(vol:0.6, fadeTime:4, numChannels:2).quant_(4);
(~tum1[0]=Pbind(
	\instrument, \tum,
	\amp, Pseq([1!3,0.5,1],inf),
	\legato, 1,
	\pan, Pseq([-1!2,1!2,0],inf),
	\octave, [2,1],
	\degree, [3,6],
	\dur, Pseq([Pseq([2,[0.5,0.5,0.5,0.5,0.5,-1],1].convertRhythm)],inf),
	\rq, Pseq([Pseries(2,0.1,100),Pseries(0.01,0.1,100)],inf),
);)
~tum1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf.kr(8800,2)),0.7)};
~tum1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.2)+in,0.7)};
// ~tum1[4]=nil;


~tum1.clock=TempoClock(128/60).permanent_(true);
~tum1.play(vol:0.6, fadeTime:4, numChannels:2).quant_(4);
(~tum1[0]=Pbind(
	\instrument, \tum,
	\amp, Pseq([1!3,0.5,1],inf),
	\legato, 1,
	\pan, Pseq([-1!2,1!2,0],inf),
	\octave, [2,1],
	\degree, [3,6],
	\dur, Pseq([Pseq([2,[0.5,0.5,0.5,0.5,0.5,-1],1].convertRhythm)],inf),
	\rq, Pseq([Pseries(2,0.1,100),Pseries(0.01,0.1,100)],inf),
);)
~tum1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf.kr(8800,2)),0.7)};
~tum1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.2)+in,0.7)};
// ~tum1[4]=nil;

// ~bum1.stop(fadeTime:10);
~bum1.play(vol:0.0001, fadeTime:4, numChannels:2).quant_(4);
~bum1.clock=TempoClock(128/60).permanent_(true);
(~bum1[0]=Pbind(
	\instrument, \bum,
	\amp,1/2,
	\legato, 1,
	\freq, [34,35],
	\dur, Pseq([Pseq([1,Rest(1)],4)],inf)
);)


// ~aural1.stop(fadeTime:10);
~aural1.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
~aural1.clock=TempoClock(128/60).permanent_(true);
(~aural1[0]=Pbind(
	\instrument, \aural,
	\amp,Prand([0.8,0.4,0.6],inf)/4,
	\legato, 1.5,
	\octave, Prand([[5,6],[4,2],[5,4],[3,6]],inf)-2,
	\degree, Prand([[1,5],[4,7],[7,2],[2,4],[2,6],[4,2]],inf),
	\dur, 2
);)
~aural1[5]=\filter->{arg in; GVerb.ar(in,[40,60],[8,4],mul:0.2)+in};
~aural1[6]=\filter->{arg in; LPF.ar(in,\lpf.kr(500,4))};
~aural1[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, 1900);
~aural1[7]=nil;




~strange.stop;
~strange.play(vol:0.1,fadeTime:4, numChannels:2).quant_(4);
~strange.clock=TempoClock(128/60).permanent_(true);
(~strange[1]=Pbind(
	\instrument, \strange,
	\dur, Pseq([Pseq([2,[0.25,0.25,-0.5,1,0.15,0.25],1].convertRhythm)],inf),
	\legato,0.8,
	\octave, [5,5]+1,
	\degree,[4,8,9],
	\amp, Pseq([1,1],inf)
););
~strange[3]=\filter->{arg in; AllpassN.ar(Splay.ar(in),2,1,4)};
~strange[4]=\filter->{arg in; HPF.ar(in,7800)};
~strange[5]=\filter->{arg in; GVerb.ar(in,20,mul:0.2,add:in)};
~strange[3]=nil;

