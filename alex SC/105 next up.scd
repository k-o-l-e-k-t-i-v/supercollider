p=ProxySpace.push(s);
(

ProxySynthDef(\step, {
	arg sustain, amp, freq, gate=1;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,0.5,1,0],[0.3,0.65,0.05],[\lin, \step,\lin]),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq, freq*2.7, freq], [0.95,0.0001,0.01], [\lin, \step,\welch]),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0, 0.05, 0.4, 0.7, 0], [0.85,0.05,0.05,0.05], [\lin, \step,\step]),gate,timeScale:sustain);
	penv=EnvGen.kr(Env([0, -1, 1], [0.6,0.3,0.1], [\lin, \step,\welch]),gate,timeScale:sustain);


	sig=Pan2.ar(SinOsc.ar(fenv,add:GrayNoise.ar(nenv)),penv);
	sig*env*amp}).add;



ProxySynthDef(\quitar, {
	arg sustain, amp, freq, gate=1, lpf;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env.perc(0.01,0.99),gate, timeScale:sustain,doneAction:2);
	sig=LPF.ar(LeakDC.ar(CombN.ar(PinkNoise.ar(1)*env,freq.reciprocal,freq.reciprocal,4)),lpf);
	sig=Pan2.ar(sig,0)*amp;


}).add;


ProxySynthDef(\grains, {
	arg sustain, amp, freq, gate=1, lpf, lag, n;
	var sig, env, fenv, nenv, penv, noise;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	sig=LPF.ar(LeakDC.ar(
		Lag.ar(CombC.ar(GrayNoise.ar(amp)*env,Lag.kr(freq.reciprocal,0.2),Lag.kr(freq.reciprocal,0.3),12),lag)),lpf);
	sig=Pan2.ar(sig,0)*amp;


}).add;

ProxySynthDef(\glitch, {
	arg sustain, freq, n, gate=1, amp, pos;
	var sig, env, glitch, fenv;
	glitch=SelectX.ar(n,[
		HPF.ar(GrayNoise.ar(1)*Decay2.kr(Impulse.kr(15),decayTime:0.5),9000),
		LFSaw.ar(LFNoise0.kr(100).range(3,0.5)),
		LFPulse.ar(freq/15,add:Dust.ar(700)),
		WhiteNoise.ar(Decay.kr(Impulse.kr(5)).exprange(0.8,0.01))

	]);
	env=EnvGen.kr(Env([0,1,0], [0.1,0.9]),gate:gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq], [sustain*0.04]),gate:gate);
	sig=Pan2.ar(Limiter.ar(Mix.fill(20,{SinOsc.ar(fenv)}),1)+glitch,pos);

	sig*env*amp;}).add;






)
~t.rebuild;

(
~t.play;
~t.fadeTime=1;
~t.quant=1;
~t[0]=Pbind(\instrument, \step,
	\dur, Pseq([Pseries(10,-1,9),Pn(1,inf)],1),
	\legato, 0.6,
	\octave, Pseq([Pseq([1,2,3,11,2],20),Pseq([2,3,2,3,9],20)],inf),
	\degree, Pseq([Pn([1,5,3],20),Pn([5,1,3],20)],inf),
	\strum, 0.2,
	\amp, 0.1).trace;
~t[30]=\filter->{arg in; GVerb.ar(in,SinOsc.ar([0.125,0.025,0.0125,]).range(60,20),maxroomsize:64,add:in)};
~t[31]=\filter->{arg in; GVerb.ar(in,Phasor.ar(Impulse.ar([0.125,0.025,0.0125]),0.001).range(120,80),2,taillevel:0.7,maxroomsize:125)};
~t[32]=\filter->{arg in; LPF.ar(in,\lpf.kr)};
~t[33]=\set->Pbind(\args, [\lpf], \dur,10, \lpf, Pseq([1200,1400,1600,2400,2800,1200,400],inf));

~t[36]=\filter-> {arg in;  Limiter.ar(in, 1)};
)
~t.set(\fpf, 100);


(
~qui.play;
~qui.fadeTime=1;
~qui.quant=1;
~qui.clock=TempoClock(120/60).permanent_(true);
~qui[0]=Pbind(\instrument, \quitar,
	\dur, Pseq([7,6,8,2],inf),
	\legato, 1.2,
	\octave, Pseq([Pn(3,4), 4, [5,3]],inf),
	\degree, [4,6,2],
	\lpf, Pseq([10000,12000,5000],inf),
	\strum,Pseq([0.1,1,0.5,2],inf),
	\amp, 1).trace;


~qui[32]=\filter->{arg in; LPF.ar(in,\lpf2.kr,add:in*0.1)};
~qui[33]=\set->Pbind(\args, [\lpf2], \dur,Pseq([7,6,8,2],inf), \lpf2, Pseq([5200,3400,4600,3400,8000,4200,5400],inf));
~qui[34]=\filter->{arg in; Resonz.ar(in,\freq2.kr*[1,1.1,1.4,1.2],[0.1,0.1,0.2,0.1,0.5],add:in)};
~qui[35]=\set->Pbind(\args, [\freq2], \dur, 8, \freq2, Pseq([3000,4000,2500,1500],inf));
~qui[37]=\filter->{arg in; Limiter.ar(in,1)};

)


(
~grain.play;
~grain.fadeTime=1;
~grain.quant=1;
~grain.clock=TempoClock(120/60).permanent_(true);
~grain[0]=Pbind(\instrument, \grains,
	\dur, Pseq([1,Rest(3)],inf),
	\octave,Pseq([Pn(3,4),Pn(4,4),Pn([2,5],4)],inf),
	\legato,4,
	\lag, Pseq([Penv([0.001,0.1,0.5],[0.1,0.2,0.02],\welch),0.02,0.4],inf),
	\lpf, 1500,
	\amp, 2,
	\degree, Pseq([5,4,3,2,4,5],inf));
~grains[30]=\filter->{arg in; Compander.ar(in)};
~grain[30]=\filter->{arg in; GVerb.ar(in,60,maxroomsize:65,add:in)};
~grain[36]=\filter-> {arg in; Limiter.ar(in,level:0.6)};
)
	