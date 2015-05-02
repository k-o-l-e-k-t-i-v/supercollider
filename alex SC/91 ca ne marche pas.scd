t=TempoClock(1,0).permanent_(true);
p=ProxySpace.push(s);

t.beats;

(
ProxySynthDef(\zzz, {
	arg sustain, amp,speed,vol;
	var sig, env,fenv, lagenv;

	env=EnvGen.kr(Env.new(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*2,\freq.kr],[sustain*0.08]),\gate.kr(1),timeScale:sustain);
	lagenv=EnvGen.kr(Env.new([\lag.kr*0.1,\lag.kr],[sustain*0.7]),\gate.kr(1),timeScale:sustain);
	sig=Lag.ar(LFSaw.ar(fenv),lagenv)*env*amp;
	sig=Pan2.ar(sig,SinOsc.kr(sustain/speed),vol);
}).add;

ProxySynthDef(\bum2, {
	arg sustain, amp, voln, f2;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!2,
		add:HPF.ar(WhiteNoise.ar(voln).clip(0.05,0.1),Saw.kr(2).range(11000,f2))

	)*env*amp;
}).add;

ProxySynthDef(\ping, {
	arg sustain, amp,leng;
	var sig, env, fenv;

	env=EnvGen.kr(Env.new(), \gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new(curve:\welch),\gate.kr(1),timeScale:sustain);

	sig=SinOsc.ar([\freq.kr,\freq.kr+2])*amp;
	sig=sig*env;
}).add;



)
(
~n1.quant=1;
~n1.play;
~n1[0]=Pbind(\instrument, \ping, \dur, 12, \legato, 0.05,
	\octave,Prand([4,6,5,6,3],inf),
	\degree, [2,6],
);
~n1[30]=\filter-> {arg in; CombN.ar(in,0.5,0.5,2)};
~n1[31]=\filter->{arg in; FreeVerb.ar(in,0.5,1.2)};
)

(
~zum2.quant=1;
~zum2.play;
~zum2.mold(2);

~zum2[0]=Pbind(
	\instrument, \zzz,
	\dur, Pseq([2,1,4,6,2],inf),
	\legato, Prand([0.5,0.7],inf),
	\amp, Pseq([Pseries(0.05,0.5,3), Rest(3)],inf),
	\lag, Pseq([Pn(0.01,4),Pn(0.001,2),Pn(0.0006,2)],inf),
	\speed, 0.5,
	\octave, [3,4],
	\degree, Pseq([Pn([3,2],4),[4,2],6,8],inf),
	\vol,0.2,
);

~zum2[30]=\filter-> {arg in; FreeVerb.ar(in, SinOsc.kr(0.5).range(0.3,1),2,damp:\damp.kr)};
~zum2[31]=\set->Pbind(\args,[\damp],
	\dur, 8,
	\damp, Pseq([0,0.5,0,0.5],inf)
	);
)


(
~b1.quant=1;
~b1.play;
~b1.mold(2);
~b1[0]=Pbind(
	\instrument, \bum2,
	\dur, Pseq([0.25,0.25,0.25,0.25, Rest(0.25), 0.25, Rest(0.5)],inf),
	\legato, 1.2,
	\voln, Pseq([
		Pseq([Pn(0,7)],2),
		Pseq([0,0.2,0,0,0,0.1,0],4),
		Pseq([0,0.2,0,0.1,0,0.3,0],4),
		Pseq([0,0.6,0,0,0,0.5,0],2)],inf),
	\f2, Pseq([Pn(4000,14), Pn(8000,7)],inf),
	\amp, 0.6,
	\octave,2,
	\degree, Pseq([2,6,2,2,2,6,4],inf),
);
~b1[30]=\filter -> {arg in; FreeVerb.ar(in,room:0.25,damp:1)};


)

(
~b2.quant=1;
~b2.play;
~b2[0]=Pbind(\instrument, \bum2,
	\dur, 6, \legato, 0.2,
	\voln, 0.5,
	\f2, 4000,
	\freq, 65,
	\amp, 0.2
);
~b2[30]=\filter-> {arg in; GVerb.ar(in,100,1,damping:1,add:in)};
)

(
~n1.play;
~b2.play;
~zum2.play;
~b1.play;
)
