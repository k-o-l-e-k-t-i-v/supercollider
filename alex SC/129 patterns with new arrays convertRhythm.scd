
(
~bumlow.play;
~bumlow.fadeTime=1;
~bumlow.quant=1;
~bumlow.clock=TempoClock(120/60).permanent_(true);
(~bumlow[1]=Pbind(
	\instrument, \bum,
	\dur, Pseq([Pseq([4,[1,1,1,0.5,0.5],4].convertRhythm)],inf),
	\legato, 0.4,
	\octave, Pseq([[2,1]!2,[2,3]!4],inf),
	\degree, Pseq([[2,3],[2,5]],inf),
	\amp, 1/4
););
~bumlow[4]=\filter->{arg in;Limiter.ar(GVerb.ar(in,20,[0.5,0.75],mul:0.2,add:in),0.8)};
~bumlow[5]=\filter->{arg in; LPF.ar(Limiter.ar(in,0.7),600,add:in*0.5,mul:0.4)};

~bum.play;
~bum.fadeTime=1;
~bum.quant=1;
~bum.clock=TempoClock(120/60).permanent_(true);
(~bum[1]=Pbind(
	\instrument, \bum,
	\dur,Pseq([Pseq([4, [1,1,0.25,0.75], 4].convertRhythm)],inf),
	\legato, 0.3,
	\octave, [2,3],
	\degree, Pseq([Pn([2,3],1),Pn([2,4],1)],inf),
	\amp,1/4
	;

););

~bum[2]=\filter->{arg in; Pan2.ar(Splay.ar(in),SinOsc.kr(1))};
~bum[4]=\filter->{arg in;Limiter.ar(GVerb.ar(in,mul:0.4,add:in),0.4)};

)

(
~tss.play;
~tss.fadeTime=1;
~tss.quant=1;
~tss.clock=TempoClock(120/60).permanent_(true);
(~tss[1]=Pbind(
	\instrument, \tss,
	\dur, Pseq([Pseq([0.5,[1/4,1/8, 1/8, 1,4],4].convertRhythm),],inf),
	\legato,0.2,
	\freq,12000,
	\pan,Pseq([-1,1],inf),
	\amp, 1/4);

);
~tss[2]=\filter->{arg in; Splay.ar(in,0)*LFSaw.kr([8,4])};
~tss[2]=nil;
~tss[3]=nil;

)


(
~juu.play;
~juu.fadeTime=1;
~juu.quant=1;
~juu.clock=TempoClock(120/60).permanent_(true);
(~juu[1]=Pbind(
	\instrument, \ju,
	\dur, Pseq([Pseq([4,[1/4,-1, 1/8, -1,4],4].convertRhythm),],inf),
	\legato,0.4,
	\freq,[55,25],
	\f2, 30,
	\amp, 1);

);
~juu[2]=\filter->{arg in; Splay.ar(in,0)*LFSaw.kr([8,4])};
~juu[2]=\filter->{arg in; AllpassL.ar(in,0.02,decaytime:2,mul:0.5)+in};
~juu[2]=nil;

)