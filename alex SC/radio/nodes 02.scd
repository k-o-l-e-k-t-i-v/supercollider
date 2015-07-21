AutoIDE.run;
p=ProxySpace.push(s);


(
~pitch1.play;
~pitch1.fadeTime=1;
~pitch1.quant=1;
~pitch1.clock=TempoClock(60/60).permanent_(true);
~pitch1[0]=Pbind(\instrument, \pitch,
	\dur, 10,
	\legato,1.2,
	\octave,Pseq([4,[5,4],[4,6],[4,5]],inf),
	\degree, [8,5,3,7],
	\strum, 3,
	\amp, 0.5);

~pitch1[30]=\filter-> {arg in;  GVerb.ar(in,80,maxroomsize:90,add:in)};
~pitch1[31]=\filter-> {arg in; HPF.ar(in,65)};
)
~pitch1.clear;

(
~voice1.play;
~voice1.fadeTime=1;
~voice1.quant=1;
~voice1.clock=TempoClock(60/60).permanent_(true);
~voice1[0]=Pbind(\instrument, \voice,
	\dur, 6,
	\legato,1.2,
	\octave,Pseq([7,[4,2],[6,5]],inf),
	\degree, [2,5,3,7],
	\strum, 3,
	\amp, 0.02);

~voice1[30]=\filter-> {arg in;  GVerb.ar(in,2,3,drylevel:SinOsc.kr(0.1).range(0.1,0.7),maxroomsize:10,add:in)};
)
~voice1.clear;

(

~bum1.play;
~bum1.fadeTime=1;
~bum1.quant=1;
~bum1.clock=TempoClock(60/60).permanent_(true);
~bum1[0]=Pbind(\instrument, \sin,
	\dur, Pseq([1,0.5,Rest(2)],inf),
	\legato, 0.5,
	\octave,Pseq([Pn([2,1],4),[3,2]],inf),
	\degree, [6,7],
	// \strum, 0.2,
	\amp, 0.1);
~bum1[30]=\filter-> {arg in;  FreeVerb.ar(in,SinOsc.kr(0.5).range(0.3,0.8),1,add:in)};
)
~bum1.clear;


(

~bum2.play;
~bum2.fadeTime=1;
~bum2.quant=1;
~bum2.clock=TempoClock(60/60).permanent_(true);
~bum2[0]=Pbind(\instrument, \bum,
	\dur,Pseq([1,Rest(0.25)],inf),
	\legato, 0.5,
	\octave,Pseq([Pseq([2,3],4),[2,1],3],inf),
	\degree, [8,4],
	\amp, 0.8);
~bum2[30]=\filter-> {arg in;  FreeVerb.ar(in,0.3,0.5,add:in)};
)
~bum2.clear;
(

~bum.play;
~bum.fadeTime=1;
~bum.quant=1;
~bum.clock=TempoClock(80/60).permanent_(true);
~bum[0]=Pbind(\instrument, \sin,
	\dur, 0.1,
	\legato, 0.7,
	\freq,85,
	\amp, 20);
~bum[30]=\filter-> {arg in;  FreeVerb.ar(in,SinOsc.kr(0.5).range(0.3,0.8),1,add:in*2).clip(-1,1)};
// ~bum[31]=\filter-> {arg in; Limiter.ar(in,-1,1)}
)
(
~bum3.play;
~bum3.fadeTime=1;
~bum3.quant=1;
~bum3.clock=TempoClock(60/60).permanent_(true);
~bum3[0]=Pbind(\instrument, \glitch,
	\dur, Pseq([0.25,0.5,Rest(1)],inf),
	\legato, 0.5,
	\freq,Pseq([Pn(65,4),55],inf),
	\n, 0,
	\amp, 0.5);
~bum3[30]=\filter-> {arg in;  FreeVerb.ar(in,SinOsc.kr(0.5).range(0.3,0.8),1,add:in)};
)
~bum1.clear;

(
~sin1.play;
~sin1.fadeTime=1;
~sin1.quant=1;
~sin1.clock=TempoClock(60/60).permanent_(true);
~sin1[0]=Pbind(\instrument, \sinlong,
	\dur, 12,
	\legato, 0.4,
	\octave,Pseq([[5,6],[4,8],[3,7]],inf),
	\degree, [4,3,8,4,6],
	\strum, 2,
	\amp, 0.01);
~sin1[30]=\filter-> {arg in;  GVerb.ar(in,20,2,1,maxroomsize:45,add:in)};
)
~sin1.clear;

(
~sin2.play;
~sin2.fadeTime=1;
~sin2.quant=1;
~sin2.clock=TempoClock(60/60).permanent_(true);
~sin2[0]=Pbind(\instrument, \sinlong,
	\dur, 4,
	\legato, 0.4,
	\octave,Pseq([[5,6],[4,2],[3,7]],inf),
	\degree, [2,3,8,4,6],
	\strum, 0.2,
	\amp, 0.01);
~sin1[30]=\filter-> {arg in;  GVerb.ar(in,20,2,1,maxroomsize:45,add:in)};
)

~saw1.clear;
(
~saw1.play;
~saw1.fadeTime=1;
~saw1.quant=1;
~saw1.clock=TempoClock(60/60).permanent_(true);
~saw1[0]=Pbind(\instrument, \saw,
	\dur, 4,
	\legato, 0.6,
	\freq, Pseq([45,60,45,55],inf),
	//\octave, Pseq([[2,3],[3,1],[2,3]],inf),
	//\degree, [2,3,4,2],
	\lag, 0.002,//Pseq([Penv([0.1,0.02,0.01,0.02,0.2],[0.4,0.2,1,0.5],\lin),0.1],inf),
	\strum, 1,
	\amp,2);
~saw1[30]=\filter-> {arg in;  FreeVerb.ar(in,room:2,add:in)};
)

(

~bum3.play;
~bum3.fadeTime=1;
~bum3.quant=1;
~bum3.clock=TempoClock(60/60).permanent_(true);
~bum3[0]=Pbind(\instrument, \glitch,
	\dur, Pseq([Rest(3), 1],inf),
	\legato, 0.5,
	\octave,[2,3],
	\degree, [3,4],
	\n, Pseq([1,0,3],inf),
	\amp, 1);
~bum3[30]=\filter-> {arg in;  FreeVerb.ar(in,SinOsc.kr(0.5).range(0.3,0.8),1,add:in)};
)

(

~onion1.play;
~onion1.fadeTime=1;
~onion1.quant=1;
~onion1.clock=TempoClock(60/60).permanent_(true);
~onion1[0]=Pbind(\instrument, \onion,
	\dur, Pseq([0.25, 0.5,Rest(2.75)],inf),
	\legato, 0.7,
	\octave,[1,2,3],
	\degree, [2,3,1],
	\strum, 1,
	\f2, 20,
	\fsaw, 45,
	\amp, 2);
~onion1[30]=\filter-> {arg in;  GVerb.ar(in,40,2,1,maxroomsize:45,add:in)};
~onion1[31]=\filter-> {arg in; HPF.ar(in,200)};
)