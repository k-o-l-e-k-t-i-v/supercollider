p=ProxySpace.push(s);

p.makeTempoClock(2.0);
s.plotTree;
(
ProxySynthDef(\bum2, {
	arg sustain, amp, voln, f2;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!2,
		add:HPF.ar(WhiteNoise.ar(voln).clip(0.05,0.1),Saw.kr(2).range(11000,f2))

	)*env*amp;
}).add;

ProxySynthDef(\zzz, {
	arg sustain, amp,speed,vol,lag, freq;
	var sig, env,fenv, lagenv;

	env=EnvGen.kr(Env.new([0,1,0],[0.25,0.75],\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*2,freq],[sustain*0.08]),timeScale:sustain);
	lagenv=EnvGen.kr(Env.new([lag*0.1,lag],[sustain*0.7]),timeScale:sustain);
	sig=Lag.ar(LFSaw.ar(fenv),lagenv)*env*amp;
	sig=Pan2.ar(sig,SinOsc.kr(sustain/speed),vol);
}).add;

ProxySynthDef(\sin, {
	arg gate=1, sustain=1, freq=440, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.2,0.7,sustain*0.5),gate,doneAction:2);
	sig=SinOsc.ar(freq*(1..8))*env*amp;

}).add;


ProxySynthDef(\pulse, {
	arg sustain, amp;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\n.kr,[WhiteNoise.ar(0.35!2),PinkNoise.ar(0.7).softclip(0.5,1), BrownNoise.ar(0.3)]);

	env=EnvGen.kr(Env([0,1,0],[0.25,0.75],\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr,\f2.kr],[sustain*0.1],\welch),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(fenv,iphase:0.7)*BPF.ar(noise,fenv,add:noise*0.5)*env*amp;
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

~o1.clock=TempoClock(240/60).permanent_(true); //10 to 60

~o1.play();
~o1.fadeTime=6;
~o1.quant=3;
~o1[0]=Pbind(
		\instrument, \bum2,
	    \dur, Pseq([1,2],inf),
	    \freq,Pseq([Pn(95,24), Pn(85, 12), Pn(105,12)],inf),
		\amp, 0.5,
		\legato,0.7,

		\f2,2,
);
~o1[30]=\filter-> {arg in; FreeVerb.ar(in,room:2,add:in)};


~o2.clock=TempoClock(180/60).permanent_(true);  //60 to 60

~o2.play();
~o2.quant=3;
~o2.fadeTime=9;

~o2[0]=Pbind(
		\instrument, \bum2,
	\dur, Pseq([1.5,1.5, Rest(3)],inf),
        \freq,45,
		\amp, 0.4,
		\legato,0.7,
		\f2,0.5,
);

~o3.clock=TempoClock(60/60).permanent_(true);  //60 to 60

~o3.play();
~o3.quant=3;
~o3.fadeTime=9;
~o3[0]=Pbind(
		\instrument, \pulse,
	\dur, Pseq([Rest(3),2, Rest(1)],inf),
	\freq,Prand([90,60, 10, 120],inf),
		\amp,0.7,
		\legato,0.7,
	\f2,Prand([10,2,5,15],inf),
);
~o3[30]=\filter-> {arg in; GVerb.ar(in,roomsize:150,revtime:3,
	spread:SinOsc.kr(\mix.kr).range(10,50))};
~o3[31]=\set->Pbind(\args, [\mix], \mix, 0.25);
~o3[32]=\filter->{arg in; LPF.ar(in,200)+in};


~o4.clock=TempoClock(60/60).permanent_(true);
~o4.play;
~o4.quant=3;
~o4.fadeTime=9;
~o4[1]=Pbind(
	\instrument, \zzz,
	\dur, Pseq([3.5,Rest(4.5)],inf),
	\legato, 0.7,
	\speed, 2,
	\lag, 0.2,
	\octave, Pseq([5,7,6,8],inf),
	\degree, Prand([1,3,5],inf),
	\amp, 0.3);
/*~o4[30]=\filter-> {arg in; GVerb.ar(in,roomsize:50,revtime:3,
	spread:SinOsc.kr(\mix.kr).range(10,50),add:in)};*/

)
~f1.stop;
(
~f1.clock=TempoClock(12/60).permanent_(true);
~f1.play;
~f1.quant=3;
~f1.fadeTime=9;

~f1[0]=Pbind(\instrumnet, \sin, \dur, Pseq([0.75,1.5,Rest(0.75)],inf),
	\legato, 1, \amp, 0.2,
	\octave, [4,3],
	\degree, Pseq([[4,2,8], 1, [8,4], 1,[2,6],1,[4,6]],inf),
	\strum, 0.1875,
);
~f1[30]=\filter-> {arg in; CombN.ar(in,decaytime:1)};
~f1[31]=\filter-> {arg in; FreeVerb.ar(in, room:1.5,damp:0.2,add:in)};
)