(

SynthDef(\ripple, {
	arg gate=1, sustain=1, freq=40,f2, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq], [sustain*0.05],\welch),gate);

	sig=BPF.ar(GrayNoise.ar(amp),fenv,SinOsc.kr(f2).range(0.1,1))*env;
	sig=Limiter.ar(Pan2.ar(sig,SinOsc.kr(f2)),0.7)*env*amp;
	sig=FreeVerb.ar(sig,mix:0.5,room:0.5,damp:1);

	Out.ar(0,sig);
}).add;


SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain*0.05],\welch),gate);
	sig=Mix.fill(5, {SinOsc.ar(fenv*(1..10))});
	sig=FreeVerb.ar(sig,mix:0.5,room:2,damp:1);
	sig=Limiter.ar(sig,0.7)*env*amp;

	Out.ar(0,sig);
}).add;

SynthDef(\dribble, {
	arg gate=1, sustain=1, freq=40, amp=1,lag;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	sig=BPF.ar(BrownNoise.ar(amp),freq:freq+SinOsc.kr(freq*2).range(40,20),
		rq:SinOsc.kr(freq).range(0.01,0.1));
	sig=sig+Mix.fill(4,{LFSaw.ar(freq!4,mul:0.5).lag(lag)});
	sig=Limiter.ar(sig,0.2);
	sig=FreeVerb.ar(sig,room:1.5,damp:1,add:sig);

	sig=DelayN.ar(sig,0.4,delaytime:0.2);
	Out.ar(0, sig*amp*env);
}).add;


SynthDef(\woosh, {
	arg gate=1, sustain=0.2, freq=3000, amp=1;
	var sig, env,fenv;


	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain],\welch),gate);

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(5000).range(0.2,0.8));
	sig=HPF.ar(sig,16000);
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig*env,SinOsc.kr(0.5));

	sig=DelayN.ar(sig,0.8,delaytime:0.6);
	sig=FreeVerb.ar(sig,room:1);

	Out.ar(0,sig*amp);
}).add;


SynthDef(\tictum, {
	arg gate=1, sustain=0.2, freq=1000, amp=1;
	var sig, env,fenv;


	 env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*10,freq], [sustain*0.8],\welch),gate);

	sig=BPF.ar(LFSaw.ar(20).lag(0.002),fenv,0.5,mul:SinOsc.kr(50).range(0.2,0.8));
sig=HPF.ar(CombN.ar(sig,maxdelaytime:0.1,delaytime:0.1,decaytime:sustain*0.5),800);
	sig=FreeVerb.ar(sig,room:2,damp:0.8,add:sig);
	// sig=Pan2.ar(sig,SinOsc.kr(0.5));

	sig=DelayN.ar(sig,sustain/2,delaytime:0.1);

	Out.ar(0,sig*amp);
}).add;

SynthDef(\uup, {
	arg gate=1, sustain=0.1, freq=14000, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate);
	fenv=EnvGen.kr(Env([freq*3,freq], [sustain*0.05],\welch),gate);
	sig=HPF.ar(WhiteNoise.ar(amp),freq)*env;
	sig=FreeVerb.ar(sig,room:1,damp:0);

	DetectSilence.ar(sig,amp:0.051,doneAction:2);
	Out.ar(0,sig);
}).add;


SynthDef(\tiiing, {
	arg gate=1, sustain=0.1, freq=18000, amp=1,pan;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.2,0.5,sustain*0.6),gate);

	sig=SinOsc.ar(freq)*env;
	sig=FreeVerb.ar(sig,room:1,damp:0)*amp;
	sig=Pan2.ar(sig,pos:pan);

	DetectSilence.ar(sig,amp:0.01,doneAction:2);
	Out.ar(0,sig);
}).add;

SynthDef(\zum, {
	arg gate=1, sustain=1, freq=300, amp=1, lag=0.2;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.05,sustain*0.1,0.5,sustain*0.85),gate,doneAction:2);

	sig=LFSaw.ar([freq,freq+10,freq.lag(lag+0.02),freq.lag(0.2),freq+5]).lag(lag);
	sig=CombN.ar(sig,0.5,0.5,sustain);
	sig=sig*env*amp;
	// sig=FreeVerb.ar(sig,room:2);

	// DetectSilence.ar(sig,doneAction:2);

	Out.ar(0,sig);
}).add;



)

s.scope(4);


(
Pdef(\piano,
	Pbind(
		\octave, Pseq([6,7,4,5,6,5],inf),
		\note, [1,3,5,7],
		\dur,3,
		\legato,2,
		\strum, 0.1,
		\amp, 0.0011,
)).play;
)
Pdef(\piano).stop;

///ripple pan
(
Pdef(\loprip1,
	 Pbind(
		\instrument, \ripple,
		\dur, 2,
		\freq,50,
		\amp,1.2,
		\legato,Pseq([Pn(0.5,4),Pn(0.8,4)],inf),
		\f2, 2,
)).play(quant:2);
)
Pdef(\lopup1).stop;

(
Pdef(\lopup1,
	 Pbind(
		\instrument, \bum,
		\dur, Pseq([1,Rest(0.5)],inf),
		\freq,55,
		\amp,3,
		\legato,Pseq([0.7,0.5],inf),
)).play(quant:2);
)
Pdef(\lopup1).stop;

///////rage
(

Pdef(\loppzum,
	 Pbind(
		\instrument, \zum,
		\dur, Pseq([2,2,3,1,2,1],inf),
		\note, [1,3,5],
		\octave, Pseq([[8,6],[7,5],[4,7],[6,8,5],[7,4,8],[3,4,8]],inf),
		\legato, 2,
		\lag, 0.02,
		\amp,1,

)).play;
)
Pdef(\loppzum).stop;

///simplewoosh
(
Pdef( \lopwoosh,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([0.5,Rest(2)],inf),
		\freq,13000,
		\legato, 1,
		\amp, 2
)).play(quant:2);
)
Pdef( \lopwoosh).stop;

(
Pdef( \lopwoosh1,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([1,2,0.5,1],inf),
		\freq,3000,
		\legato, 0.5,
		\amp, 8
)).play(quant:2);
)
Pdef( \lopwoosh).stop;



(
Pdef( \loopbum6,
	Pbind(
		\instrument, \bum,
		\dur, 0.5,
		\freq,55,
		\legato, Pseq([0.8,0.5],inf),
		\amp, 1.5
)).play(quant:2);
)
Pdef( \loopbum3).stop;



(
Pdef( \loopbum4,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([1,1,0.5,0.5,0.25],inf),
		\freq,65,
		\legato, Pseq([0.8,0.8,1,0.5,1],inf),
		\amp, 2
)).play(quant:2);
)
Pdef( \loopbum4).stop;



(
Pdef(\lopbum2,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([0.5,0.2,0.4],inf),
		\freq, Pseq([Pseq([65,75,85],1),
			Pseq([85,75,75],2),
			Pseq([75,75,75],2),
			Pseq([85,85,88],1)],inf),
		\legato, 0.5,
		\amp, 1
)).play(quant:2);
)
Pdef(\lopbum2).stop;

(
Pdef(\lopbum3hi,
	 Pbind(
		\instrument, \bum,
		\dur, Pseq([0.2,0.1,0.4,0.1],inf),
		\freq, Pseq([Pseq([6500,7500,8500,4000],1),
			Pseq([4000,3000,2000,1000],2),
			Pseq([6000,7000,3000,1000],1)],inf),
		\legato, 0.2,
		\amp, 0.5
)).play(quant:2);
)

Pdef(\lopbum3hi).stop;



(
Pdef(\lopbummhi,
	 Pbind(
		\instrument, \bum,
		\dur, Pseq([0.15,0.051,0.02,Prand([0.051,Rest(0.7),0.07],1), Rest(0.5),Prand([Rest(0.1),Rest(1.2),0.07],1)],inf),
		\freq,Pseq([18500,19500,19500,18000],inf),
		\amp, 0.05
)).play(quant:2);
)

(
Pdef(\loptic1,
	 Pbind(
		\instrument, \tictum,
		\dur, 2,
		\freq, 400,
		\amp, 4,
		\legato, Pseq([0.8,0.2],inf),
)).play(quant:2);
)



(

Ndef(\7).fadeTime=2;
Ndef(\7).quant=2;
Ndef(\7, {
	var s, s2, s3,e ,e2 ,e3 ,f ,f2 ,b;

	b=4/3;

	f=Duty.kr(Dseq([b/2,b,b*2,b],inf),0, Dseq([55,65,80,65],inf));
	f2=Duty.kr(Dseq([b,b*4,b*2,b],inf),0, Dseq([9500,6500,8000,6500,5000],inf));

	e=Decay2.kr(Impulse.kr([b/4,b/8]),decayTime:1);
	e2=Decay.kr(Impulse.kr([b/2,b/2]),0.1);

	s=LFSaw.ar(f).lag(0.02)+GrayNoise.ar(0.1);
	s=Limiter.ar(s*e,0.4);

	s2=SinOsc.ar([f2.lag(0.02),f2.lag(0.2),f2+100, f2+200])*e2;
	s2=CombN.ar(s2,0.5,0.5,b);
	s2=FreeVerb.ar(s2,room:1);

	// s3=


	Mix.new([s,s2]);


	}).play;

)

s.scope(2);


(
Ndef(\3).fadeTime=2;
Ndef(\3).quant=2;

Ndef(\3, {
	var s,s2,s3,e, e2,b;

	b=4/3;
	f=Duty.kr(Dseq([b*1,b*2,b,b*3],inf),0, Dseq([280,260,420,400,600,400],inf));

	e=Decay2.kr(Impulse.kr([b/4,b/8]),decayTime:0.2);
	e2=Decay2.kr(Impulse.kr([b/4,b/2]),decayTime:6);

	s=SinOsc.ar(60)+GrayNoise.ar(0.4)*e;
	s=CombN.ar(Pan2.ar(s,SinOsc.kr(0.5)),0.4,0.4,2);
	s=FreeVerb.ar(s,room:1,damp:0,add:s);

	s2=SinOsc.ar([f,f+100,f+150,f+20,f.lag(0.5),f.lag(0.2)],mul:0.4)*e2;
	s2=CombN.ar(s2,b,b,b*3);


	Mix.new([s,s2]);



}).play;
)

















