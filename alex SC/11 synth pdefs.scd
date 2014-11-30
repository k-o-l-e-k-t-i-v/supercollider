s.scope(2);
PdefAllGui(10);

//////////////KAT
(
x=SynthDef(\kat,{
	arg vol=0.5, freq=1005, freqPulse=10, gate=1, phaseSin=0, addSin=0, maxdelay=0.2;
	var env, tone;
	env=EnvGen.kr(Env.adsr(0.01,0.3,0.3,0.3,1,-4),gate, doneAction:2);
	tone=SinOsc.ar([freq,freq+2,freq+4,freq+6], phaseSin,vol, addSin)*env;
	tone=tone*Pulse.kr(freqPulse);
	tone=AllpassC.ar(tone,maxdelay,0.2,0.5);
	Out.ar(0, tone);
}).add;
)

y=x.play;
y.free;

(
z=SynthDef(\brr,{
	arg vol=0.5, freq=1500, gate=1, freqSaw=55, freqPulse=15;
	var env, tone;
	env=EnvGen.kr(Env.asr(0.1,0.5,1,-3),gate, doneAction:2);
	tone=SinOsc.ar(freq, 0,vol)*env;
	tone=tone*VarSaw.ar(freqSaw,0,0.5,vol);
	tone=tone*Pulse.ar(freqPulse);
	Out.ar(0,tone);
}).add;
)

x=z.play;
x.free;


(
r=SynthDef(\pink, {
	arg freq=150, vol=0.3, gate=1, freqImulse=5, pos=0, size=0.2;
	var env, tone;
	env=EnvGen.kr(Env.adsr(0.1,0.5,0.2),gate, doneAction:2);
	tone=PinkNoise.ar(freq);
	tone=tone*Impulse.ar(freqImulse,0,vol);
	tone=FreeVerb.ar(tone, size);
	tone=Pan2.ar(tone,pos);
	Out.ar(0,tone);
}).add;
)

v=r.play;
v.free;

(
m=SynthDef( \soft,
	{ arg  freq=65, sustain=0.5, vol=0.3;
		var env, tone;
		env=EnvGen.kr(Env.linen(0.02, sustain, 0.2), doneAction:2);
		tone=Splay.ar((SinOsc.ar([freq,freq+2,freq+1,freq+4,freq+6,freq+7,freq+8],[0,1/2pi]* env)!4),1,0.2);
		tone=FreeVerb.ar(tone,0.1,0.2,0.3,vol);
		tone=tone*VarSaw.kr(20);
		Out.ar(0, tone )
}).add;
)

n=m.play;
m.free



Pdef(\loopbrr).stop;

(
Pdef(\loopbrr, {
	Pbind(
		\instrument, \brr,
		\freq, Pseq([Pseq([1200,1000,1500,1700],3),2000],inf),
		\freqSaw, Pseq([Prand([45,40,20],3),50,40,10],inf),
		\freqPulse, Pseq([Prand([25,10,15],2), 30,10],inf),
		\dur, Pseq([Prand([1,2,2.2,1],2),2,1,3],inf),
		\legato, Pseq([0.5,1,2,0.5],inf),
)}).play;
)

Pdef(\looppink).stop;

(
Pdef(\looppink,{
	Pbind(
		\instrument, \pink,
		\dur, Pseq([Prand([0.5,0.5,0.2],3),Rest(0.1),0.2,Rest(0.3),0.1,0.4,Rest(0.3)],inf),
		\size, Pseq([Prand([0.02,0.05,0.5,0.1],2),0.3,0.2],inf),
		\freqImpulse, Pseq([10, 50, 2, 3,Prand([10,15,20,50],4)],inf),
		\vol, 0.2,
		\pos, Pseq([-1,1],inf),
)}).play;
)

Pdef(\loopsoft).stop;

(
Pdef(\loopsoft, {
	Pbind(
		\instrument, \soft,
		\freq, Pseq([Pseq([65,70],2),Pwalk([65,70,70,65],1,1,0)],inf),
		\dur,  Prand([0.5,0.1,0.5,1],inf),
		\legato, Prand([0.25,0.5,0.7,1],inf),
		//\legato,0.25
)}).play;
)

Pdef(\loopkat).stop;
(
Pdef(\loopkat, {
	Pbind(
		\instrument, \kat,
		\freq, Pseq([4200,2000],inf),
		\dur,  Pseq([Prand([0.1,0.1,0.2],2),0.7],inf),
		\maxdelay, Pseq([0.1,0.1,0.5],inf),
		\legato, Prand([0.25,0.5,0.25],inf),
		\vol,0.1,
				\freqPulse, Pseq([Pn([15,15,5],2),30],inf),
			)}).play;
)