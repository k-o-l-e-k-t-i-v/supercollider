(

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


SynthDef(\zum, {
	arg gate=1, sustain=2, freq=100, amp=1, lag=0.0002,res;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),gate,doneAction:2);
	sig=LFSaw.ar([freq, freq+2, freq+4], [0,pi,2*pi]);
	sig=Fold.ar(sig,0,0.6).lag(lag);
	sig=DFM1.ar(sig,freq,res:res,noiselevel:SinOsc.kr(0.125).range(0.002,0.00008))-0.4;
	sig=sig*env*amp;

	Out.ar(0, sig);

}).add;


SynthDef(\tss, {
	arg gate=1, sustain=0.1, freq=11000,amp=1, f2=2, pan=0;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),gate,doneAction:2);
	sig=HPF.ar(WhiteNoise.ar(amp),VarSaw.kr(f2).exprange(freq,f2*1000));
	sig=Pan2.ar(sig*env*amp,pan);

	Out.ar(0, sig);

}).add;

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
		\amp, 0.5
)).play;
)




















		