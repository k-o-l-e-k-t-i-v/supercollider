(
SynthDef(\ping, {
	arg gate=1, sustain=1, freq=110, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.2,0.5,sustain*0.6),gate,doneAction:2);
	sig=Limiter.ar(SinOsc.ar(freq+(1..4)),0.9);
	sig=FreeVerb.ar(sig,room:1)*env*amp;

	// DetectSilence.ar(sig,doneAction:2);


	Out.ar(0,sig);

}).add;



SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1, room=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain*0.05],\welch),gate);
	sig=Mix.fill(5, {SinOsc.ar(fenv*(1..10))});
	sig=FreeVerb.ar(sig,mix:0.5,room:room,damp:1);
	sig=Limiter.ar(sig,0.7)*env*amp;

	Out.ar(0,sig);
}).add;



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

)


s.scope(2);


(
Pdef(\lopping1,
	Pbind(
		\instrument, \ping,
		\dur, 1,
		\legato, 2,
		\strum, 0.1,
		\note,  [1,3,5],
		\octave, Pseq([4,4,4,6,4,7,5,6, Prand([4,5,6],1)],inf),
		\amp, 0.5,

)).play;
)

(
Pdef(\lopping2,
	Pbind(
		\instrument, \ping,
		\dur, Pseq([0.2,0.1,Prand([0.1,0.2, Rest(0.5)],2),0.2,Rest(0.4)],inf),

		\legato, 0.35,
		\amp, 0.5,
		\strum, 0.2,
		\note, [1,3,5],
		\octave, Pseq([11,10,9],inf),

)).play;
)


(
Pdef(\lopping3,
	Pbind(
		\instrument, \ping,
		\dur, Pseq([0.7,0.7,0.25,0.25, Rest(0.25)],inf),

		\legato, Pseq([0.7,0.7,0.25,0.25,Rest(0.25)],inf),
		\amp, Pseq([0.7,0.7,0.4,0.4,Rest(0.25)],inf),
		\strum, 0.1,                                         //change strum
		\note, [1,3,5],                 //change notes
		\octave, Pseq([[2,3],[2,3],10,9,Rest(0.25)],inf),

)).play;
)



(
Pdef(\lopbum1,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([0.7,0.7,0.25,0.25, Rest(0.25)],inf),

		\legato, Pseq([0.7,0.7,0.25,0.25,Rest(0.25)],inf),
		\amp, Pseq([0.7,0.7,0.4,0.4,Rest(0.25)],inf),
		\strum, 0.1,                                         //change strum
		\note, Pseq([Pn([1,3,5],2),Pn([2,4],2)],inf),                              //change notes
		\octave, Pseq([[1,2,3],[1,2,3],10,9,Rest(0.25)],inf),

)).play;
)


(
Pdef(\lopbum2,
	Pbind(
		\instrument, \bum,
		\dur, 1.2,
		\legato, [0.2,0.8,0.1,0.1,0.2,0.5],
		\amp,1,
		\strum, 0.15,
		\room, 0,
		\note, [2,4,7,4,2,1],
		\octave, [3],

)).play(quant:2);
)

(
Pdef(\lopbum3,
	Pbind(
		\instrument, \bum,
		\dur, 1.4,
		\legato, [0.2,0.1,0.7,0.1,0.8],
		\amp,1,
		\room, 0.1,
		\strum, 0.15,
		\note, [8,2,7,8,1],
		\octave, [2,3],

)).play(quant:2);
)


(
Pdef(\lopbum4,
	Pbind(
		\instrument, \bum,
		\dur, 2,
		\legato, [0.2,0.15,0.2,0.5],
		\amp,1,
		\room, Pseq([Pn(0,4),1,2,2],inf),
		\strum, 0.25,
		\note, [7,7,3,1],
		\octave, [2],

)).play(quant:2);
)

(
Pdef(\loprip1,
	Pbind(
		\instrument, \ripple,
		\dur, 2,
		\legato, [0.1,0.5,0.7,0.5],
		\amp,2,
		\f2, 2,
		\strum, 0.15,
		\note, [3,2,5,4],
		\octave, Pseq([Pn(4,4),Pn(3,4),Pn(2,1)],inf),

)).play;
)