p=ProxySpace.push(s);

(
ProxySynthDef(\bum, {
	arg sustain, freq, amp, voln, top;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*top, freq],[ sustain*0.04], [\welch]));
	sig= SinOsc.ar(fenv!2,add:LPF.ar(Dust.ar(voln).lag(0.0002),2000));
	sig*env*amp;

}).add;

ProxySynthDef(\bumblow, {
	arg sustain, freq, amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq],[ sustain*0.04], [\welch]));
	sig= SinOsc.ar(fenv!2,mul:0.5)+StkBlowHole.ar(\f2.kr!2,noisegain:60,register:12,mul:SinOsc.kr(\f2.kr/100,mul:0.2));
	sig*env*amp;

}).add;

ProxySynthDef(\tic, {
	arg sustain, freq, amp, b;
	var sig, env, fenv, mul;

	mul=SelectX.ar(b, [
		Decay.ar(Impulse.ar([10,15]),0.5),
		LFSaw.ar([5,4]),
		LFPulse.ar([40,22]).lag(0.02)]);

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5, freq],[ sustain*0.04], [\welch]));
	sig= SinOsc.ar(fenv!2)*(mul+WhiteNoise.ar(0.02));
	sig*env*amp;

}).add;


ProxySynthDef(\sin, {
	arg sustain, freq, amp, voln;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=Mix.fill(20, {arg i; SinOsc.ar(freq*[1,2,3,5,8].reciprocal,add:GrayNoise.ar(voln))});
	Limiter.ar(sig,0.5)*env*amp;


}).add;

ProxySynthDef(\ts, {
	arg sustain, amp, freq;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2, freq, freq*4], [0.2, 0.4]*sustain));
	sig=(Dust.ar(fenv!4)+GrayNoise.ar(0.5!4).clip(0.2,0.6))*LFSaw.kr(fenv).lag(0.02);
	sig*env*amp;}).add;


ProxySynthDef(\blow, {
	arg sustain, amp,noise, freq;
	var env, sig;
	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=StkBlowHole.ar(freq,noisegain:noise);
	sig=Pan2.ar(sig,SinOsc.kr(\f2.kr))*env*amp;

}).add;

ProxySynthDef(\saw, {
	arg sustain, amp, freq, voln;
	var env, sig;
	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(freq,[0,2,pi,2pi],add:WhiteNoise.ar(SinOsc.kr(\f2.kr).range(0.1,0.5))*voln).clip(-0.5,0.5).lag(0.0002)*env*amp;


},makeFadeEnv:true).add;

)

{Decay.ar(Impulse.ar([10,1]),0.2)*SinOsc.ar(80)}.play;
(
~a.play;
~a.clock=TempoClock(180/60).permanent_(true);
~a.fadeTime=0.2;
~a.quant=0.2;
~a[0]=Pbind(\instrument, \bum, \dur, Pseq([1,Rest(0.25),0.75,Rest(1)],inf), \legato, 0.6, \octave, 3, \degree, Pseq([[5,3],[4,6]],inf), \voln, Pseq([2000,200],inf),\top, 4, \amp, 0.3);
~a[31]=\filter-> {arg in; CombN.ar(in,maxdelaytime:2,delaytime:1,decaytime:2)};
~a[32]=\filter->{arg in; GVerb.ar(in,20,2,add:in)};


)

(
~atwo.play;
~atwo.clock=TempoClock(480/60).permanent_(true);
~atwo.fadeTime=0.25;
// ~atwo.quant=2;
~atwo[0]=Pbind(\instrument, \bum,
	\dur,
		Pseq([1,Rest(1.5),0.5,Rest(1),1,Rest(2),0.5, Rest(1),1.5],inf),


	\legato, 0.6, \freq,45, \voln,10000,\top, 6, \amp,0.4);
~atwo[30]=\filter-> {arg in; FreeVerb.ar(in,room:2,add:in)};

)

(
~b.play;
~b.clock=TempoClock(240/60).permanent_(true);
~b.fadeTime=2;
~b.quant=2;
~b[0]=Pbind(\instrument, \sin, \dur, 2, \legato, 0.4,
	\octave, Pseq([
		Pseq([4,5,3,6,4,5],4),
		Pseq([6,4,5,6,4,5],4),
		Pseq([7,4,5,7,4,5],4),

	],inf),
	\degree, Prand([[2,8],[6,4]],inf), \voln, 0, \amp, 0.1);
~b[30]=\filter->{arg in; CombN.ar(in,4,1,3)};
~b[31]=\filter-> {arg in; FreeVerb.ar(in,room:1)};

)

(
~c.play;
~c.clock=TempoClock(60/60).permanent_(true);
~c.fadeTime=2;
// ~c.quant=2;
~c[0]=Pbind(\instrument, \ts, \dur, 8, \legato, 1, \freq, 5, \amp, 1);
~c[30]=\filter->{arg in; FreeVerb.ar(in, room:1)};

)

(
~d.play;
~d.fadeTime=2;
~d.quant=2;
~d[0]=Pbind(\instrument, \blow, \dur, Pseq([ 1,Rest(2)],inf), \legato, 0.7,\octave, 4,\degree, Pseq([4,2,6,2,8],inf), \f2, 0.4, /*\octave,5, \degree, [2,6,8]*/  \amp, 15);
~d[30]=\filter-> {arg in; FreeVerb.ar(in,room:1)};
)

(
~e.play;
~e.fadeTime=0.2;
~e.quant=2;
~e.clock=TempoClock(140/60).permanent_(true);
~e[0]=Pbind(\instrument, \saw, \dur, Pseq([1, Rest(0.25),0.5,Rest(0.5), 0.75,Rest(1)],inf), \octave, 3, \degree, [2,4], \amp, 0.8,\f2, 4, \voln,0.5);
// ~e[30]=\filter-> {arg in; CombN.ar(in,0.5,0.5)};
~e[31]=\filter->{arg in; FreeVerb.ar(in,room:1)};
)

(
~f.play;
~f.fadeTime=1;
~f.quant=1;
~f.clock=TempoClock(300/60).permanent_(true);
~f[0]=Pbind(\instrument, \tic, \dur, Pseq([1, Rest(2), 0.5,Rest(0.25),0.5, Rest(0.75), 0.75, Rest(0.25)],inf),\octave, 3,  \degree,[3,5,7] , \legato, 0.8, \amp, 0.9, \b, Pseq([0,1,2],inf));
~f[30]=\filter-> {arg in; FreeVerb.ar(in,room:0.7)};
)


(
~g.play;
~g.fadeTime=1;
~g.quant=1;
~g.clock=TempoClock(60/60).permanent_(true);
~g[0]=Pbind(\instrument, \bumblow, \dur, Pseq([1, Rest(2)],inf),\octave, 2,  \degree,[3,5,7] , \legato, 0.8, \amp, 0.9, \f2, 700);
~f[30]=\filter-> {arg in; FreeVerb.ar(in,room:0.7)};
)