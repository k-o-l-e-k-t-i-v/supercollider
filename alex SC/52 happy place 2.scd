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
SynthDef(\long, {
	arg gate=1, sustain=0.7, amp=1, pan=1,freq=330;
	var sig, env;

	env=EnvGen.ar(Env.adsr(sustain*25,sustain*0.25,sustain*0.05,sustain*0.45),gate,doneAction:2);
	sig=Mix.fill(4,
		{arg i;
			Saw.ar(freq*[1,2,3,5]).lag(0.02)});

	sig=Limiter.ar(sig*env*amp,0.5);

	Out.ar(0,sig);
}).add;
)


///////////////saw
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


///////////////voice 4 sec

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

//////////////beat
(
~a=Pseq([Rest(1.6),85,170,Pn(45,2),Pn(45,2),85,170,Pn(170,2)],1);
~b=Pseq([Rest(1.6),85,45,Pn(85,2),Pn(45,2),85,85,Pn(85,2)],1);

~c=   Pseq([Rest(1.6),85,     Pn(45,3),         45,            85],1);

~dur1=Pseq([Rest(1.6),0.4,0.2,Pn(0.1,2),Pn(0.4,2),0.2,0.4,Pn(0.1,2)],1);
~dur2=Pseq([Rest(1.6),0.4,    Pn(0.4,3)          ,0.6         ,0.2],1);

~beat=Ppar( [
	Pbind(
		\instrument, \tum,
		\amp, 3,
		\dur,    Pseq([Pn(~dur1,4),~dur2],inf),
		\legato, Pseq([Rest(1.6),Pn(0.5,4),Pn(0.8,2),Pn(0.4,4)],inf),
		\freq, Pseq([~a,~a, Pxrand([~a,~b],2),~c],inf),
		\pan, Pxrand([-1,1],inf)).trace,


	Pbind(
		\instrument, \tum,
		\amp,3,
		\dur,Pseq([Pn(0.2,4),Rest(3.2)],inf),
		\legato,0.8,
		\freq,65,
		\pan,Pseq([1,-1],inf)),

	Pbind(
		\instrument, \tic,
		\dur, Pseq([0.2,0.2,0.2,0.6,Rest(2.8)],inf),
		\legato,Pseq([0.5,0.5,0.4,0.9,0],inf),
		\freq, Pseq([Pn(100,10),Pn(10000,10)],inf),
		\amp, Pseq([0.07,0.07,0.07,0.15,Rest(2.6)],inf),
		\pan, Pseq([-1,1,-1,1,0],inf))]
);

~beat.play;
~saw4.play;
)


////////saw long 8 sec

(
~saw4=Pdef( \lopsawlong4,
	Pbind(
		\instrument, \long,
		\amp, 0.071,
		\dur,8,
		\legato, 1.5,
		\octave, Pseq([4,5,Pn([3,5],2),[4,3,5]],inf),
		\degree, [1,3,5])
);
)
~saw4.trace.play;



///////////saw increasingly fast
(
Pdef(\looplong,
	Pbind(
		\instrument, \long,
		\amp, 0.8,
		\dur,Pseq([Pseries(4,-0.2,19),Pn(0.2,30)],inf),
		\legato, 1.5,
		\octave, Pseq([5,6,[4,6],5,[6,7]],inf),
		\degree, [1,3,5]);
).play;
)

//////saw one octave apart long<<>>short
(
Ppar([
	Pbind(
		\instrument, \long,
		\amp, 0.8,
		\dur,Pseq([Pseries(4,-0.2,19),Pn(0.2,30)],inf),
		\legato, 1.5,
		\octave, Pseq([5,6,[4,6],5,[6,7]],inf),
		\degree, [1,3,5]),

	Pbind(
		\instrument, \long,
		\amp, 0.5,
		\dur,4,
		\legato, 0.5,
		\octave, Pseq([4,5,[3,5],4,[5,8]],inf),
		\degree, [1,3,5])
	]
).play;
)

