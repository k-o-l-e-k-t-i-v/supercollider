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
		add:HPF.ar(WhiteNoise.ar(voln).clip(0.2,0.8),Saw.kr(2).range(1100,f2))

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
	arg sustain, amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env.new([0,1,0],[sustain*0.5,sustain*0.5]), \gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([0,1,0],[0.5,0.5],curve:\welch),\gate.kr(1),timeScale:sustain);

	sig=SinOsc.ar([\freq.kr,\freq.kr])*amp;
	sig=sig*env;
}).add;


)

// {SinOsc.ar([40,40])}.play;

//these two together

~bsimple.stop;
(


~bsimple.clock=TempoClock(60/60).permanent_(true); //10 to 60

~bsimple.play();
~bsimple.fadeTime=6;
~bsimple.quant=3;
~bsimple[0]=Pbind(
		\instrument, \bum2,
	\dur, Pseq([1, Rest(2)],inf),
	    \freq,Pseq([Pn(45,24), Pn(65, 12), Pn(55,12)],inf),
		\amp, 0.4,
	\legato,Pseq([0.7,0.9],inf),

		\f2,0,
);
// ~bsimple[30]=\filter-> {arg in; FreeVerb.ar(in,room:0.5,add:in)};
)


~o1.clock=TempoClock(60/60).permanent_(true); //10 to 60

~o1.play();
~o1.fadeTime=6;
~
o1.quant=3;
~o1[0]=Pbind(
		\instrument, \bum2,
	\dur, Pseq([Rest(1),0.2,1.8],inf),
	    \freq,Pseq([Pn(95,24), Pn(85, 12), Pn(105,12)],inf),
		\amp, 0.3,
	\legato,Pseq([0.7,0.5],inf),

		\f2,5,
);
~o1[30]=\filter-> {arg in; FreeVerb.ar(in,room:0.5,add:in)};
)
~o1.stop;

//beat + noise
(

~o2.clock=TempoClock(160/60).permanent_(true);  //60 to 60

~o2.play();
~o2.quant=3;
~o2.fadeTime=6;

~o2[0]=Pbind(
		\instrument, \bum2,
	\dur, Pseq([1.5,1, Rest(0.5)],inf),
	\freq,Prand([Pn(60,12), Pn(65,12),Pn(45,4)],inf),
	\voln, Pseq([Pn(0,6),Pn(0.7,1),Pn(0.25,2), Pn(0.5,3)],inf),
		\amp, 0.3,
		\legato,0.8,
		\f2,2000,
);
~o2[30]=\filter->{arg in; FreeVerb.ar(in,0.7,0.3,add:in)};
)


///noise reverb
~o3.stop;
(

~o3.clock=TempoClock(120/60).permanent_(true);  //60 to 60

~o3.play();
~o3.quant=3;
~o3.fadeTime=9;
~o3[0]=Pbind(
		\instrument, \pulse,

	\dur, Pseq([Rest(1.5),2,1, Rest(1.5)],inf),
	\freq,Prand([90,60, 10, 120],inf),
		\amp,0.2,
		\legato,0.7,
	\f2,Prand([10,2,5,15],inf),
);
~o3[30]=\filter-> {arg in; GVerb.ar(in,roomsize:150,revtime:3,
	spread:SinOsc.kr(\mix.kr).range(10,50))};
~o3[31]=\set->Pbind(\args, [\mix], \mix, 0.75);
~o3[32]=\filter->{arg in; LPF.ar(in,200)+in};
)

///very low long

~ping.stop;
(
~ping.clock=TempoClock(40/60).permanent_(true);
~ping.play();
~ping.fadeTime=6;
~ping[0]=Pbind(\instrument, \ping, \amp, 0.2,
	\dur, 6, \freq, Prand([65,67,69],inf),
	\legato, 1.2);
// ~ping[30]=\filter->{arg in; FreeVerb.ar(CombN.ar(in,0.5,1,3))};
)