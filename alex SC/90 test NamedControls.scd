t=TempoClock(1,0).permanent_(true);
p=ProxySpace.push(s,clock:t);

t.beats;

(
ProxySynthDef( \low, {
	arg sustain,amp;
	var sig,fenv, env;

	env=EnvGen.kr(Env.perc(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar([fenv,fenv+2],add:WhiteNoise.ar(0.1).clip(0,0.21))*env*amp;
}).add;
)

(
~low.quant=1;
~low.play;
~low.mold(2);

~low[0]=Pbind(
	\instrument, \low,
	\dur, Pseq([Pn(0.125,4),0.5,0.5],inf),
	\legato, Pseq([Pn(0.7,3),0.5,1.2,1.2],inf),
	\amp, 0.25,
	\octave, Pseq([Pn(3,3),4,2,2],inf),
	\degree, [2,6]
);

~low[30]=\filter-> {arg in; GVerb.ar(in,roomsize:\room.kr,revtime:\rev.kr,drylevel:\dry.kr,add:in,mul:\vol.kr)};
~low[31]=\set->Pbind(\args, [\room,\rev,\dry,\vol],
	\dur,4,
	\rev, Pseq([1,3,2],inf),
	\room, Pseq([10,100,200],inf),
	\dry, Pseq([1,1,0.5],inf),
	\vol, 0.5

);

)