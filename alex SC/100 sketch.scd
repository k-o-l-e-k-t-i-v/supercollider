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
    lag=EnvGen.kr(Env([0.02,0],[sustain*0.8],\welch),timeScale:sustain,doneAction:2);
	dust=EnvGen.kr(Env([20,2000],[sustain*0.4],\welch),doneAction:2);
	sig=LFSaw.ar([fenv,fenv+10, fenv],[0,pi,2pi]).lag(lag)+Dust2.ar(dust,0.5)*env*amp;
}).add;


ProxySynthDef(\dd, {
	arg sustain, amp, gate;
	var sig, env,fenv, nenv;

	env=EnvGen.kr(Env([1,0.7,0.2,1,0], sustain*[0.05,0.25,0.6,0.1],[\sin,\welch,\welch,\step]),doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr+220,\freq.kr+10,\freq.kr, \freq.kr,\freq.kr+880], sustain*[0.05,0.25,0.6,0.1]));
	nenv=EnvGen.kr(Env([0,0.2,1,0.5,0], sustain*[0.05,0.25,0.6,0.1]));
	sig=BPF.ar((LFSaw.ar([fenv, fenv+2]).softclip(0,0.1)+GrayNoise.ar(nenv))+BrownNoise.ar(0.3),fenv,rq:1);
	sig=sig+Dust.ar(1,0.2)*GrayNoise.ar(0.7).clip(0.6,0.7);
	sig=sig*env*amp;
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
	    \dur, 4,
	    \freq,60,
		\amp, 0.3,
	    \legato,Pseq([0.7,0.9],inf),

);
~z1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:250,revtime:2,add:in)};




~v1.clock=TempoClock(120/60).permanent_(true);

~v1.play();
~v1.fadeTime=1;
~v1.quant=2;
~v1[0]=Pbind(
	\instrument, \dd,
	\dur,10,
	\top, Pseq([10,10,5,2],inf),
	\amp, 0.1,
	\legato,0.5,
	\octave, Pseq([4,3,5],inf),
	\degree, Prand([[2,6,4],[3,5],[6,8]],inf),
	\strum, 4,
);
~v1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:200,revtime:2,drylevel:1,add:in)};
~v1[31]=\filter-> {arg in; LPF.ar(in,1800)};

)
