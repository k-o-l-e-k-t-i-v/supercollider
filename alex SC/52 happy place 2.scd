s.scope(5);


(
SynthDef(\sawr, {

	arg gate=1, freq=50, sustain=0.7, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.85,sustain*0.05,sustain*0.05,sustain*0.05),gate);

	sig=FreeVerb.ar(Saw.ar((Array.fill(10,{arg i; i+freq}))).lag(0.0008),0.1,0.5)*env*amp;
	DetectSilence.ar(sig,doneAction:2);
	Out.ar(0, sig);
}).add;
)

(
SynthDef(\voice, {

	arg gate=1, freq=85, sustain=0.7, amp=1;
	var sig, env;

    env=EnvGen.ar(Env.adsr(sustain*45,sustain*0.05,sustain*0.05,sustain*0.45),gate);

    sig=Mix.fill(10,
		{ arg i;
    BPF.ar(
        PinkNoise.ar(Array.fill(4,{arg i; i/10+0.5})),
        freq:LFNoise0.kr(20).range(freq, freq+i),
        rq:LFNoise0.kr(20).range(0.01,i/10))
    });

    sig=DelayN.ar(Limiter.ar(sig, 0.08)*env*amp,0.2,0.2);
    sig=GVerb.ar(sig,roomsize:1,revtime:0.2);
    DetectSilence.ar(sig,doneAction:2);

    Out.ar(0,sig);

}).add;
)

(
SynthDef(\tum, {
    arg gate=1, freq=125, sustain=0.4, amp=1, pan=0;
	var sig, env, fenv;

    fenv=EnvGen.kr(Env([freq*6,freq],[sustain*0.05],\welch),gate);
    env=EnvGen.ar(Env.adsr(sustain*25,sustain*0.05,sustain*0.05,sustain*0.65),gate);

    sig=Limiter.ar(Mix.fill(5,{SinOsc.ar(fenv)}),0.9)*env*amp;
    sig=FreeVerb.ar(sig,0.1,0.1,1);
    sig=Pan2.ar(sig,pan);
    DetectSilence.ar(sig,doneAction:2);

    Out.ar(0, sig);

}).add;
)

(
SynthDef(\tic, {
    arg gate=1, freq=1000,sustain=0.1,pan=1, amp=1;
    var sig, env;

    env=EnvGen.ar(Env.adsr(sustain*0.25,sustain*0.05,sustain*0.05,sustain*0.65),gate);
	sig=FreeVerb.ar(PinkNoise.ar*env*amp,0.2,0.4,0.9);
	sig=Pan2.ar(HPF.ar(sig,freq), pan);
	DetectSilence.ar(sig,doneAction:2);

	Out.ar(0, sig);
}).add;
)



(
Pdef( \lopsawr,
	Pbind(
		\instrument, \sawr,
		\amp, Pseq([Pn(0.1,4),Pn(0.3,2)],inf),
		\dur, 4,
		\legato, Pseq([0.7,0.4],inf),
		\freq, Pseq([Pn(55,4), Pn(70,2)],inf)
)).play(quant:2);
)

(

Pdef( \lopvoice,
	Pbind(
		\instrument, \voice,
		\amp, 0.8,
		\dur, 4,
		\legato, 0.8,
		\freq, Pseq([Pn(85,2),127.5,85,Pn(700,2)],inf)
)).play(quant:2);
)


(
~a=Pseq([Rest(1.6),85,170,Pn(45,2),Pn(45,2),85,170,Pn(200,2)],1);
~b=Pseq([Rest(1.6),85,45,Pn(85,2),Pn(45,2),85,85,Pn(85,2)],1);
~c=Pseq([Rest(1.6),85,85,Pn(45,2),Pn(85,2),85,85,Pn(85,2)],1);

Ppar( [
	Pbind(
		\instrument, \tum,
		\amp, 3,
		\dur,    Pseq([Rest(1.6),0.4,0.2,Pn(0.1,2),Pn(0.4,2),0.2,0.4,Pn(0.1,2)],inf),
		\legato, Pseq([Rest(1.6),Pn(0.5,4),Pn(0.8,2),Pn(0.4,4)],inf),
		\freq, Pseq([~a,~a, Pxrand([~a,~b]),~c],inf),
		\pan, Pxrand([-1,1],inf)),


	Pbind(
		\instrument, \tum,
		\amp,3,
		\dur,Pseq([Pn(0.2,4),Rest(3.2)],inf),
		\legato,0.8,
		\freq,65,
		\pan,Pseq([1,-1],inf),
	)
	]

).play;

Pdef(\loptic,
	Pbind(
		\instrument, \tic,
		\dur, Pseq([0.2,0.2,0.2,0.6,Rest(2.6)],inf),
		\legato,Pseq([0.5,0.5,0.4,0.9,0],inf),
		\freq, Pseq([Pn(100,10),Pn(1000,5)],inf),
		\amp, Pseq([0.07,0.07,0.07,0.15,Rest(2.6)],inf),
		\pan, Pseq([-1,1,-1,1,0],inf),
)).play;
)