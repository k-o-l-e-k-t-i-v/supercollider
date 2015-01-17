(
SynthDef(\test, {
	arg gate=1, beat=2, freq=65;
	var env, tone;
	tone=VarSaw.ar(freq, 0, 0.2,SinOsc.kr(beat))*Pulse.kr(1,0.25);
	tone=LPF.ar(tone, 60);
	tone=Pan2.ar(tone,[1,-1],1);

	Out.ar(0,tone);
}).add;
)

s.scope(2);

(
a=Pdef(\looptest, {
	Pmono(
		\test,
		\freq, 65,
		\beat,  5, //Pseq([0.25,1], 2),
		\dur, 4,
	)}).play(quant:2);
)

a.stop;

Pdef(\looptest).free;



/*
//////////////////////////////////
//just comment how to stop Pdef. From Synthdef delete gate=1, you dont need that and it keep trigger still open, so you cant stop it. For stop use "Pdef(\looptest).stop;"
(
SynthDef(\test, {
arg beat=2, freq=65;
var env, tone;
tone=VarSaw.ar(freq, 0, 0.2,SinOsc.kr(beat))*Pulse.kr(1,0.25);
tone=LPF.ar(tone, 60);
tone=Pan2.ar(tone,[1,-1],1);

Out.ar(0,tone);
}).add;
)

(
Pdef(\looptest, {
Pmono(
\test,
\freq, 65,
\beat,  5, //Pseq([0.25,1], 2),
\dur, 4,
)}).play(quant:2);
)
Pdef(\looptest).stop;
*/