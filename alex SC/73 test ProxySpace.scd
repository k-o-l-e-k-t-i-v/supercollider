p=ProxySpace.push(s);

(
~w.fadeTime=2;
~w.quant=2;
~w.play;

~w[0] = {
	arg freq=65, sustain=1, t_trig, amp=1;
	var env, sig;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,0.7,sustain*0.7),t_trig);

	sig=LFSaw.ar(freq*(2,4..8),SinOsc.kr(0.25).range(0,2pi));
	sig=sig*LFPar.ar([100,0.5]);
	sig=sig*env*amp;

};

~w[10]= \set->

Pbind(
	\amp, 0.5,
	\t_trig, 1,
	\dur, 1,
	\legato, 0.5,
	\freq, 25,
);




// ~w[20]=\filter-> { arg in; FreeVerb.ar(in,mix:SinOsc.kr(0.25).range(0.3,0.8),room:0.5)};

)

~w.stop(10);
~w.clean;


//ERRORS


//
// wrapped channels from 4 to 2 channels
// NodeProxy.audio(localhost, 2)
// ERROR: Message 'clean' not understood.

//keeps playing effect even after stopping and uncommenting the effect