(
SynthDef.new(\pn, {
	arg gate=1, freq=440, freq2=44, sustain=0.4;
	var sig, env;

	sig=MdaPiano.ar(freq,gate,vel:20,decay:0.8,release:0.4,sustain:sustain);
	DetectSilence.ar(sig,amp:0.1,doneAction:2);
	sig=Limiter.ar(sig,0.5);

	Out.ar(0,sig);

}).store;
)


//this
(
Pbind(
	\instrument, \pn,
	\note, 9,
	\octave,5,
	\amp,1,
).play;
)

//is the same as

(
Pbind(
	\instrument, \pn,
	\freq, 440,
	\amp, 1

).play;
)
//and the same as this
(
Pbind(
	\instrument, \pn,
	\degree, 5,
	\octave,5,
	\amp,1,
).play;
)
//no fucking clue how this works :|


s.scope(2);