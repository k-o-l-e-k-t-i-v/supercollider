s.scope(2);
s.makeWindow;



(

//bass

SynthDef(\bass,
	{arg gate=1, amp=1, freq=65;
		var  tone;
		tone=(VarSaw.ar(freq,0, 0.2,amp)*Pulse.kr([1,2,3,5,8,13,21],0.5));
		tone=LPF.ar(tone, 270);
		tone=FreeVerb.ar(tone,0.3,0.8,0.5,amp);
		Out.ar(0, tone);
}).play;

///pink

SynthDef(\pink,
	{ arg freq=0.3, vol=0.03, high=900, pos=0,  gate=1; //time=1,
		var tone,env;
		env=EnvGen.ar(Env.asr(0.1,0.2,1,-4), gate, doneAction:2);
		tone=Pulse.ar(freq)*PinkNoise.ar;
		tone=HPF.ar(tone,high);
		tone=FreeVerb.ar(tone,0.4,0.5,0.5);
		tone=Pan2.ar(tone,pos,1)*vol;//*time;
		Out.ar(0,tone);
}).add;

///bling

SynthDef(\bling,
	{ arg freq=1800, vol=0.1;
		var tone, env;
		env=EnvGen.ar(Env([0,1,0],[0.5,1.5]), doneAction:2);
		tone=SinOsc.ar([freq, freq+2,freq+4,freq+6, freq+8],0,vol);
		//tone=tone*Saw.kr(15);
		tone=tone*Saw.kr(55);
		tone=AllpassL.ar(tone,0.5,0.8,2,1);
		tone=FreeVerb.ar(tone,0.5,0.5,0.5,1);
		tone=env*tone;
		Out.ar(0, tone);
}).add;

)


(
{Pan2.ar(PinkNoise.ar, SinOsc.kr(0.25), 0.1)*SinOsc.kr(0.25)}.play;

(
Pdef(\loopbass, {
	PmonoArtic(
		\bass,
		\freq, Pseq([65,65,80,85],inf),
		\dur, 2,
		\legato,1,
		\amp, 1,

)}).play(quant:2);
)
//Pseq([Pn([65],2),60],2),65
//Pdef(\loopbass).fadeTime=1;
//Pdef(\loopbass).stop;
//Pdef(\loopbass).play;


Pdef(\lopbling,{
	Pbind(
		\instrument, \bling,
		\freq, Pseq([Pseq([Pn([400],2),800],1),950],inf),
		\dur, 1,
		\legato, 1,

)}).play(quant:4);
Pdef(\loopbling).fadeTime=1;



//Pdef(\loopbling).fadeTime=1;


Pdef(\lop, {
	Pbind(
		\instrument, \pink,
		\freq, Pseq([0.3,1,0.5,4],inf),
		\dur, 0.5,
		\legato, 1,
		\pos, Pseq([0,-1,1],inf),
)}).play(quant:4);

Pdef(\loopbling).fadeTime=1;

)



//////////////////////////////////////Decay//pulse from 0.3 to 100 and more
//high from 900 down to 90

(
Pdef(\decay,{
	Pbind(
		\instrument, \pink,
		\freq, Pseries(0.3,0.05,100),
		\high, Pseries(900,-7,100),
		//\pos, Pseq(-1,1),
		\time, Pseries(1,-0.04,40),
)}).play(quant:1);
)
////////////////////////////////////

