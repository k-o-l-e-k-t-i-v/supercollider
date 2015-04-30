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


ProxySynthDef(\bum1, {
	arg sustain, amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env.perc(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!2)*env*amp;
}).add;

ProxySynthDef(\zzz, {
	arg sustain, amp,speed;
	var sig, env,fenv, lagenv;

	env=EnvGen.kr(Env.new(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*2,\freq.kr],[sustain*0.08]),\gate.kr(1),timeScale:sustain);
	lagenv=EnvGen.kr(Env.new([\lag.kr*0.1,\lag.kr],[sustain*0.7]),\gate.kr(1),timeScale:sustain);

	sig=Lag.ar(LFSaw.ar(fenv),lagenv)*env*amp;
	sig=Pan2.ar(sig,SinOsc.kr(sustain/speed));
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
	\vol, 0.5)
)

(
~bum1.quant=1;
~bum1.play;
~bum1.mold(2);

~bum1[0]= Pbind(
	\instrument, \bum1,
	\dur, Pseq([Pn(0.25,8),Rest(1)],inf),
	\legato, Pseq([Pn(0.5,4),0.25,0.7,0.5,0.5,Rest(1)],inf),
	\octave, Pseq([Pn(2,54), Pn([3,2],9)],inf),
	\degree, Pseq([Pn(4,4),7,3,4,4,Rest(1)],inf),
	\amp, 0.5
);
~bum1[30]=\filter -> {arg in; FreeVerb.ar(in,SinOsc.kr(\ln.kr(1)).range(0.3, 1),0.1)};
// ~bum1[31]=\filter -> {arg in; GVerb.ar(in,\room.kr(1),\rev.kr(0.5),add:in)};
);
)
(
~bum2.quant=2;
~bum2.play;
~bum2.mold(2);

~bum2[0]=Pbind(
	\instrument, \bum1,
	\dur, 6,
	\legato, 0.2,
	\octave, 2,
	\degree, 4,
	\amp, 0.2,
);
~bum2[30]=\filter -> {arg in; GVerb.ar(in,200,2,add:in)};


~zum1.quant=1;
~zum1.play;
~zum1.mold(2);

~zum1[0]=Pbind(
	\instrument, \zzz,
	\dur, 2,
	\legato, 0.5,
	\amp, Pseq([Pseries(0.05,0.1,3), Rest(3)],inf),
	\lag, Pseq([Pn(0.01,4),Pn(0.001,6)],inf),
	\speed, 1,
	\octave, 2,
	\degree, Pseq([Pn(6,4),[6,2],3,8],inf),
);

~zum1[30]=\filter-> {arg in; FreeVerb.ar(in, SinOsc.kr(0.5).range(0.3,1),2,damp:\damp.kr)};
~zum1[31]=\set->Pbind(\args,[\damp],
	\dur, 8,
	\damp, Pseq([0,0.5,0,0.5],inf)
	);
)

(
~bum1.play;
~bum2.play;
~zum1.play;
)