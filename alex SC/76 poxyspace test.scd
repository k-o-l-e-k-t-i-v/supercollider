(
p=ProxySpace.push(s);
s.plotTree;
s.scope(4);
)

(
~y.play(0,2);
~y.fadeTime=2;
~y.quant=2;
)

(
~y[0]= {
	arg t_trig,  freq=45,amp=1, sustain, f2;
	var sig,sig2, fenv, env;

	fenv=EnvGen.kr(Env([freq*4,freq],[sustain*0.04], \welch),t_trig);
	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.1,0.7,sustain*0.7),t_trig,doneAction:2);

	sig2=DelayN.ar(HPF.ar(WhiteNoise.ar(0.65).clip(0.5,1)-0.5,f2),sustain*0.2,sustain*0.2);

	sig=SinOsc.ar([freq,freq+2])*env*amp;
	sig=Limiter.ar((sig+sig2)*amp,1);






};
)
//"the message xset is a variant of set, to crossfade the change using the current fadeTime"
(
~y[10]= \xset -> Pbind(\amp,4,\t_trig,1,
	\freq, 45,
	\f2, Pseq([Pn(14000,4),Pn(19000,2)],inf),
	\dur, 2, \legato, 0.8).trace;
)
~y[10]=nil;
~y[30]= \filter -> {arg in; GVerb.ar(in,roomsize:100,revtime:3)};
~y[30]=nil;
~y[40]= \filter -> {arg in; FreeVerb.ar(in,mix:0.3,room:3)};
~y[40]=nil;


~y.end; // "free the synths and the group, stop playback"

currentEnvironment.free;
p.clear(2);



{HPF.ar(WhiteNoise.ar(0.65).clip(0.5,1)-0.5,11000)*5}.play;
