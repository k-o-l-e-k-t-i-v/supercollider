s.scope(5);
(
(
SynthDef(\bum, {
	arg sustain=0.7, gate=1, freq=20, room=0.5;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,sustain*0.3,sustain*0.5),gate,doneAction:2);

	sig=Mix.fill(5, { arg i;
		BPF.ar(BrownNoise.ar(2),Array.fill(4, {freq+1}), Saw.kr(freq).range(0.01,0.1));});
	sig=FreeVerb.ar(Limiter.ar(sig,0.5),room:room);

	Out.ar(0,sig);

}).add;
)

(
SynthDef(\tum, {
	arg sustain=0.7, gate=1, freq=50, room=0.5, top=4, amp=0.5;
	var sig,fenv, env;

	fenv=EnvGen.kr(Env([freq*top,freq], [sustain*0.05],curve:\welch),gate);
	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,sustain*0.3,sustain*0.5),gate);

	sig=Mix.fill(4, {arg i;SinOsc.ar([fenv,fenv+i],[0,pi*i])});
	sig=Limiter.ar(sig,0.7);
	sig=sig*env*amp;
	sig=FreeVerb.ar(sig,room:0.2);
	DetectSilence.ar(sig,doneAction:2);

	Out.ar(0,sig);
}).add;
)


(
SynthDef(\tic, {
	arg sustain=0.1, gate=1, freq=2000, room=0.5, pan=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,sustain*0.3,sustain*0.5),gate,doneAction:2);

	sig=Mix.fill(4, { arg i; HPF.ar(GrayNoise.ar*env,freq+i)});
	sig=FreeVerb.ar(Limiter.ar(sig,0.7),room:room,damp:0.1);
	sig=Pan2.ar(sig,pan);

	Out.ar(0,sig);
}).add;
)

(
SynthDef(\saw, {
	arg gate=1, sustain=0.8, freq=330, room=0.5, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,sustain*0.3,sustain*0.5),gate,doneAction:2);
	sig=Mix.fill(4, { arg i;
		Saw.ar(freq*[2,1,3,4,7]).lag(0.002)});
	sig=Limiter.ar(sig*env*amp,0.5);
	Out.ar(0, sig);
}).add;
)


(
SynthDef(\rrff,{
	arg gate=1, sustain=0.7,freq=45,room=0.5,amp=1, lag=0,top=5;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.5,sustain*0.1,sustain*0.2,sustain*0.2),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*top,freq], [sustain*0.1],curve:\welch),gate);

	sig=Mix.fill(5, {arg i;
		SinOsc.ar([fenv, fenv+0.255],[0,pi*i])*LFPulse.ar([freq+[13,21,34,55]],width:0.8).lag(lag)});
	sig=Limiter.ar(sig*env*amp,0.15);

	Out.ar(0,sig);
}).add;
)

)

/////////////////////////////////////////////////////////// really short beats
///////////////////////RN////RN////RN//////////////////////
///////////////////////////////////////////////////////////

(
~x=Pdef(\ltumhiRN,
	Pbind(
		\instrument, \tum,
		\amp,30,
		\legato,0.5,
		\top, Prand([20,10],inf),
		\dur,Pseq([Rest(0.4),Pn(0.1,2),0.2,Pn(0.1,2)],inf),
		\freq,Prand([
			Pseq([Rest(0.4),Pn(12000,2),18000,Pn(10000,2)],2),
			Pseq([Rest(0.4),Pn(9000,2),18000,Pn(10000,2)],2),
			Pseq([Rest(0.4),Pn(1200,2),18000,Pn(10000,2)],2)
		],inf),
)).play;
)
~x.stop;

(
~a=Pdef(\loptumloRN,

	Pbind(
		\instrument, \tum,
		\amp,2,
		\legato,0.8,
		\dur,1,
		\freq,Pseq([Prand([Pn(45,2),Pn(70,2)],1),60],inf)
)).play;
)

~a.stop;

(
~b=Pdef( \lopticRN,
	Pbind(
		\instrument, \tic,
		\dur, Pseq([Pn(0.1,2),Rest(0.4),Pn(0.2,2)],inf),
		\legato, 0.4,
		\freq, Pseq([15000,10000],inf),
		\room, 0.5,
		\pan, Pseq([-1,1],inf),
)).play;
)
~b.stop;

(
~m=Pdef(\lopsawRN,
	Pbind(
		\instrument, \saw,
		\dur,Pseq([Pn(0.2,2),Rest(0.5),0.1],inf),
		\freq,Pseq([Prand([1100,1400],2),0,4400],inf),
		\amp, 1,
)).play(quant:2);
)
(
~m.fadeTime=2;
~m.stop;
)

/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////

(
~h=Pdef(\ltumhiRN,
	Pbind(
		\instrument, \tum,
		\amp,20,
		\legato,0.5,
		\top, Prand([5,7],inf),
		\dur,Pseq([Rest(0.4),Pn(0.1,2),0.2,Pn(0.1,2)],inf),
		\freq,Prand([
			Pseq([Rest(0.4),Pn(440,2),220,Pn(880,2)],2),
			Pseq([Rest(0.2),Pn(880,4),1100,Pn(880,2)],2),
			Pseq([Rest(0.4),Pn(220,2),880,Pn(440,2)],2)
		],inf),
)).play;
)
~h.stop;

(
~g=Pdef(\lopttum,

	Pbind(
		\instrument, \tum,
		\amp,2.3,
		\legato,0.8,
		\dur,Pseq([Pn(1,2),Rest(0.25),0.25],inf),
		\freq,Pseq([
			Pseq([Pn(65,8),Pn(85,4)],1),
			Pseq([Pn(85,8),Pn(105,4)],1)
		],inf),
)).play;
)

~g.stop;

/////////////////////rrff long/////////////////


(
~r=Pdef(\loprrff1,
	Pbind(
		\instrument, \rrff,
		\dur, 1,
		\amp,0.2,
		\legato, Pseq([0.8,0.6],inf),
		\freq,Pseq([90,45,Pn(60,2)],inf),
		\lag, Pseq([Pn(0,6),Pn(0.02,4)],inf),              //switch to soft when lag is 0.02
		\top, 5,
)).play(quant:2);
)
~r.stop;

////////////////tum long and short////////////

(
Pdef( \loptum1,
	Pbind(
		\instrument, \tum,
		\amp,2,
		\dur, Pseq([Pn(1,2), Pn(0.4,2),Pn(0.4,2)],inf),
		\legato, Pseq([Pn(0.9,2), Pn(0.6,2),Pn(0.7,2)],inf),
		\freq, Pseq([Prand([Pn(65,2),Pn(85,2),Pn(45,2)],1), Pn(120,2),Pn(120,2)],inf),
		\room, 0.5,
)
).play(quant:2);
)
(

Pdef( \loptum2,
	Pbind(
		\instrument, \tum,
		\amp,2,
		\dur, Pseq([Prand([0.2,0.4],1),0.2],inf),
		\legato, Pseq([Pn(0.9,2), Pn(0.6,2),Pn(0.7,2)],inf),
		\freq, Pseq([Pn(440,4), Pn(110,2),Pn(440,2),660,Pxrand([440,660,990,880],2)],inf),
		\top,Pseq([Prand([4,5,12,8],2),Pn(10,5)],inf),
		\room, 0.2,
)
).play(quant:2);
)

///////////////////bum/////////////////

(
Pdef( \lopbum,
	Pbind(
		\instrument, \bum,
		\dur, 1,
		\legato, 0.5,
		\freq, Pseq([Pn(85,2), Pn(65,2),Pn(45,2)],inf),
		\room, 0.5,
)).play(quant:2);

Pdef( \loptic,
	Pbind(
		\instrument, \tic,
		\dur, Pseq([Pseq([Pseries(0.4,-0.04,10,1),0.1],2),Pn(0.1,10)],inf),
		\legato, 0.3,
		\freq, Pseq([15000,10000],inf),
		\room, 0.1,
		\pan, Pseq([-1,1],inf),
)).play;
)

//////////////////////saw long///////////
(

Pdef(\lopsaw,
	Pbind(
		\instrument, \saw,
		\amp, 0.05,
		\dur, 3,
		\legato, 1.5,
		\octave, Pseq([4,4,5,6,4,5],inf),
		\degree, Pseq([[1,3,5], [1,3],[5,7]], inf)

)).play(quant:2);
)

(
Pdef( \loopsawlong,
Ppar([
	Pbind(
		\instrument, \saw,
		\amp, 0.02,
		\dur, 3.2,
		\legato, 1.1,
			\octave, Pseq([Pxrand([4,4,5],2),6,4,5],inf),
		\degree, Pseq([[1,3,5], [1,3],[5,7]], inf)),
	Pbind(
		\instrument, \saw,
		\dur, 0.2,
		\legato, 0.8,
	    \octave, Pseq([Pxrand([4,2],1),Pxrand([5,3],1),6,7,4,5],inf),
	    \degree, Pseq([Pn([1,3,5],4),[2,4],[1,3]],inf)
)],inf)
).play(quant:2);
)


s.scope(4);

(
Ndef(\jr).fadeTime=2;
Ndef(\jr).quant=2;
Ndef(\jr, {
	var freq, b, sig, env,  x,y,z, ex,ey,ez, ff;

	b=4/3;


	freq=Duty.kr(Dseq([b*2,b,b,b/2,b,b*4],inf),0,
		level:Drand([
			Dseq([450,220,110,330,330,110],1),
			Dseq([450,220,110,220,330,110],1)]
			,inf));

	ff=Decay.kr(Impulse.kr(b/10),0.2).range(freq*4,freq);

	ex=Decay2.kr(Impulse.kr([b,b*2]),0.01,0.05); //tic
	ey=Decay2.kr(Impulse.kr([b*4,b*4]),0.2,0.5); //zz
	ez=Decay2.kr(Impulse.kr([b,b/2]),0.3,0.1); //ss

	x=Mix.fill(4,{ arg i; HPF.ar(WhiteNoise.ar,12000)})*ex;
	y=Mix.fill(4,{ arg i; Saw.ar([freq,freq+i],[0,i*pi]) })*ey;
	z=Mix.fill(4,{ arg i; SinOsc.ar([freq/2,freq/2+i],[0,i*pi]) })*ez;
	z=FreeVerb.ar(z,0.2,1);

	Mix.new([x,y*0.04,z*0.5]);
}).play;

)
	