(

SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1, room=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain*0.05],\welch),gate);
	sig=Mix.fill(5, {SinOsc.ar(fenv+(1..4))});
	sig=FreeVerb.ar(sig,mix:0.5,room:room,damp:1);
	sig=Limiter.ar(sig,0.5)*env*amp;

	Out.ar(0,sig);
}).add;



SynthDef(\ripple, {
	arg gate=1, sustain=1, freq=40,f2, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq], [sustain*0.05],\welch),gate);

	sig=BPF.ar(GrayNoise.ar(amp-0.5),fenv,SinOsc.kr(f2).range(0.01,1))*env;
	sig=Limiter.ar(Pan2.ar(sig,SinOsc.kr(f2)),0.7)*env*amp;
	sig=FreeVerb.ar(sig,mix:0.5,room:0.5,damp:1);

	Out.ar(0,sig);
}).add;


SynthDef(\zum, {
	arg gate=1, sustain=2, freq=100, amp=1, lag=0.0002,res;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),gate,doneAction:2);
	sig=LFSaw.ar([freq, freq+2, freq+4], [0,pi,2*pi]);
	sig=Fold.ar(sig,0,0.6).lag(lag);
	sig=DFM1.ar(sig,SinOsc.kr(0.25).range(freq,freq+10),res:res,
		noiselevel:SinOsc.kr(0.125).range(0.0041,0.00008))-0.5;
	sig=sig*env*amp;

	Out.ar(0, sig);

}).add;


SynthDef(\tss, {
	arg gate=1, sustain=0.1, freq=11000,amp=1, f2=2, pan=0;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),gate,doneAction:2);
	sig=HPF.ar(WhiteNoise.ar(amp),VarSaw.kr(f2).exprange(freq,f2*1000));
	sig=Pan2.ar(sig**env*amp,pan);

	Out.ar(0, sig);

}).add;

(
SynthDef(\imp, {
	arg gate=1, sustain=1, freq=5, amp=1, pan=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),gate,doneAction:2);
	sig=Impulse.ar(env).lag(0.8)*30;
	sig=CombN.ar(sig,maxdelaytime:0.1,delaytime:0.1,decaytime:sustain);

	sig=Pan2.ar(sig,SinOsc.kr(pan),level:amp);


	Out.ar(0,sig);
}).add;
)

)


(

(
Pdef(\zum1,
	Pbind(
		\instrument, \zum,
		\dur, 4,
		\strum, 1,
		\octave, Prand([[4,3],[5,2],[4,3],[4,4]],inf),
		\notes, Prand([[1,5,7],[6,4,8],Prand([[2,5],[1,3],[2,4]],2)],inf),
		\legato,2,
		\lag, 0.02,
		\res, Prand([1,0.5,1.2,1.4,0.2],inf),
		\amp, Pseq([Pseries(0.2,0.1,2),Pseries(0.5,-0.1,2)],inf)
))
);


(
Pdef(\bum1,
	Pbind(
		\instrument, \bum,
		\dur, 4,
		\strum, 0.25,
		\legato, 0.3,
		\freq, [[45,47],[47,45],[49,51]],
		\amp,0.8,/*Pseq([Pseries(0.2,0.2,5),Pseries(0.8,-0.01,5)],inf)*/

)).play;
);

(
Pdef(\bum2,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([Rest(0.2),0.2,Rest(3.6)],inf),
		\strum,Pseq([Pn(0.5,12), Pn(0.05,21)],inf),
		\freq,[19000,14000],

		\amp,0.1,

))
);


(
Pdef(\imp1,
	Pbind(
		\instrument, \imp,
		\dur, 8,
		\legato, 0.25,
		\pan,0.5,
		\amp, 40
))
);


(
Pdef(\ripple1,
	Pbind(
		\instrument, \ripple,
		\dur, 8,
		\legato, 0.7,
		\strum, 0.3,
		\octave, Pseq([4,2,3,4,3],inf),
		\note, [2,2,4,2,3],
		\amp, 1,
		\f2, 2
)).play;
);


(
Pdef(\tss1,
	Pbind(
		\instrument, \tss,
		\dur, Pseq([0.1,0.1,0.1,Rest(1.7)],inf),
		\legato,0.7,
		\strum, 0.1,
		\freq, Pseq([Pn(11000,16),Pn(8000,8), Pn(1000,4),Pn(8000,8)],inf),
		\f2,10,
		\pan, Pseq([Pn(1,4), Pn(-1,4)],inf),
		\amp, 0.1
))
);


)


(

Routine{

	Pdef(\zum1).play;

	8.wait;

	Pdef(\bum1).play;

	16.wait;

	Pdef(\bum1).fadeTime=2;
	Pdef(\bum1).stop;

	8.wait;

	Pdef(\bum1).play;
	Pdef(\tss1).play;
	Pdef(\bum2).play;

	4.wait;

	Pdef(\imp1).play;

	46.wait;

	Pdef(\bum1).fadeTime=2;
	Pdef(\bum1).stop;

	10.wait;

	Pdef(\tss1).stop;
	Pdef(\bum2).stop;

	16.wait;

	Pdef(\zum1).fadeTime=6;
	Pdef(\zum1).stop;

	8.wait;

	Pdef(\imp1).stop;




}.play;
)



////ok
(
Pdef(\bum1,
	Pbind(
		\instrument, \bum,
		\dur,0.5,
		\legato, Pseq([0.5,0.25],inf),
		\freq, 85,
		\amp,1,

)).play(quant:2);



Pdef(\tss1,
	Pbind(
		\instrument, \tss,
		\dur, Pseq([0.25,0.25,0.5,Rest(1)],inf),
		\legato,0.5,
		\freq, 6000,
		\f2,5,
		\pan, Pseq([-1,1,0],inf),
		\amp, 0.051
)).play(quant:2);
)
