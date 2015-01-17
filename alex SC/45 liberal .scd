s.scope(2);
(
SynthDef(\tum,{
	arg gate=1, freq=65, sustain=0.3,amp=0.5;
	var sig, env;

	env=EnvGen.kr(Env.adsr(0.2*sustain, 0.1*sustain, 0.1*sustain,0.6*sustain),gate);

	sig=Mix.fill(12,
        {arg i; SinOsc.ar([freq,freq+i, freq+i/2])+BPF.ar(WhiteNoise.ar(0.8),freq*5,rq:SinOsc.kr(i/10).range(0.01,1)).lag(0.02)});
    sig=Limiter.ar(env*sig,amp);
    sig=FreeVerb.ar(sig,0.8,0.1);
    DetectSilence.ar(sig,doneAction:2);

    Out.ar(0,sig);
}).add;

)

(

SynthDef(\piu,{
	arg gate=1, freq=25, sustain=1,amp=0.5;
	var sig, env,fenv;

	env=EnvGen.kr(Env.adsr(0.2*sustain, 0.1*sustain, 0.1*sustain,0.6*sustain),gate);
	fenv=EnvGen.kr(Env([freq*10,freq],[sustain*0.2]),gate);

	sig=Mix.fill(12,{arg i; SinOsc.ar([fenv,fenv+i])});
    sig=Limiter.ar(env*sig,amp);
    sig=FreeVerb.ar(sig,0.8,0.1);
    DetectSilence.ar(sig,doneAction:2);

    Out.ar(0,sig);
}).add;

)

(
SynthDef(\tic, {
	arg gate=1, sustain=0.1, freq=8000, amp=0.8, freq2=10;
	var sig, env;

	env=EnvGen.kr(Env.adsr(0.1*sustain, 0.1*sustain, 0.1*sustain,0.6*sustain),gate);

	sig=BPF.ar(BrownNoise.ar(0.5),freq,SinOsc.kr(freq2).range(0.01,0.1),amp);
	// sig=FreeVerb.ar(sig,0.8,0.1,1);

	DetectSilence.ar(sig,doneAction:2);

	Out.ar(0,sig*env);

	}).add;
)

s.scope(2);

(
Pdef(\lopiu1,
	Pbind(
		\instrument, \piu,
		\dur, 0.5,
		\freq, Pseq([45,15,Prand([75,90,60,85],1),15],inf),
		\legato, Pseq([0.3,0.3,0.8],inf),
		\amp, 3,
)).play(quant:2);
)

(
Pdef(\lopiu2,
	Pbind(
		\instrument, \piu,
		\dur, 0.5,
		\freq, Pseq([45,15,Prand([75,90,6],1),30],inf),
		\legato, Pseq([0.2,0.5],inf),
		\amp, 4,
)).play(quant:2);
)

(
Pdef(\lopiu3,
	Pbind(
		\instrument, \piu,
		\dur, Pseq([0.1,Prand([Rest(0.2),Rest(0.1)],1),0.15],inf),
		\freq, Pseq([45,15,Prand([75,90,6],1),30],inf),
		\legato, Pseq([0.15,Prand([Rest(0.2),Rest(0.1)],1),0.1],inf),
		\amp, 5,
)).play(quant:2);
)


(
Pdef( \looptum,
	Pbind(
		\instrument, \tum,
		\freq, 98,
		\amp, 3,
		\dur, 1,

		\legato, Pseq([0.4,0.1],inf)
)).play(quant:2);
)

(
Pdef( \looptic,
	Pbind(
		\instrument, \tic,
		\freq, Pseq([500,2500, Prand([1000,5000,2500],2)],inf),
		\freq2, Pseq([5,15],inf),
		\amp, 10,
		\dur, Pseq([1,0.5],inf),
		\legato, Pseq([0.7,0.5],inf),
		\pan, Pwhite(-1,1,inf),
)).play(quant:2);
)


s.scope(2);

(
Ndef(\1).fadeTime=2;
Ndef(\1).quant;
Ndef(\1, {
	arg freq=200, sustain=0.2;
	var sig, beat, fr;

	beat=[2,1,3,4,7,11,18];
	fr=Select.kr(Duty.kr(0.5,0, Dseq([0,1,1,2],inf)),[200,400,200,beat*500]); //change last freq while playing

	sig=Saw.ar([fr,fr+beat],0.5,VarSaw.kr(2).range(5,20))*Pulse.ar(4/beat).lag(0.01);
	sig=Limiter.ar(sig,0.1);


}).play(quant:2);
)




(
Ndef(\3).fadeTime=2;
Ndef(\3).quant;
Ndef(\3, {
	arg freq=200,sustain=2;
	var sig, beat;

	beat=[2,1,3,4,7,11,18];


	sig=GrainFM.ar(2,
		trigger:Impulse.kr(0.5),
		dur:Duty.kr(1,0,Dseq([2,3,1,4],inf)),
		carfreq:SinOsc.kr(BrownNoise.kr(20!2,20),[0,0.2*pi],VarSaw.kr(0.25).range(0,1)).range(10,200),
		modfreq:LFPulse.kr(Impulse.kr(4/beat)+Saw.kr([100,50]).range(200,10),width:0.5),
	);

	sig=Limiter.ar(sig*VarSaw.ar(500),0.1);
	sig=FreeVerb.ar(sig,0.8,1);
	sig=sig*Decay2.kr(Impulse.kr(5/beat),0.2,1);
	sig=Pan2.ar(sig,Rand(-1,1));




}).play;
)


s.scope(2);
(
Ndef(\4).fadeTime=2;
Ndef(\4).quant=2;
Ndef(\4, {

	~beat=[2,1,3,4];
	~sig=PinkNoise.ar(0.2)*Phasor.ar(Impulse.ar(4/~beat),0.001);
	~sig2=WhiteNoise.ar(0.5)*Pulse.ar([4/~beat],0.5).lag(0.2);
	~sig2=Limiter.ar(~sig2,0.1);
	~sig2=GVerb.ar(~sig2,3,1,0.1,drylevel:1);
	~sig3=~sig+~sig2;



}).play;

)