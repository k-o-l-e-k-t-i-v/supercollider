p=ProxySpace.push(s);
s.plotTree;

(
ProxySynthDef(\pulse, {
	arg sustain, amp;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\n.kr,[WhiteNoise.ar(0.35!2),PinkNoise.ar(0.7).softclip(0.5,1), BrownNoise.ar(0.3)]);

	env=EnvGen.kr(Env([0,1,0],[0.25,0.75],\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr,\f2.kr],[sustain*0.1],\welch),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(fenv,iphase:0.7)*BPF.ar(noise,fenv,add:noise*0.5)*env*amp;
}).add;


ProxySynthDef(\voice, {
	arg  sustain, amp;
	var sig, env;
    env=EnvGen.ar(Env.perc(sustain*0.25,sustain*0.75),doneAction:2);
	sig=Mix.fill(10,
		{ arg i;
    BPF.ar(
        PinkNoise.ar(Array.fill(4,{arg i; i/10+0.5})),
        freq:LFNoise0.kr(100).range(\freq.kr, \freq.kr+i),
        rq:LFNoise0.kr(20).range(0.001,i/10))
    })*env*amp;
	// sig=PitchShift.ar(sig,SinOsc.kr(2).range(0.2,1.2))
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
~e.play;
~e[0]=Pbind(\instrument, \ping,
	\dur, 4, \legato, 0.2,
	\octave, Pseq([5,4,6,3],inf),
	\degree, Prand([1,3,5],inf),
	\amp, 0.1);
~e[30]=\filter-> {arg in; GVerb.ar(in,roomsize:150,revtime:3,
	spread:SinOsc.kr(\mix.kr).range(10,50))};
)



(
~d.play(fadeTime:2);
~d.quant=2;

~d[0]=Pbind(\instrument, \pulse,
	\dur, 8,
	\legato, 0.7,
	\freq, 10,
	\f2, 1,//Penv([0,200,10],[Pkey(\dur)*0.01,Pkey(\dur)*0.99]),
	\n, Pseq([0,1,2],inf),
	\amp, 0.3);
~d[1]=\filter-> {arg in; GVerb.ar(in,roomsize:150,revtime:3,
	spread:SinOsc.kr(\mix.kr).range(10,50))};
~d[2]=\set->Pbind(\args, [\mix], \mix, 0.25);
~d[3]=\filter->{arg in; LPF.ar(in,200)+in};



~v2.play(fadeTime:8);
~v2.quant=16;
~v2[0]=Pbind(\instrument, \voice,
	\dur, Pseq([12, Rest(4)],inf),
	\legato, 1.2,
	\octave, Prand([[3,4], [5,2],6,[4,6]],inf),
	\degree, Pseq([[2,4,6], [1,3]],inf),
	\strum, Prand([2,4],inf),
	\amp,0.5, //Pseq([Penv([0,1,0.5,0.3,0],[6,3,3],\welch),0.5],inf)
);
~v2[30]=\filter->{arg in; GVerb.ar(DelayN.ar(in),1.2,4)};
// ~v2[31]=\set->Pbind(\args, [\room, \rev], \dur, 4, \room, Prand([1,1.2,1.5],inf), \rev, Prand([2,2.22,1,4],inf));
~v2[32]=\filter->{arg in; FreeVerb.ar(in,room:2)};
)