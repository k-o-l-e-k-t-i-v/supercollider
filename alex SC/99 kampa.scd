(
ProxySynthDef(\ff, {
	arg sustain, amp, voln, f2, top;
	var sig, env, fenv, nenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr,\freq.kr+10,\freq.kr],[0.04,0.1,0.86]),\gate.kr(1),timeScale:sustain);
	nenv=EnvGen.kr(Env.new([0,0.7,0,0.1],[0.04,0.3,0.66]),\gate.kr(1),timeScale:sustain);

	sig=SinOsc.ar(fenv!2,
		add:HPF.ar(WhiteNoise.ar(nenv).clip(0.2,0.8),Saw.kr(2).range(1100,f2)));
	sig=sig+Dust.ar(Decay2.ar(Impulse.ar(50)).range(10,top),0.2);
	sig=sig*env*amp
}).add;


ProxySynthDef(\pulse, {
	arg sustain, amp;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\n.kr,[WhiteNoise.ar(0.35!2),GrayNoise.ar(0.7).softclip(0.5,1)]);

	env=EnvGen.kr(Env([0,1,0.7,0.5,0],[0.25,0.10,0.75],[\welch,\sin,\step]),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr,\f2.kr],[sustain*0.1],\welch),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(fenv,iphase:0.7)*BPF.ar(noise,fenv,add:noise*0.5)*env*amp;
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
)



(


~bsimple.clock=TempoClock(140/60).permanent_(true); //10 to 60

~bsimple.play();
~bsimple.fadeTime=1;
~bsimple.quant=1;
~bsimple[0]=Pbind(
		\instrument, \ff,
	\dur, Pseq([1, Rest(5)],inf),
	    \freq,65,
	    \top, 20,
		\amp, 0.4,
	    \legato,Pseq([0.7,0.9],inf),
		\f2,10,
);
~bsimple[30]=\filter-> {arg in; FreeVerb.ar(in,room:2,add:in)};
)
(

~b.clock=TempoClock(240/60).permanent_(true); //10 to 60

~b.play();
~b.fadeTime=1;
~b.quant=1;
~b[0]=Pbind(
		\instrument, \ff,
	\dur, Pseq([Rest(1),1,0.5,Rest(4)],inf),
	    \freq,60,3
	    \top, 20,
		\amp, 0.4,
	    \legato,Pseq([0.7,0.9],inf),
		\f2,10,
);
~b[30]=\filter-> {arg in; FreeVerb.ar(in,room:23,add:in)};
)
(
~d.clock=TempoClock(140/60).permanent_(true); //10 to 60

~d.play();
~d.fadeTime=1;
~d.quant=1;
~d[0]=Pbind(
		\instrument, \pulse,
	\dur, Pseq([Rest(3),3],inf),
	    \freq,100,
	    \top, 2000,
		\amp, 0.4,
	\n, Pseq([Pn(1,4), Pn(0,4)],inf),
	    \legato,Pseq([0.7,0.9],inf),
		\f2,10,
);
~d[30]=\filter-> {arg in; GVerb.ar(in,roomsize:120,revtime:4,add:in)};
)
(

~v.clock=TempoClock(140/60).permanent_(true); //10 to 60

~v.play();
~v.fadeTime=1;
~v.quant=1;
~v[0]=Pbind(
		\instrument, \lf,
	    \dur, 3,
	\freq,Pseq([Penv([80,50],[3])],inf),
		\amp, 0.4,
	    \legato,Pseq([0.7,0.9],inf),

);
~v[30]=\filter-> {arg in; GVerb.ar(in,roomsize:120,revtime:4,add:in)};
// ~bsimple.play();
)
