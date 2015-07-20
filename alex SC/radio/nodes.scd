currentEnvironment.postln;
(
~long1.play;
~long1.fadeTime=1;
~long1.quant=1;
~long1.clock=TempoClock(60/60).permanent_(true);
~long1[0]=Pbind(\instrument, \onion,
	\dur, Pseq([2,Rest(2),0.5,Rest(1)],inf),
	\legato, 0.4,
	\octave,[8,9],
	\degree, [2,5],
	\amp, 0.5,
	\f2, 5
);
~long1[30]=\filter-> {arg in; GVerb.ar(in,40,maxroomsize:45,add:in)};
~long[31]=\filter->{arg in; Balance2.ar(Mix.ar(in),Mix.ar(in),1)};
)

(
~noise1.play;
~noise1.fadeTime=1;
~noise1.quant=1;
~noise1.clock=TempoClock(160/60).permanent_(true);
~noise1[0]=Pbind(\instrument, \noise,
	\dur, Pseq([1,Rest(1),0.5, Rest(0.5), 0.3,Rest(2)],inf),
	\legato, 1,
	\amp, 2,
	\hpf, 12000,
	\f2, 5
);
~noise1[30]=\filter-> {arg in; GVerb.ar(in,40,maxroomsize:60,add:in)};
~noise1[31]=\filter-> {arg in; LPF.ar(in, LFSaw.kr(0.5).range(400,4000))};
~noise1[32]=\filter->{arg in; Limiter.ar(in,1)};
)


(
~grain.play;
~grain.fadeTime=1;
~grain.quant=1;
~grain.clock=TempoClock(120/60).permanent_(true);
~grain[0]=Pbind(\instrument, \grains,
	\dur, Pseq([2,Rest(1)],inf),
	\octave,Pseq([Pn(5,4),Pn(4,4),Pn1,4],inf),
	\legato,3,
	\lag, Pseq([Penv([0.001,0.1,0.5],[0.1,0.2,0.02],\welch),0.02,0.4],inf),
	\lpf, 12000,
	\amp, 1,
	\degree, [2,4,5,3]);
~grains[30]=\filter->{arg in; Compander.ar(in)};
~grain[30]=\filter->{arg in; GVerb.ar(in,20,maxroomsize:25,add:in)};
~grain[36]=\filter-> {arg in; Limiter.ar(in,level:0.4)};
)


(
~g.play;
~g.fadeTime=1;
~g.quant=1;
~g.clock=TempoClock(120/60).permanent_(true);
~g[0]=Pbind(
	\instrument, \longn,
	\dur, 8,
	\legato, 0.4,
	\f2, 5,
	\amp, 2
);
~g[30]=\filter-> {arg in; GVerb.ar(in,roomsize:10,maxroomsize:20)};
~g[31]=\filter-> {arg in; Limiter.ar(in,1)};
)
(

~f.play;
~f.fadeTime=1;
~f.quant=1;
~f.clock=TempoClock(120/60).permanent_(true);
~f[0]=Pbind(
	\instrument, \noise,
	\dur,1,
	\legato, 1,
	\hpf, Pseq([Pn(8000, 4), Pn(2000, 2)],inf),
	\amp, 1,
	\f2, 5);
~f[30]=\filter->{arg in; GVerb.ar(in,10,add:in)};
~f[31]=\filter-> {arg in; LPF.ar(in,LFSaw.kr(0.5).range(85,8000))};
~f[32]=\filter->{arg in; Limiter.ar(in, 0.7)};
)

////////////////
(
~h.play;
~h.fadeTime=1;
~h.quant=1;
~h[0]=Pbind(
	\instrument, \onion,
	\amp, 0.2,
	\dur, Pseq([4],1),
	\legato, 0.4,
	\freq, [100,122],
	\f2, 100,
	\fsaw, 5);
~h[30]=\filter-> {arg in; GVerb.ar(in,10,maxroomsize:25)};

)

~h.clear;
////////////////
(
~b.play;
~b.fadeTime=1;
~b.quant=1;
~b.clock=TempoClock(120/60).permanent_(true);
~b[0]=Pbind(
	\instrument, \glitch,
	\dur, 1,
	\legato, 0.3,
	\octave, [2,3],//Pseq([[3,4],[1,3],[2,3]],inf),
	\degree, [1,2],
	\amp, 0.7,
	\n, Pseq([Pn(1,5),0,0,3],inf));
~b[30]=\filter-> {arg in; FreeVerb.ar(in,1,add:in)};
~b[31]=\filter-> {arg in; Limiter.ar(in,0.7)};
)

~b.clear;
(
~j.play;
~j.fadeTime=1;
~j.quant=1;
~j[0]=Pbind(
	\instrument, \noise,
	\dur, Pseq([1, Rest(1), 0.1, Rest(1),0.25, Rest(1)],inf),
	\hpf, Pseq([Pn(800, 4), Pn(200, 2)],inf),
	\amp, 1,
	\f2, 20);
~j[30]=\filter->{arg in; GVerb.ar(in,10,add:in)};
~j[31]=\filter-> {arg in; LPF.ar(in,LFSaw.kr(0.5).range(50,80))};
~j[32]=\filter->{arg in; Limiter.ar(in, 0.5)};
)

(
~long1.play;
~long1.fadeTime=1;
~long1.quant=1;
~long1.clock=TempoClock(60/60).permanent_(true);
~long1[0]=Pbind(\instrument, \long,
	\dur, Pseq([4],1),
	\legato, 0.7,
	\octave,[4,3],
	\degree, 1,
	\amp, 0.1,
	\f2, 2
);
~long1[30]=\filter-> {arg in; GVerb.ar(in,8,maxroomsize:45,add:in)};
~long[31]=\filter->{arg in; Balance2.ar(Mix.ar(in),Mix.ar(in),1,0.5)};
~long[32]=\filter->{arg in; Limiter.ar(in,0.5)};
)

(
~long2.play;
~long2.fadeTime=1;
~long2.quant=1;
~long2.clock=TempoClock(60/60).permanent_(true);
~long2[0]=Pbind(\instrument, \long,
	\dur, Pseq([1,Rest(0.5),0.25,1, Rest(1)],inf),
	\legato, 0.7,
	\octave, Pseq([2,[3,1],1,],inf),
	\degree, [2,4],
	\f2, 50,
	\amp, 0.7);
~long2[30]=\filter-> {arg in; GVerb.ar(in,40,maxroomsize:50,add:in)};
~long2[32]=\filter-> {arg in; Limiter.ar(in,0.5)};
)

	