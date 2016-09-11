{LFPulse.ar(LFSaw.kr(8!2).range(SinOsc.kr(1/16).range(60,90),SinOsc.kr(1/32).range(6,15)).midicps, 1, 0.5, 1,-0.5).lag(0.1)}.play;








~tum1.clear;
~tum1.stop(freeTime:10);
~tum1.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
(~tum1[0]=Pbind(
	\instrument, \tum,
	\amp, Pseq([1!3,0.5,1],inf),
	\legato, 1,
	\pan, Pseq([-1!2,1!2,0],inf),
	\octave, [2,3]-1,
	\degree, [3,6],
	\dur, Pseq([Pseq([2,[0.5,0.5,0.5,0.5,0.5,-1],1].convertRhythm)],inf),
	\rq, Pseq([Pseries(2,0.2,100),Pseries(0.1,0.2,100)],inf),
);)
~tum1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(400,2)),0.7)};
~tum1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.2)+in,0.7)};
// ~tum1[4]=nil;


~aural1.clear;
~aural1.stop(fadeTime:40);
~aural1.play(vol:0.011, fadeTime:4, numChannels:2).quant_(4);
(~aural1[0]=Pbind(

	\instrument, \aural,
	\amp,Prand([0.8,0.4,0.6],inf)/4,
	\legato, 1.5,
	\octave, Prand([[5,6],[4,2],[5,4],[3,6]],inf),
	\degree, Prand([[1,5],[4,7],[7,2],[2,4],[2,6],[4,2]],inf),
	\dur, 2
);)
~aural1[5]=\filter->{arg in; GVerb.ar(in,[40,60],[8,4],mul:0.2)+in};
~aural1[6]=\filter->{arg in; LPF.ar(in,\lpf3.kr(2000,4))};
// ~aural1[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, 1000);
// ~aural1[7]=nil;


~kick.clear;
~kick.stop(freeTime:10);
~kick.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
(~kick[0]=Pbind(
	\instrument, \kick,
	\amp, 0.5,
	\legato, 0.5,
	\pan, Pseq([-1!2,1!2,0],inf),
	\octave, [2,1],
	\degree, [3,6],
	\dur,2, //Pseq([Pseq([2,[0.5,0.5,0.5,0.5,0.5,-1],1].convertRhythm)],inf),

);)
~kick[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(400,2)),0.7)};
~kick[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),120,[4,5],mul:0.2)+in,0.7)};
// ~kick[4]=nil;





~zit.clear;
~zit.stop(fadeTime:10);
~zit.play(vol:0.03,fadeTime:4, numChannels:2).quant_(4);
(~zit[1]=Pbind(
	\instrument, \zit,
	\dur, 1,
	\legato,0.5,
	\octave, [4,8,6]-3,
	\degree,2,
	\amp, Pseq([1,0.5],inf),
	\pan, Pseq([1,0,-1,-1,1,-1],inf),
	\hpf,100,
	\noise,0.7 ,

););
~zit[3]=\filter->{arg in; AllpassN.ar(Splay.ar(in),0.02)};
~zit[5]=\filter->{arg in; GVerb.ar(in,20,[4,6],mul:0.2,add:in)};
~zit[6]=\filter->{arg in; LPF.ar(in, 8000)};