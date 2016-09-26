currentEnvironment.free;
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;

p.clock.tempo = 127/60;
p.gui;

//////////////////////////////////////////////////////////////////////////////////////////////


~intro.play(vol:0.1, fadetime:10, numChannels:2);
~intro.clear(fadeTime:10);
(~intro[0]={BPF.ar(GVerb.ar(Wrap.ar(CombN.ar(Dust.ar(Line.kr(18,1800,30)!2),2,1)*(-1),-0.8,0.8),120,5,mul:0.7),Line.kr(45,5000,30),Line.kr(2,0.02,30))};)




~tum1.clear;
~tum1.stop(freeTime:10);
~tum1.play(vol:1, fadeTime:4, numChannels:2).quant_(4);
(~tum1[0]=Pbind(
	\instrument, \tum,
	\amp, Pseq([1!3,0.5,1],inf),
	\legato, 1,
	\pan, Pseq([-1!2,1!2,0],inf),
	\octave, [2,1],
	\degree, [3,6],
	\dur, Pseq([Pseq([2,[0.5,0.5,0.5,0.5,0.5,-1],1].convertRhythm)],inf),
	\rq, Pseq([Pseries(2,0.2,100),Pseries(0.1,0.2,100)],inf),
);)
~tum1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(400,2)),0.7)};
~tum1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.1)+in,4)};
~tum1[4]=nil;



~bum1.clear;
~bum1.stop(fadeTime:10);
~bum1.play(vol:0.2, fadeTime:4, numChannels:2).quant_(4);
(~bum1[0]=Pbind(
	\instrument, \bum,
	\amp,1,
	\legato, 1,
	\freq, [44,45],
	\rq, 0.002,
	\dur, Pseq([Pseq([1,Rest(1)],4)],inf)
);)
~bum1[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,20,mul:0.1,add:in*0.5))};



~aural1.stop(fadeTime:10);
~aural1.play(vol:0.03, fadeTime:4, numChannels:2).quant_(4);
(~aural1[0]=Pbind(
	\instrument, \aural,
	\amp,Prand([0.8,0.4,0.6],inf)/4,
	\legato, 1.5,
	\octave, Prand([[5,6],[4,2],[5,4],[3,6]],inf)+1,
	\degree, Prand([[1,5],[4,7],[7,2],[2,4],[2,6],[4,2]],inf),
	\dur, 2
);)
~aural1[5]=\filter->{arg in; GVerb.ar(in,[40,60],[8,4],mul:0.2)+in};
~aural1[6]=\filter->{arg in; LPF.ar(in,\lpf3.kr(2000,4))};
// ~aural1[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, 1000);
// ~aural1[7]=nil;



~zit.clear;
~zit.stop(fadeTime:10);
~zit.play(vol:0.001,fadeTime:4, numChannels:2).quant_(4);
(~zit[1]=Pbind(
	\instrument, \zit,
	\dur, Pseq([Pseq([2,[0.5,0.5,-0.5,0.5,0.5,-1],1].convertRhythm), Rest(2)],inf),
	\legato,0.3,
	\octave, [4,8,6]-3,
	\degree,2,
	\amp, Pseq([1,0.5],inf),
	\pan, Pseq([1,0,-1,-1,1,-1],inf),
	\hpf,500,
	\noise, Pseq([Pseries(0.01,0.02,100),Pseries(1,-0.02,100)],inf) ,

););
~zit[3]=\filter->{arg in; AllpassN.ar(Splay.ar(in),0.02)};
~zit[5]=\filter->{arg in; GVerb.ar(in,20,[4,6],mul:0.2,add:in)};
~zit[6]=\filter->{arg in; LPF.ar(in, \lpf2.kr(400,4))};
// ~zit[4]=nil;



~drib1.stop(fadeTime:4);
~drib1.play(vol:0.2,fadeTime:4, numChannels:2).quant_(4);
(~drib1[1]=Pbind(
	\instrument, \dribble,
	\dur, Pseq([Rest(7),1,Rest(4),1, Rest(11)],inf),
	\legato,0.4,
	\octave, [2,8,5]+Prand([(-1),1],inf),
	\degree,[2,4,8],
	\amp, 0.6,
	\lag, [0.4,0.2],
	\f2, Prand([2,5],inf)
););
~drib1[5]=\filter->{arg in; GVerb.ar(in,120,[4,6],mul:0.4,add:in)};




~src.stop(fadeTime:10);
~src.play(vol:10,fadeTime:4, numChannels:2).quant_(4);
(~src[1]=Pbind(
	\instrument, \scr,
	\dur,16,
	\legato,0.1,
	\amp, 20, /////////careful
	\den, Prand([[8,3],[10,4]],inf),
));
~src[5]=nil;
~src[6]=\filter->{arg in; GVerb.ar(in,[142,80],[2,4],mul:0.5,damping:SinOsc.kr(1).range(0.3,0.8),inputbw:0.8,drylevel:0.5,add:in)};
~src[7]=\filter->{arg in; LPF.ar(Splay.ar(in),\lpf1.kr(50,4))};
~src[8]=\set->Pbind(\args, [\lpf], \dur,4, \lpf1, Pseq([5000,100],inf));

