(

ProxySynthDef(\bum, {
	arg sustain, amp, voln, f2, top;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*top,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!16,
		add:HPF.ar(GrayNoise.ar(voln).clip(0.05,0.3),f2))*env*amp;
}).add;

ProxySynthDef(\lf, {
	arg sustain, amp, dust;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\n.kr,[WhiteNoise.ar(0.35!2),GrayNoise.ar(0.7).softclip(0.5,1)]);

	env=EnvGen.kr(Env([0,1,0.7,0.5,0],[0.25,0.10,0.75],[\welch,\sin,\step]),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr,\f2.kr],[sustain*0.1],\welch),timeScale:sustain,doneAction:2);
    lag=EnvGen.kr(Env([0.02,0,0.2],[sustain*0.2,sustain*0.8],\welch),timeScale:sustain,doneAction:2);
	dust=EnvGen.kr(Env([20,2000],[sustain*0.4],\welch),doneAction:2);
	sig=LFSaw.ar([fenv,fenv+10, fenv],[0,pi,2pi]).lag(lag)+Dust2.ar(dust,0.5)*env*amp;
}).add;



ProxySynthDef(\zzz, {
	arg sustain, amp,speed,vol;
	var sig, env,fenv, lagenv;

	env=EnvGen.kr(Env.new(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*2,\freq.kr],[sustain*0.08]),\gate.kr(1),timeScale:sustain);
	lagenv=EnvGen.kr(Env.new([\lag.kr*0.1,\lag.kr],[sustain*0.7]),\gate.kr(1),timeScale:sustain);
	sig=Lag.ar(LFSaw.ar(fenv),lagenv)*env*amp;
	sig=Pan2.ar(sig,SinOsc.kr(sustain/speed),vol);
}).add;

)

(
~b1.clock=TempoClock(120/60).permanent_(true);

~b1.play();
~b1.fadeTime=1;
~b1.quant=2;
~b1[0]=Pbind(
	\instrument, \bum,
	\dur,1,
	\top, Pseq([2,2,15,2],inf),
	\freq,65,
	\amp, 0.1,
	\legato,Pseq([0.3,0.4,[0.3,0.7],0.5],inf),
	\voln, Pseq([0.1,0.2,0.7,0],inf),
	\f2,Pseq([20,100,50,1500],inf),
);
~b1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:100,revtime:2,add:in)};


~z1.clock=TempoClock(120/60).permanent_(true);

~z1.play();
~z1.fadeTime=1;
~z1.quant=1;
~z1[0]=Pbind(
		\instrument, \lf,
	\dur, Prand([4,2,1],inf),
	    \freq,60,
		\amp, 0.3,
	    \legato,Pseq([0.7,0.9],inf),

);
~z1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:250,revtime:2,add:in)};



~zum2.clock=TempoClock(120/60).permanent_(true);
~zum2.play;


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

