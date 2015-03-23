s.scope(8);
////HIGH FREQUENCY//////////111111

(
Ndef(\1).fadeTime=2;
Ndef(\l, {

	~m=Line.kr(0,1,180);    ////volume ramp

	~s=HPF.ar(WhiteNoise.ar(1),10000);
	~s=~s*Decay2.kr(Impulse.kr([0.5,0.25]),decayTime:0.051);
	~s=FreeVerb.ar(~s,mix:0.5,room:2,damp:0,mul:~m);  ////mul
}).play;
)
Ndef(\l).stop;

////


//////////TING RYTHM FAST///1111111
(
Pdef(\ting,
	Pbind(
		\instrument, \ting,
		\dur, Pseq([0.12,Rest(0.8)],inf),
		\freq,14000,
		\pan, Prand([-1,1],inf),
		\legato, 0.5,
		\amp, 0.01,
)).play(quant:2);
)
Pdef(\ting).stop;


////////TING RANDOM
(
Pdef(\ting2,
	Pbind(
		\instrument, \ting,
		\dur,
		Prand([0.2,0.12,0.4,0.12,Rest(0.2),0.1,0.2,0.2,Rest(0.1),Rest(0.2),Rest(0.4)],inf),
		\freq,16000,
		\pan, Prand([-1,1],inf),
		\legato, 0.5,
		\amp, 0.01,
)).play(quant:2);
)
Pdef(\ting2).stop;

//////////////////////////////////////////////////////////////////////////




//////RIPPLE

(
Pdef(\loprip1,
	Pbind(
		\instrument, \ripple,
		\dur, 0.5,
		\freq,Pseq([700,Pn(400,2),300],inf),
		\amp, 0.6,
		\legato,0.4,
		\f2,1,
)).play(quant:2);
)
Pdef(\lopup1).stop;




////BEATS

(
Pdef( \bum1,
	Pbind(
		\instrument, \bum,
		\dur, 2,
		\freq,45,
		\legato, Pseq([0.9,0.6],inf),
		\amp, 0.1
)).play(quant:2);
)
Pdef( \bum1).stop;

//these two together

(
Pdef( \bum2,
	Pbind(
		\instrument, \bum,
		\dur, 0.5,
		\freq,65,
		\legato, Pseq([
			Pseq([0.8,0.2],2),
			Pseq([0.8,0.4],1),
			Pseq([0.8,0.8],1),
			Pseq([0.8,1],2),
			Pseq([0.8,1.2],6),
			Pseq([0.8,1.4],4),
			Pseq([0.8,0.4],1),
		],inf),
		\amp, 0.1
)).play(quant:2);
)
Pdef( \bum2).stop;

(
Pdef(\bum3,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([0.5,0.2,0.5,Rest(0.25)],inf),
		\freq,Pseq([Pn(45,16), Pn(65,8)],inf),
		\amp,0.4,
		\legato,Pseq([0.8,0.6],inf),
)).play(quant:2);
)
Pdef(\bum3).stop;


////high beat very fast
(
Pdef(\ting,
	Pbind(
		\instrument, \ting,
		\dur, Pseq([0.12,Rest(0.8)],inf),
		\freq,14000,
		\pan, Prand([-1,1],inf),
		\legato, 0.4
)).play(quant:2);
)
Pdef(\ting).stop;


//////HAT WITH ECHO
(
Pdef( \lopwoosh,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([0.5,Rest(1.5)],inf),
		\freq,10000,
		\legato, 2,
		\f2, Pseq([Pseries(2,4,5),Pseries(10,-2,3)],inf),  ///rythmical
		\amp, 1
)).play(quant:2);
)
Pdef( \lopwoosh).stop;

(
Pdef( \lopwoosh1,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([0.15],inf),       //very simple
		\freq,11000,
		\legato, 0.2,
		\amp, 0.8,
		\f2, 2,
)).play(quant:2);
)
Pdef( \lopwoosh1).stop;

////////////////////////////////////////////////////////////////////////////////////////

///////CONTEMPLATIVE

(
Pdef(\loppzum,
	Pbind(
		\instrument, \zum,
		\dur, Pseq([2,2,3,1,2,1],inf),
		\note, [7,1,3,5],
		\strum, 0.2,
		\octave, Pseq([[8,6],[7,5],[4,7],[6,8,5],[7,4,8],[3,4,8]],inf),
		\legato, 2,
		\lag, 0.02,
		\amp,0.01,

)).play(quant:2);
)
Pdef(\loppzum).stop;


///////////////////////////ASTRAL AS FUCK////////55555555555
(
Pdef(\ASTRAL,
	Pbind(
		\instrument, \sin,
		\dur,4,
		\octave, Pseq([3,4,5,3,6,7,5,2],inf),
		\note, [1,5,7,9],
		\strum,0.45,
		\amp, 0.008,
		\legato,2,
)).play;
)
Pdef(\ASTRAL).stop;

/////////////////// ANGRY DOCTOR PART 66666666666666666 ////


//////RIPPLE

(
Pdef(\loprip1,
	Pbind(
		\instrument, \ripple,
		\dur, 0.5,
		\freq,Pseq([700,Pn(400,2),300],inf),
		\amp, 0.6,
		\legato,0.4,
		\f2,1,
)).play(quant:2);
)
Pdef(\lopup1).stop;



(
Pdef(\loptic1,
	Pbind(
		\instrument, \tictum,
		\dur, Pseq([2,Rest(1)],inf),
		\freq, Pseq([Pn(4000,4),Pn(500,2)],inf),  //////
		\amp, 0.5,
		\legato, 1,
)).play(quant:2);
)

Pdef(\loptic1).stop;





////////HAPPY CREEPY TIU TIU////////////////7777777777777





///there is no happy






//////////DRONE////////99999999999999

(
Pdef(\dfm1,
	Pbind(
		\instrument, \dfm,
		\dur, 4,
		\strum, 1,
		\octave, Prand([[4,3],[5,2],[4,3],[4,4]],inf),
		\notes, Prand([[1,5,7],[6,4,8],Prand([[2,5],[1,3],[2,4]],2)],inf),
		\legato,2,
		\lag, 0.002,
		\res, Prand([1,0.5,1.2,1.4,0.2],inf),
		\amp, 0.4,   //not bigger than 0.5
)).play(quant:2);
);

Pdef(\dfm1).stop;


////roar

(
Pdef(\roar,
	Pbind(
		\instrument, \dribble,
		\dur, 1,                    /////attention to arg in synth
		\freq,Pseq([Pn(60,4),Pn(85,2)],inf),
		\f2, 0.5,
		\legato, 0.6,
		\lag, 0.8,
)).play(quant:2);
)

Pdef(\roar).stop;





///////////////////PIANO
(
Pdef(\piano,
	Pbind(
		\instrument, \piano1,
		\octave, Pseq([3,3,4,2,3,6,5,2],inf),
		\note, [1,5,7,1,3],
		\dur,2,
		\strum, 0.75,
		\amp, 1,
)).play;
)
Pdef(\piano).stop;


(
Pdef(\piano2,
	Pbind(
		\instrument, \piano1,
		\octave, Pseq([6,7,4,5,6,5, Pn(6,2), Pn(4,2),Pn(2,2)],inf),
		\note, [1,3,7,5,3,7],
		\dur,2,
		\strum, 0.75,
		\amp, 0.1,
)).play;
)
Pdef(\piano2).stop;

/////////////////



//////////////POLAR WIND?


(
Ndef(\5).fadeTime=2;
Ndef(\5).quant=2;
Ndef(\5, {
	var s2, b=4;

	s2=GrayNoise.ar(LFSaw.ar(0.5).range(0,0.5));
	s2=BPF.ar(Clip.ar(s2,-0.5,0.5),freq:SinOsc.kr(b/20).range(100,220),
		rq:LFNoise0.kr(b/10).range(0.1,0.001));
	s2=FreeVerb.ar(s2,SinOsc.kr(b/10).range(0.1,0.7),room:3,damp:0,add:s2);
	// s2=s2*SinOsc.kr(b/30).range(0,0.7);
	s2=Splay.ar(s2,0.2);

	s2=s2*0.2;

}).play;
)

Ndef(\5).stop;








