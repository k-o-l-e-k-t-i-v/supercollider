(

s.scope(8);
s.plotTree();
~chverb=Bus.audio(s,8);
~chts=Bus.audio(s,8);
~chti=Bus.audio(s,8);



)
(

SynthDef(\ts, {
	arg gate=1, sustain=2, freq=100, amp=4, out;
	var sig, env;

	freq=Lag.kr(freq,0.2);
	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
    sig=BPF.ar(WhiteNoise.ar(SinOsc.kr(15).range(0.1,1)!10),freq,SinOsc.kr(60).range(0,0.001))*env*amp;

	Out.ar(out,sig);
}).add;


SynthDef(\sinsaw, {
	arg gate=1, sustain=0.4, freq=85, out, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.asr(sustain*0.2,sustain*0.2,sustain*0.6),gate,doneAction:2);
	sig=SinOsc.ar([freq*(1..10)])*env;

	Out.ar(out,Splay.ar(sig,8,amp));
}).add;

SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1, out;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4,freq], [sustain*0.05],\welch),gate);
	sig=SinOsc.ar(fenv*(1..10))*env*amp;

	Out.ar(out,sig);
}).add;

SynthDef(\saw, {
	arg gate=1, sustain=1, freq=400, amp=1, out, lag=0.1;
	var sig, env;

	freq=Lag.kr(freq,0.3);
	env=EnvGen.kr(Env.adsr(sustain*0.25, sustain*0.25,0.5,sustain*0.5),gate,doneAction:2);
	sig=DelayN.ar(Saw.ar(freq*(1..8)).lag(lag),rrand(0.2,0),rrand(0.2,0));
	sig=Limiter.ar(sig*env*amp,0.5);

	Out.ar(out, sig);
}).add;

SynthDef(\tii, {
	arg gate=1, sustain=0.4,freq=50,amp=1,out,freq2=155, lag=0.0002;
	var sig, env, fenv, flag;

	fenv=EnvGen.kr(Env([freq*4,freq], [sustain*0.05],\welch),gate);
	flag=EnvGen.kr(Env([lag,lag*100], [sustain],\welch),gate);
	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	sig=Mix.fill(10,
		{ arg i; SinOsc.ar([fenv,fenv+0.25])
			*LFPulse.ar(freq2*Array.fill(5,{arg i;35+i}),width:0.8).lag(flag)});
	sig=Limiter.ar(sig,0.5)*env*amp;

	Out.ar(out,sig);
}).add;


SynthDef(\rf,{
	arg gate=1, sustain=0.7,freq=45,room=0.5,amp=1, out, lag=0,top=5;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.5,sustain*0.1,sustain*0.2,sustain*0.2),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*top,freq], [sustain*0.05],curve:\welch),gate);

	sig=Mix.fill(10, {arg i;
		SinOsc.ar([fenv, fenv+0.255])*LFPulse.ar([freq+[13,21,34,55]],width:0.8).lag(lag)});
	sig=Limiter.ar(sig*env*amp,0.15);

	Out.ar(out,sig);
}).add;

SynthDef(\ping, {
	arg gate=1, sustain=0.5, freq=880,amp=1, lag=0.02, out;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.05, sustain*0.05,0.5,sustain*0.3),gate);
	sig=SinOsc.ar(freq*(1..8))*env*amp;
	sig=CombC.ar(sig,sustain/3,sustain/3,sustain);
	DetectSilence.ar(sig,doneAction:2);

	Out.ar(out,sig);


}).add;




SynthDef(\reverb, {
	arg in, out, room, amp;
	Out.ar(out, GVerb.ar(In.ar(in),room,revtime:0.2,mul:amp,damping:1,drylevel:1))
}).add;
)


//////////////////////////////////////bells/////////////////////////////////////

{GVerb.ar(CombN.ar(SinOsc.ar(800)*Decay2.kr(Impulse.kr(0.5),decayTime:0.5),0.4,0.6,3),50)}.play;
{CombN.ar(SinOsc.ar(800)*Decay2.kr(Impulse.kr(0.5),0.2),0.4,0.6,4)}.play;
{ CombN.ar(Decay.ar(Dust.ar(1,0.5), 0.2, WhiteNoise.ar), 0.2, 0.2, 3) }.play;
(

~g1=Group();

~g2=Group.new(~g1,\addAfter);


Pdef(\lopsinsaw,
	Pbind(
		\instrument, \sinsaw,
		\out, ~chverb,
		\amp, 0.4,
		\dur,4,
		\legato, 0.6,
		\octave, [3,4,5,6],
		\degree, Pseq([[1,3,5,7,5,7,7,4],[5,4,6,2,1,3,5,4],[4,5,7,7,5,3,1,1],[1,1,2,4,6,4,6,4]],inf),
		\strum, 0.25,
		// \lag, Prand([0.1,0.01,0.2],inf),
		\group, ~g1,

)).play(quant:2);


Pdef(\verbsin,
	Pmono(
		\reverb,
		\in, ~chverb,
		\amp,0.2,
		\out,0,
		\dur, 0.2,
		\room,1,
		\group, ~g2
)).play(quant:2);
)


////////////////////////////////bum -ts//////////////////////////////////////////

(

~g1=Group();
~g2=Group.new(~g1,\addAfter);




Pdef(\lopts,
	Ppar([
		Pbind(
			\instrument, \ts,
			\dur, Pseq([Pseq([Rest(0.2),2.1],8),0.2],inf),
			\freq,Pseq([Pn([400,440],8),Rest(0.2),Pn([440,480],2),Pn([480,520],2),[800,760],[400.360],Pn([440,480],2)],inf),
			\amp,3,
			\legato,0.8,
			\out,~chts,
			\group, ~g1),
		Pbind(
		\instrument, \bum,
			\dur,Pseq([Pseq([0.4, Rest(2)],8),0.2],inf),
			\freq, [45,47],
			\legato, 1.2,
			\out, 0,
			\amp, 0.2,
			\group, ~g2
			)
],inf),

).play(quant:2);


Pdef(\loprev,

		Pmono(
			\reverb,
			\dur, 2,
		    \amp, 3,
			\room,10,
			\in, ~chts,
			\out, 0,
			\group, ~g2)


).play;
)

////////////////////////////////saw tii///////////////////////////////////



(
~g1=Group();
~g2=Group.new(~g1,\addAfter);



Pdef(\losawfr,
	Ppar([
		Pbind(
			\instrument, \saw,
			\lag, 0.2,
			\dur,4,
			\out,0,
			\amp,0.5,
			\legato,1.5,
			\octave, Pseq([[4,3],[4,5],[4,5,6],[4,6],[4,3,2]],inf),
			\degree, [1,3,5],
			\group, ~g1,
		),
		Pbind(
			\instrument, \tii,
			\dur, Pseq([0.4,0.4,Rest(0.2)],inf),
			\legato,Pseq([0.8,0.5,Rest(1)],inf),
			\freq, 45,
			\freq2, Pseq([Pseq([60,120,2],6),Pseq([400,440,2],2)],inf),
			\lag, 0.0005,
			\out,0,
			\group, ~g1,
			\amp, 1,
			// \amp, 0.5
		)
],inf)
).play(quant:2);


)

/////////////////////////////////ping encho/////////////////////////////

(
~g1=Group();

~g2=Group.new(~g1,\addAfter);


Pdef(\lopping,
	Pbind(
		\instrument, \ping,
		\out, 0,
		\amp, 0.4,
		\dur,2,
		\legato, 1,
		\freq, 800,
		\group, ~g1,

)).play(quant:2);



)
