AutoIDE.run;
p=ProxySpace.push(s);


(
ProxySynthDef(\long, {
arg sustain, amp, freq, gate=1;
var sig, env, fenv, nenv, penv;

env=EnvGen.kr(Env([0,1,0,0.4,0],[0.1,0.4,0.1,0.4],\welch),gate, timeScale:sustain,doneAction:2);
fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
nenv=EnvGen.kr(Env([0.1,0,0,0.2,0,0.8],[0.1,0.3,0.1,0.2,0.1], [\lin, \step, \step, \step,\step]),gate,timeScale:sustain);
penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);


	sig=Pan2.ar(LFSaw.ar(fenv,add:GrayNoise.ar(nenv)).lag(0.002),penv);
sig*env*amp}).add;




ProxySynthDef(\saw, {
	arg sustain, amp, freq, gate=1,n, lag;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain*0.004], \welch),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0,0,0.1,0.4], [0.2,0.2,0.4,0.2], \step),gate,timeScale:sustain);
	penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);


	sig=Pan2.ar(Lag.ar(LFSaw.ar(fenv*n).lag(lag),0.1),penv);
	sig*env*amp}).add;


ProxySynthDef(\sin, {
	arg sustain, amp, freq, gate=1,n, lag;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4,freq], [sustain*0.004], \welch),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0,0,0.1,0,0.2,0], [0.2,0.2,0.4,0.1,0.1], \step),gate,timeScale:sustain);
	penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);


	sig=SinOsc.ar(fenv!2,add:GrayNoise.ar(nenv));
	sig*env*amp}).add;


ProxySynthDef(\quitar, {
	arg sustain, amp, freq, gate=1, lpf;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env.perc(0.01,0.99),gate, timeScale:sustain,doneAction:2);
	sig=LPF.ar(LeakDC.ar(CombN.ar(WhiteNoise.ar(1)*env,freq.reciprocal,freq.reciprocal,4)),lpf);
	sig=Pan2.ar(sig,0)*amp;


}).add;

)
(

~saw1.play;
~saw1.fadeTime=1;
~saw1.quant=1;
~saw1.clock=TempoClock(120/60).permanent_(true);
~saw1[0]=Pbind(\instrument, \saw,
	\dur, Pseq([Pn(0.5,4), Rest(2), 2, 4,1,4 ,Pn(0.12,4)],inf),
	\lag, Pseq([0.002,0.004,0.01,0.002],inf),
	\legato, 2,
	\octave, Pseq([[4,7], 7, [5,6], [4,6], [3,6]],inf),
	\n, 4,
	\strum, 2,
	\amp,2);
~saw1[30]=\filter-> {arg in; Limiter.ar(in,2)};
~saw1[31]=\filter-> {arg in; GVerb.ar(in,roomsize:20,add:in)};
~saw1[32]=\filter-> {arg in; LPF.ar(in,164,add:in)};
)

~sin1.clear;
(
~sin1.play;
~sin1.fadeTime=1;
~sin1.quant=1;
~sin1.clock=TempoClock(60/60).permanent_(true);
~sin1[0]=Pbind(\instrument, \sin,
	\dur, 3,
	\legato, 0.5,
	\octave, [2,3],
	\degree, Pseq([4,3,4,5],inf),
	\n, 1,
	\amp, 0.4);
~sin1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:140,add:in)};
~sin[31]=\filter->{arg in; Limiter.ar(in,0.4)};


)

(

~q1.play;
~q1.fadeTime=1;
~q1.quant=1;
~q1.clock=TempoClock(60/60).permanent_(true);
~q1[0]=Pbind(\instrument, \quitar,
	\dur, 4,
	\legato, 0.5,
	\strum, 0.25,
	\amp, 2,
	\lpf, 700,
	\octave, Pseq([2,[3,1],3],inf),
	\degree, [4,5,5,2]);
~q1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:130,revtime:2,maxroomsize:134,add:in)};
/*~q1[31]=\filter->{arg in; BPF.ar(in,\freq2.kr,0.1)};
~q1[32]=\set->Pbind(\args, [\freq2], \dur, Pseq([2,4,2,3,1],inf), \freq2, Pseq([164,164*2,164*3,164/3,164/2],inf));*/
~q1[34]=\filter-> {arg in; Limiter.ar(in,1)};
)



(
~sin2.play;
~sin2.fadeTime=1;
~sin2.quant=1;
~sin2.clock=TempoClock(60/60).permanent_(true);
~sin2[0]=Pbind(\instrument, \sin,
	\dur, 1,
	\legato, 0.8,
	\octave, Pseq([5,4,6],inf),
	\degree, [5,3],
	\amp, 1,
);
~sin2[30]=\filter-> {arg in; FreeVerb.ar(in,room:2)};
)


(

~long.play;
~long.fadeTime=1;
~long.quant=1;
~long.clock=TempoClock(60/60).permanent_(true);
~long[0]=Pbind(\instrument, \long,
	\dur, 4,
	\legato, 1.2,
	\octave, Pseq([[3,6],[5,4],[6,2],[4,5]],inf),
	\strum, 0.3,
	\degree, 3,
	\amp,2);
~long[30]=\filter-> {arg in; GVerb.ar(in,roomsize:50,add:in)};
~long[31]=\filter-> {arg in; LPF.ar(in,\freq2.kr)};
~long[32]=\set-> Pbind(\args, [\freq2], \dur, Pseq([2,4],inf), \freq2, Pseq([1400,600,1220,880],inf));
~long[33]=\filter-> {arg in; Limiter.ar(in,1)};
)

	