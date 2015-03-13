(

Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;
Ndef(\1, {
	var b, s1, s2, e1, e2, f,f2;

	b=4;
		f2=Duty.kr(b/4,0,Drand([45,47,45,50,60],inf));

	f=Duty.kr(b/4,0,Drand([220,880,440,220,660],inf));
	e1=Decay2.kr(Impulse.kr([b,b/4]),decayTime:b/2);
	e2=Decay2.kr(Impulse.kr([b,b/2]),decayTime:0.2);


	s1=LFSaw.ar([f2/2,f2/2+4],[0,pi,2*pi]).wrap(-0.3,0.3).clip(-0.2,0.5).lag(0.002);
	// s1=CombN.ar(s1,

	s2=SinOsc.ar([f,f+11,f+22,f].scramble)*e2;
	s2=CombN.ar(s2,maxdelaytime:0.4,delaytime:0.4,decaytime:b/4);




	Mix.new([s1]);



}).play;
)

Ndef(\1).stop;

{SinOsc.ar({Rand(80.0,800.0)}!8).lag(0.02).sum!4*0.2}.play;


(
Pdef(\bum1,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([0.5,Rest(2.5)],inf),
		\legato, 0.5,
		\octave, [3,2],
		\note, [5,7,2],
		// \freq, 65,
		\amp,1.2,
		\strum, 0.25

)).play;
)
)
Pdef(\bum1).stop;

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

Pdef(\ripple1).stop;


(
Pdef(\imp1,
	Pbind(
		\instrument, \imp,
		\dur, 4,
		\legato, 0.25,
		\pan,0.5,
		\amp, 40
)).play;
)

(
Pdef(\bum2,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([Rest(0.2),0.2,0.6,Rest(2)],inf),
		\strum,Pseq([Pn(0.5,12), Pn(0.05,21)],inf),
		\freq,[800,600,1000],
		\amp,0.1,

)).play;
);


Pdef(\bum2).stop;


(
Pdef(\tss1,
	Pbind(
		\instrument, \tss,
		\dur, Pseq([0.1,0.1,0.1,Rest(1)],inf),
		\legato,0.7,
		\strum, 0.1,
		\freq, Pseq([Pn(11000,16),Pn(8000,8), Pn(1000,4),Pn(8000,8)],inf),
		\f2,5,
		\pan, Pseq([Pn(1,4), Pn(-1,4)],inf),
		\amp, 0.1
)).play;
)


(
Pdef(\bum1,
	Pbind(
		\instrument, \bum,
		\dur,Pseq([0.5,0.5,0.5,Rest(0.5)],inf),
		\legato, 0.25,
		\freq, 1000,
		\amp,0.2,

)).play(quant:2);
)

(

Pdef(\tss1,
	Pbind(
		\instrument, \tss,
		\dur, Pseq([0.25,0.25,0.5,Rest(1)],inf),
		\legato,0.5,
		\freq, 11000,
		\f2,10,
		\pan, Pseq([-1,1,0],inf),
		\amp, 0.051
)).play(quant:2);
)




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
		\amp, 0.1
)).play(quant:2);
);

Pdef(\zum1).fadeTime=2;
Pdef(\zum1).stop;






(
SynthDef(\piano, {
	arg gate=1, sustain=0.5, freq=440, amp=1, pan;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.2,0.7,sustain*0.7),1);

	sig=MdaPiano.ar(freq,gate);
	sig=sig*env;
	sig=Pan2.ar(sig,SinOsc.kr(0.25));

	Out.ar(0,sig*amp);
}).add;
)

(
SynthDef(\piano2, { |out=0, freq=440, gate=1|
    var son = MdaPiano.ar(freq, gate, release: 0.9, stereo: 0.3, sustain: 0);
    DetectSilence.ar(son, 0.01, doneAction:2);
    Out.ar(out, son * 0.1);
}).add;
)

(
Pdef( \piano1,
	Pbind(
		\instrument, \piano2,
		\dur, 4,
		\legato,0.5,
		\strum, 0.4,
		\octave, [5,4],
		\note, [2,5,6,2],
		\amp, 1
)).play(quant:2);
)




























		