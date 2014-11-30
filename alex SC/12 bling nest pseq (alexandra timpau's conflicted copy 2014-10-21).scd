s.scope(2);
PdefAllGui(21);


Pdef(\loopbass).play(quant:1);


(

SynthDef(\bass,
	{arg gate=1, vol=1.2, freq=65;
		var  tone;

		tone=(VarSaw.ar(freq,0, 0.2, vol)*Pulse.kr([1,2,3,5,8],0.5));
		tone=LPF.ar(tone, [170,172]);
		tone=FreeVerb.ar(tone,0.3,0.5,1);
		Out.ar(0, tone);
}).play;
)


(
Pdef(\loopbass, {
	PmonoArtic(
		 \bass,
		\freq, Pseq([Pn(50,2),80],inf),
		\dur, 2,
		\legato,1,

)}).play(quant:2);
)

(
SynthDef(\bling,
	{ arg freq=1800, vol=1;
		var tone, env;
		env=EnvGen.ar(Env([0,1,0],[0.1,0.3]), doneAction:2);
		tone=SinOsc.ar([freq, freq+2,freq+4,freq+6, freq+8],[0,0.01],vol);
		tone=tone*Pulse.kr(5);
		tone=tone*Saw.kr(65);
		tone=AllpassL.ar(tone,0.5,0.1,2);
		tone=env*tone;
		Out.ar(0, tone);
}).play;
)

(
Pdef(\loopbling,{
	Pbind(
		\instrument, \bling,
		\freq, Prand([Pseq([1660,1770,1660],1),Pseq([1660,1990,1100],1),Pseq([1260,1270,1160],1),1],inf),
		\dur, Pseq([0.12,Rest(0.1),0.1,0.11],inf),

)}).play(quant:1);
)



(
SynthDef(\pink,
	{ arg freq=0.2, vol=0.2, high=900, time=1, gate=1;
		var tone, env;
		env=EnvGen.ar(Env([1,0.2,0],[0.4,0.8]), gate, doneAction:2);
		tone=Pulse.ar(freq,0.5,vol)*PinkNoise.ar;
		tone=HPF.ar(tone,high);
		tone=FreeVerb.ar(tone,0.33,0.4,0.5,vol)*time;
		Out.ar(0,tone);
}).add;
)

//pulse from 0.3 to 100 and more
//high from 900 down to 90

(
Pdef(\looppink,{
	Pbind(
		\instrument, \pink,
		\freq, Pseries(0.2,0.5,40),
		\high, Pseries(900,-7,40),
		\vol,  Pseries(0.5,-0.5,40),
		\time, Pseries(1,-0.02,40),
)}).play(quant:1);
)



