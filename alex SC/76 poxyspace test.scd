p=ProxySpace.push(s);
s.plotTree;

~y.play;

~y.fadeTime=2;

~y.quant=2;

(
~y[0]= {
	arg t_trig,  freq=45,amp, sustain;
	var sig, fenv, env;

	fenv=EnvGen.kr(Env([freq*4,freq],[sustain*0.04], \welch),t_trig);
	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,0.7,sustain*0.7),t_trig,doneAction:2);

	sig=SinOsc.ar([freq,freq+2])*env*amp;
	sig=Limiter.ar(sig*amp,1);

};
)

~y[10]= \xset -> Pbind(\amp,5,\t_trig,1, \freq, 45, \dur, 1, \legato, 0.8).trace;
~y[30]= \filter -> {arg in; GVerb.ar(in,roomsize:100,revtime:1)};



o=MyNewTest();
o.playSin;
o.currentFreq;
o.octave(7);


s.scope(4);

currentEnvironment.free;