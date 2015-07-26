p=ProxySpace.push(s);
AutoIDE.run;

~ss.play(vol:0.051, fadeTime:4);
(
~ss[0]={
	var sig, env, fenv,nenv;

	env=EnvGen.ar( Env( [0,1,0], [0.05,0.2]), \trig.tr);
	fenv=EnvGen.ar( Env( 200*[25,1,4,1], [0.15,0.05,0.05]), \trig.tr);
	nenv=EnvGen.ar( Env( [2,1,0,1], [0.15,0.05,0.05]), \trig.tr);

	sig=BPF.ar(PinkNoise.ar(nenv),\freq.kr,rq:LFNoise0.kr(1).range(0.001,2));

};
~ss[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);
~ss[30]=\set->Pbind(\args, [\freq], \dur, 0.2, \freq,Prand([2000,4000,1500,3000,1880,4400,1200],inf));
~ss[31]=\filter->{arg in; GVerb.ar(in,3,4,maxroomsize:200,add:in)};
~ss[32]=\filter->{arg in; CompanderD.ar(in,0.8,1.3)*Decay2.ar(Impulse.ar(0.5),decayTime:1)};
~ss[32]=\filter->{arg in; LPF.ar(in,100)};
// ~ss[33]=\filter->{arg in; in+FreeVerb.ar((GrayNoise.ar(LFNoise0.kr(0.25).range(0.1,0.2))*LFSaw.ar([2,4,3,5].reciprocal)),room:1)};
)
~ss.clear;
currentEnvironment.clear;


~dd1.play(vol:0.0, fadeTime:0.2);
(
~dd1.play(vol:0.5, fadeTime:0.2);
~dd.quant=0.2;
~dd1[0]={
	var sig, env, fenv;

	env=EnvGen.ar( Env( [0,1,0], [0.05,0.25]), \trig.tr);
	fenv=EnvGen.ar( Env(\freq.kr*[8,1,1], [0.05,0.25],\welch), \trig.tr );

	sig=LFSaw.ar(fenv,add:Dust.ar(LFNoise0.kr(20).range(15000,120)));
	sig=sig*env;};
~dd1[1]=\set-> Pbind(\args, [\trig], \dur, 0.5, \trig, 1);
~dd1[2]=\set-> Pbind(\args, [\freq], \dur, 0.5, \freq, 50);

~dd1[30]=\filter->{arg in; GVerb.ar(in,8,maxroomsize:15)};

)

~dd1.set(\freq,65);

~dd1[32]=\filter->{arg in; GVerb.ar(in,40,maxroomsize:60,mul:0.1,add:in)};



(
ProxySynthDef(\dd2, {
arg sustain, amp, freq, gate=1;
var sig, env, fenv, nenv, penv;

env=EnvGen.kr(Env([0,1,0],[0.01,0.99],\welch),gate, timeScale:sustain,doneAction:2);
fenv=EnvGen.kr(Env([freq*8,freq], [sustain*0.004], \welch),gate,timeScale:sustain);
nenv=EnvGen.kr(Env([2,0,0.9,0], [0.1,0.6,0.9], [\step, \welch,\welch]),gate,timeScale:sustain);
	// penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);


sig=LFPulse.ar(fenv,add:GrayNoise.ar(nenv));
sig*env*amp}).add;
)

(
~name.play;
~name.fadeTime=1;
~name.quant=1;
~name.clock=TempoClock(60/60).permanent_(true);
~name[0]=Pbind(\instrument, \dd2,
\dur, 6,
\legato, 0.3,
\octave,[3,1],
\degree, [2,3],
\amp, 0.2);
)
~name[30]=\filter->{arg in; GVerb.ar(in,roomsize:120,add:in)};
)

