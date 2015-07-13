p=ProxySpace.push(s);
(

ProxySynthDef(\step, {
	arg sustain, amp, freq, gate=1;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,0.5,1,0],[0.3,0.65,0.05],[\lin, \step,\lin]),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq, freq*2.7, freq], [0.95,0.0001,0.01], [\lin, \step,\welch]),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0, 0.05, 0.4, 0.7, 0], [0.85,0.05,0.05,0.05], [\lin, \step,\step]),gate,timeScale:sustain);
	penv=EnvGen.kr(Env([0, -1, 0,0, 1], [0.6,0.65,0.05], [\lin, \step,\welch]),gate,timeScale:sustain);


	sig=Pan2.ar(SinOsc.ar(fenv,add:GrayNoise.ar(nenv)),penv);
	sig*env*amp}).add;
)


(
~t.play;
~t.fadeTime=1;
~t.quant=1;
~t[0]=Pbind(\instrument, \step,
	\dur, 4,
	\legato, 0.6,
	\octave, Pseq([2,3,2,3,9],inf),
	\degree, [1,3],
	\strum, 0.2,
	\amp, 0.1);
~t[30]=\filter->{arg in; GVerb.ar(in,SinOsc.ar([0.125,0.025,0.0125,]).range(60,20),maxroomsize:64,add:in)};
~t[31]=\filter->{arg in; GVerb.ar(in,Phasor.ar(Impulse.ar([0.125,0.025,0.0125]),0.001).range(40,80),2,taillevel:0.7,maxroomsize:120)};
~t[32]=\filter->{arg in; LPF.ar(in,\lpf.kr)};
~t[33]=\set->Pbind(\args, [\lpf], \dur, 4, \lpf, Pseq([1200,1400,600,400,800],inf));
)


{GrainSin.ar(2, Impulse.ar([4,1,0.25,0.125,0.45,2]),[0.1,0.2,0.5,0.06],[200,120,400,800,600],0)}.play;

(
{FreeVerb.ar(
	in:MoogFF.ar(LFPulse.ar([300,302],[0,1.2]).lag(0.02)+LFCub.ar([150,151]),freq:[240,250,260],gain:SinOsc.ar([0.25,0.125],[0,5]).range(0.1,4)),
	mix:SinOsc.ar([0.125,0.5]).range(0.3,0.7),
	room:1,
	damp:SinOsc.ar([0.025,0.25,0.125]).range(0.1,0.7))-0.3}.play;
)