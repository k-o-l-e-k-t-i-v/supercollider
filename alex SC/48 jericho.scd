s.scope(2);

(
Ndef(\s).fadeTime=4;
Ndef(\s).quant=2;

Ndef(\s, {

	// arg freq=40 ;
	var x,y,z,b, freq,env, ff,t, base;

	b=4/3;
	freq=LFNoise0.kr(0.25).range(40,80).round(10);
	base=Select.kr(Stepper.kr(Impulse.kr(b*0.2),max:8), [200,100,120,180,300,330,120]);

	t=Select.kr(Stepper.kr(Impulse.kr(b*8),max:8), [1,b,b*1.5,b,b*1.2, b*2,b]);

	ff=Select.kr(Stepper.kr(Impulse.kr(0.5),max:4), [base*t,base+20*t,base+50*t,base+100*t,base+25*t]);
	env=Decay2.kr(Impulse.kr([b,b*2]),0.2,decayTime:1);

	x=SinOsc.ar(Sweep.kr(Impulse.kr([b*3,b*1.5]),10).range(freq*5,freq)!2,mul:Decay2.kr(Impulse.kr(b),decayTime:0.2));
	x=Limiter.ar(x,0.5);

	y=LPF.ar(BrownNoise.ar(2)!2*Decay.kr(Impulse.kr(b/4),decayTime:1),100);

	z=Saw.ar([ff,ff+4])*Decay2.kr(Impulse.kr([b/4,b/6]),0.5,6);
	z=FreeVerb.ar(z,room:0.5);

	Mix.new([x,y,z*0.5]);

}).play;
)

(
Ndef(\3).fadeTime=4;
Ndef(\3).quant=2;
Ndef(\3, {
var sig1,sig2, sig3, b, fb,ft;

	b=4/3;
	fb=Select.kr(Stepper.kr(Impulse.kr(b*0.2),max:6), [65,75,45,45,95,95]);
	ft=Select.kr(Stepper.kr(Impulse.kr(b*0.2),max:6), [11000,11000,800,800,5000]);

	sig1=LFPulse.ar([b,b/2])*SinOsc.ar([fb, fb+0.2, fb+0.4, fb+0.6],[0,2pi],0.2);

	sig2=HPF.ar(WhiteNoise.ar(0.1),ft)*Decay2.ar(Impulse.ar([b,b]),decayTime:0.1);
	// sig2=FreeVerb.ar(sig2,room:0.1,damp:0,mul:0.5);

	sig3=CombN.ar(VarSaw.ar([fb+100,fb+100])*Decay2.kr(Impulse.kr([b,b*2]),b/2,decayTime:1.33),decaytime:0.2);
	sig3=Limiter.ar(sig3,0.5);


	Mix.new([ sig1, sig2,sig3]);



}).play; // j_This is really very nice
)





/////// SYNTHSESESSS//////////


//breathing?
(
SynthDef(\breath, {
	arg freq=200,sustain=2,gate=1,amp=1, f2=2;
	var sig, env;

	b=4/3;
		env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.5,sustain*0.2),gate,doneAction:2);
	sig=BPF.ar(WhiteNoise.ar([0.8,0.9]),freq, Saw.kr(b*f2).range(0.1,0.01));
	sig=sig*env*amp;

	Out.ar(0,sig);
}).add;
)

///bass
(
SynthDef(\bass, {
	arg freq=100, gate=1, sustain=0.7, amp=1;
	var sig, env, envf;
		env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.5,sustain*0.2),gate,doneAction:2);
	envf=EnvGen.kr(Env([freq*4,freq],[sustain*0.1],\welch),gate);
	sig=SinOsc.ar([envf,envf+10],[0,2pi])*env*amp;


	Out.ar(0, sig);


}).add;
)

///tic

(
SynthDef(\tic, {

	arg freq=1000, sustain=0.7, gate=1, amp=1, pan;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,sustain*0.5,sustain*0.2),gate,doneAction:2);
	sig=HPF.ar(Mix.fill(5,{arg i;WhiteNoise.ar(amp)+LFPulse.ar(i)}),freq);
	sig=sig*env;
	sig=Pan2.ar(sig,pan);

	Out.ar(0,sig);
}).add;
)

(
SynthDef(\saw, {
	arg freq=200, gate=1, sustain=2, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.2,sustain*0.2,sustain*0.2),gate);
	sig=Mix.fill(10,{ arg i;
		Saw.ar([freq,freq+i/10])+SinOsc.ar([freq,freq+i/10],mul:0.2)
	});
	sig=FreeVerb.ar(sig,room:0.2);
	sig=Limiter.ar(sig,0.2);
	sig=sig*env*amp;
	DetectSilence.ar(sig,doneAction:2);
	Out.ar(0, sig);



}).add;
)




(
Pdef(\loplol,
	Pbind(
		\instrument, \breath,
		\dur, 0.2,
		\legato,1,
		\freq, Pseq([200,250,Prand([100,230,300,400],2),100],inf),
		\amp,15,
		\f2, 200,
		\pan, Pwhite(-1,1,inf)
)).play;
)
(
Pdef(\lol2,
	Pbind(
		\instrument, \breath,
		\dur, 0.5,
		\ferq, Pseq([100,200,800,100,200],inf),
		\amp, 8,
		\f2, 22,
)).play(quant:2);
)

(
Pdef(\lju,
	Pbind(
		\instrument, \bass,
		\dur, 0.7,
		\freq, Pseq([Pn(70,4),60,55],inf),
		\legato, Pseq([0.7,0.5],inf),
		\amp, 1

)).play;
)
(
Pdef(\llju,
	Pbind(
		\instrument, \bass,
		\dur, Pseq([Pseries(0.45,(-0.15),3),0.3,0.15],inf),
		\freq, Pseq([Pn(80,3),50,60],inf),
		\legato,Pseq([Pn(0.8,3),0.5,0.6],inf),
		\amp, 0.5
)).play;
)
(
Pdef(\kok,
	Pbind(
		\instrument, \tic,
		\dur, Pseq([0.2,0.1, Prand([0.1,0.2,0.1],2),Prand([Rest(0.1),Rest(0.1),0.2],2)],inf),
		\legato, 0.099,
		\amp,1,
		\pan, Pwhite(-1,1,inf)
)).play;
)

(
Pdef(\kik,
	Pbind(
		\instrument, \tic,
		\dur, Pseq([0.2,0.15,Pn(0.25,4)],inf),
		\legato, Pseq([Pn(0.2,36), Pn(0.1,6),Pn(0.15,6)],inf),
		\amp, 1.5,
		\freq, Pseq([Pn(10000,6),Pn(20000,4),Pn(12000, 2)],inf),
)).play(quant:2);
)


///bass2
(
Pdef(\ghg,

	Ppar([

	Pbind(
		\instrument, \bass,
		\dur, Pseq([Pn(0.5,2),0.25,Pn(0.5,3),0.25],inf),
		\legato, 0.5,
		\freq, Pseq([Pn(60,7),Pn(90,7),Pn(120,7),Pn(50,7)],inf),
		\amp,1

),

	Pbind(
		\instrument, \bass,
		\dur, Pseq([Rest(2),Pn(0.1,5)],inf),
		\legato, 0.25,
		\freq, Pseq([Pn(600,6),Pn(700,6),Pn(200,6),Pn(200,6)],inf),
		\amp,1


)])
).play(quant:2);
)

(
Pdef(\saw1,
	Pbind(
		\instrument, \saw,
		\dur, Pseq([Pn(1,3),0.5,1,Pn(2,2),0.5],inf),
		\legato,2,
		\freq, Pseq([110,220,440,880,110,220,220],inf),
		\amp, 0.5
)).play(quant:2);
)

(
Pdef(\sawshort,
	Pbind(
		\instrument, \saw,
		\dur, 0.2,
		\legato, Pseq([ 0.9,0.6],inf),
		\freq, Pseq([Pn(200,2),Pn(400,2),100,Pn(440,2),100,Pn(200,4)],inf),
		\amp, 2

)).play(quant:2);
)

