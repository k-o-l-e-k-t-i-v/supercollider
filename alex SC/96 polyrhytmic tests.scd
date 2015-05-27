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


ProxySynthDef(\sin, {
	arg gate=1, sustain=1, freq=440, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.2,0.7,sustain*0.5),gate,doneAction:2);
	sig=SinOsc.ar(freq*(1..8))*env*amp;

}).add;


ProxySynthDef(\woosh, {
	arg sustain=0.2, freq=3000, amp=1,f2;
	var sig, env,fenv;
	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain],\welch));

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(f2).range(0.2,0.8));
	sig=Pan2.ar(sig*env,SinOsc.kr(f2))*amp;
}).add;
)



(
~o1.clock=TempoClock(180/60); //10 to 60

~o1.play();
~o1.fadeTime=6;
~o1.quant=3;
~o1[0]=Pbind(
		\instrument, \bum2,
	    \dur, Pseq([1,2],inf),
        \freq,95,
		\amp, 0.5,
		\legato,0.7,

		\f2,0.5,
);

~o2.clock=TempoClock(60/60);  //60 to 60

~o2.play();
~o2.quant=3;
~o2.fadeTime=6;

~o2[0]=Pbind(
		\instrument, \bum2,
	    \dur, Pseq([0.75,0.75,1.5],inf),
        \freq,45,
		\amp, 0.5,
		\legato,0.7,
		\f2,0.5,
);

~o3.clock=TempoClock(60/60).permanent_(true);  //60 to 60

~o3.play();
~o3.quant=3;
~o3.fadeTime=6;
~o3[0]=Pbind(
		\instrument, \woosh,
	    \dur, Pseq([Rest(2.7),0.3],inf),
	\freq,Prand([9000,600, 100, 12000],inf),
		\amp, 1.2,
		\legato,0.7,
		\f2,20,
);
~o3[30]=\filter->{arg in; FreeVerb.ar(in,room:1.5,damp:0)};



)


