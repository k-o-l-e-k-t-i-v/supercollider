p=ProxySpace.push(s);
p.clock=TempoClock(120/60).permanent_(true);

(
~strange.play;
~bumlow.play;
// ~tss.play;
~tus.play;
~blow.play;
// ~strange.play;
)
~bum.stop(freeTime:10);


(
~bumlow.play;
~bumlow.fadeTime=1;
~bumlow.quant=1;
~bumlow.clock=TempoClock(120/60).permanent_(true);
(~bumlow[1]=Pbind(
	\instrument, \bum,
	\dur, Pseq([Pseq([4,[1,-0.5,0.5],1].convertRhythm)],inf),
	\legato, 0.4,
	\octave, Pseq([[2,1]!2,[2,3]!4],inf),
	\degree, Pseq([[2,3],[2,1]],inf),
	\amp, 1/2
););
~bumlow[4]=\filter->{arg in;Limiter.ar(GVerb.ar(in,20,[0.5,0.75],mul:0.2,add:in),0.8)};
// ~bumlow[4]=\nil;
~bumlow[5]=\filter->{arg in; LPF.ar(Limiter.ar(in,0.7),400,add:in*0.5,mul:0.4)};
)
(
~bum.play;
~bum.fadeTime=1;
~bum.quant=1;
~bum.clock=TempoClock(120/60).permanent_(true);
(~bum[1]=Pbind(
	\instrument, \bum,
	\dur,Pseq([Pseq([1,[-1,1],4].convertRhythm),
		],inf),
	\legato, 0.3,
	\octave, [2,3],
	\degree, Pseq([Pn([2,3],1),Pn([5,6],1)],inf),
	\amp,1/2
	;

););

~bum[2]=\filter->{arg in; Pan2.ar(Splay.ar(in),SinOsc.kr(1))};

// ~bum[3]=\filter->{arg in;Limiter.ar(in,0.4)};
~bum[4]=\filter->{arg in;Limiter.ar(GVerb.ar(in,mul:0.4,add:in),0.4)};
// ~bum[4]=nil;
)
(
~tss.play;
~tss.fadeTime=1;
~tss.quant=1;
~tss.clock=TempoClock(120/60).permanent_(true);
(~tss[1]=Pbind(
	\instrument, \tss,
	\dur, Pseq([Pseq([4,[-1,1,0.25,-0.5,0.25],4].convertRhythm),],inf),
	\legato,0.02,
	\freq,[6000,1100],
	\pan,0,
	\amp, 1);

);
~tss[2]=\filter->{arg in; CombL.ar(in,2,1/4,2)};
~tss[2]=nil;
~tss[3]=\filter->{arg in; FreeVerb.ar(in,0.4)};
~tss[4]=nil;
)
(
~tus.fadeTime=1;
~tus.quant=1;
~tus.clock=TempoClock(120/60).permanent_(true);
(~tus[1]=Pbind(
	\instrument, \tus,
	\dur, Pseq([Pseq([2,[0.25,0.25,-0.5,1,2],1].convertRhythm)],inf),
	\legato,1,
	\octave, Pseq([Pn([5,2],16),[2,3],[2,1]],inf),
	\degree, [4,6,12],
	\pan, Pseq([-1,0,0,1],inf),
	\amp, Pseq([1,0.5],inf)
););
~tus[2]=\filter->{arg in; FreeVerb.ar(in,0.4)};
~tus[3]=\filter->{arg in; CombN.ar(in,2,1/4)};
)

(

~blow.fadeTime=1;
~blow.quant=1;
~blow.clock=TempoClock(60/60).permanent_(true);
(~blow[1]=Pbind(
	\instrument, \blow,
	\dur, Pseq([4,2],inf),
	\legato,3,
	\octave, Prand([[4,2,6],[7,6],[4,2],[3,2],[1,2]],inf),
	\degree,Pseq([[4,2,6,8],[4,8],[4,2],[4,2,6]],inf),
	\amp, Pseq([1],inf)/3

););
~blow[3]=\filter->{arg in; AllpassN.ar(in,2,0.2)};
~blow[4]=\filter->{arg in; GVerb.ar(in,[40,80,120],[4,6],mul:0.4,add:in)*4};
// ~blow[5]=nil;
)
(

~strange.fadeTime=1;
~strange.quant=1;
~strange.clock=TempoClock(60/60).permanent_(true);
(~strange[1]=Pbind(
	\instrument, \strange,
	\dur, Pseq([Pseq([4,[0.25,0.25,-0.5,1,2],1].convertRhythm)],inf),
	\legato,0.6,
	\octave, [5,5],
	\degree,[4,8,9],
	\amp, Pseq([1,0.5],inf)
););
~strange[3]=\filter->{arg in; AllpassN.ar(Splay.ar(in),2,1,4)};
~strange[4]=\filter->{arg in; GVerb.ar(in,20,mul:0.2,add:in)};
~strange[5]=\filter->{arg in; LPF.ar(in,13000)};
)

