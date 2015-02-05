(

s.scope(8);
s.plotTree();
~cverb=Bus.audio(s,8);
~cts=Bus.audio(s,8);
~cti=Bus.audio(s,8);



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
	flag=EnvGen.kr(Env([lag,lag*100], [sustain*0.5],\welch),gate);
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

SynthDef(\ping5, {                                           ///sustain*0.2  - 5 times in CombN
	arg gate=1, sustain=0.5, freq=880,amp=1, out;
	var sig, env, envp;

	envp=Decay2.kr(Impulse.kr(sustain*0.01),decayTime:sustain*0.2);
	env=EnvGen.kr(Env.adsr(sustain*0.05, sustain*0.05,0.5,sustain*0.9),gate,doneAction:2);
	sig=SinOsc.ar(freq*(1..10))*envp;
	sig=CombN.ar(sig,sustain*0.2,sustain*0.2,sustain)*env*amp;

	Out.ar(out,sig);


}).add;




SynthDef(\reverb, {
	arg in, out, room, revtime, amp;
	Out.ar(out, GVerb.ar(In.ar(in),room,revtime:revtime,mul:amp,damping:0.4,drylevel:1))
}).add;
)

////////////PDEF//////////////////
//////////////////////////////////
//////////////////////////////////

(
Pdef(\loptii1,
	Pbind(
		\instrument, \tii,
		\dur, 1,
		\amp,1,
		\legato, 0.5,
		\freq, Pseq([Pn(45,4), Pn(80,2)],inf),
		\freq2, Pseq([Pn(45,4), Pn(60,2)],inf),
		\lag, 0.0002,
)).play(quant:8);
)

(
Pdef(\lopping1,
	Pbind(
		\instrument, \ping5,
		\dur, 4,
		\legato, 1,
		\octave, Pseq([Pn(4,8),Pn(6,2),Pn(5,2)],inf),
		\degree, Pseq([[1,3,5,7],[7,3,5,1,1],[5,3,1,7,5],[7,1,3,5,1]],inf),
		\strum,0.20,
		\out, ~cverb,
)).play(quant:8);

Pdef(\looppingrev,
	Pmono(
		\reverb,
		\out, 0,
		\dur,2,
		\room,10,
		\in, ~cverb,
		\revtime,0.2,
		\amp, 1.5,
)).play(quant:8);
)
///////////////////////////////////

(
Pdef(\loptii3,
	Pbind(
		\instrument, \tii,
		\dur, 4,,
		\legato, 0.5,
		\out, 0,
		\amp, 1,
		\freq, 45,
		\freq2, 85,
		\lag, 0.0002,
)).play(quant:4);
)
(

Pdef(\loprf1,
	Pbind(
		\instrument, \rf,
		\dur,8,
		\legato,0.15,
		\freq, 45,
		\lag,0.002,
		\amp,0.5,
)).play(quant:4);
)
Pdef(\loprf1).stop;
(

Pdef(\loopsaw2,
	Pbind(
	\instrument, \saw,
	\dur, 4,
	\strum,0.1,
	\legato,1.2,
	\octave,Pseq([[4,6],[6,4],[3,4],[5,4]],inf),
	\degree, Pseq([[1,3,5],[5,7,1,3],[5,1,3]],inf),
	\out,0,
	\lag, Pseq([Pn(0.0002,2),Pn(0.002,2)],inf),
    \amp,0.071,
)).play(quant:2);

)
Pdef(\loopsaw2).stop;

(
Pdef(\lopbum1,
	Pbind(
		\instrument, \bum,
		\dur,0.4,
		\legato, Pseq([0.8,0.5,0.5,0.5,0.5,0.5],inf),
		\freq,Pseq([65,85,65,95,Pn(Prand([95,100,85],1),2)],inf),
		\amp, 0.5,
)).play(quant:4);
)

(

Pdef(\loptii2,
	Pbind(
		\instrument, \tii,
		\dur, 4,
		\legato, Pseq([0.4,0.2],inf),
		\out, 0,
		\amp, 1,
		\freq, 45,
		\freq2, 850,
		\lag, 0.0002,
)).play(quant:4);


Pdef(\lopts,
	Pbind(
	\instrument, \ts,
	\freq,Pseq([800,1400,1200],inf),
	\dur,4,
	\legato,0.6,
	\amp,8,

)).play(quant:4);
)



s.scope(2);



(
Ndef(\o2).fadeTime=2;
Ndef(\o2).quant=2;
Ndef(\o2, {

	var sig,sig1, sig2, sig3, b,f2;

	b=Duty.kr(4,0,Dseq([4,8,2,4,2],inf));
	f=Duty.kr(2,0,Dseq([65,85,90,90,55,60,45],inf));
	f2=Duty.kr(4,0,Dseq([3000,5000,8000,4000,4000],inf));

	sig=LFSaw.ar([b,b/2],[0,pi])*SinOsc.ar(f*(1..4));
	sig=Limiter.ar(sig,0.8);

	sig2=BPF.ar(GrayNoise.ar,f2,SinOsc.kr(b).range(0.1,0.001))*
	Decay2.kr(Impulse.kr([b/4,b/2]),decayTime:0.8);

	sig3=Decay2.kr(Impulse.kr([b/2,b/8]),0.2,0.5)*HPF.ar(GrayNoise.ar,[f2/2,f2/2+2]);
	sig3=Limiter.ar(FreeVerb.ar(sig3,room:5,damp:0),0.8);


	Mix.new([sig,sig2,sig3]);



}).play;
)


s.scope(4);


(
Ndef(\m).fadeTime=2;
Ndef(\m).quant=2;
Ndef(\m, {
  var s1,s2,s3, b,f,f2;

	b=4;

	f=Duty.kr(2,0,Dseq([65,85,90,90,60,45],inf));
	f2=Duty.kr(b/2,0,Drand(
		[Dseq([300,500,800,400,400,600,800,200],1),
		Dseq([400,200,400,400,700,800,200,200],2),
		Dseq([300,500,800,400,400,600,800,200],1)],inf
	));


	s1=Saw.ar(Phasor.kr(Impulse.kr([b,b]),0.00001).range(f,f+5)).lag(0.002)*
	Decay2.kr(Impulse.kr([b/8,b/4]),b/8,decayTime:b/4);
	s1=FreeVerb.ar(s1,room:1);
	s2=CombN.ar(Saw.ar([f2,f2+2]).lag(0.002)*Decay2.kr(Impulse.kr([b/4,b/6]),decayTime:0.3),0.4,0.4,4,0.8);

	Mix.new([s1, s2]);

}).play;
)

{Limiter.ar(FreeVerb.ar(SinOsc.ar([1400,1600,1800,1200],[0,pi])*Pulse.ar([2,3]),room:2),0.8)}.play;


(

Ndef(\u).fadeTime=2;
Ndef(\u).quant=2;
Ndef(\u, {

	var s1,s2,s3, b,f,f2, lag;

	b=4;
	lag=Duty.kr(4,0,Dseq([0.002,0.02,0],inf));
	f=Duty.kr(8,0,Dseq([1800,1600,1200,1100,900,1400],inf));

	s1=SinOsc.ar([45,44])*LFPulse.ar([35,32,37,39],width:0.8).lag(lag);
	s1=Limiter.ar(s1,0.3)*Decay2.kr(Impulse.kr([b/8,b/4]),b/10,b/2);

	s2=SinOsc.ar([f/2*[2,1,3,4]])*Decay.kr(Impulse.kr([b/2,b/4]),0.1);
	s2=FreeVerb.ar(CombN.ar(s2,b/10,b/10,b/2),room:2,damp:0);
	s2=s2*0.2;

	s3=HPF.ar(GrayNoise.ar(0.2),f/4)*Decay.kr(Impulse.kr([b/16,b/24]),b/2);
	s3=Pan2.ar(s3,SinOsc.kr(2))*0.3;



	Mix.new([s1,s2,s3]);

}).play;
)


s.scope(2);