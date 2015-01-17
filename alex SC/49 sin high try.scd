(

SynthDef(\lohi, {
	arg gate=1, sustain=0.5, sustain2, freq=65,rate=0.8,amp=1, top=6, fp=100, volp=0.2;
	var sig,sig2, env, env2, fenv;


	fenv=EnvGen.kr(Env([freq*top, freq], [sustain*0.1],curve:\welch),gate);

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.2,sustain*0.1,sustain*0.5,curve:-4),gate);
	env2=EnvGen.kr(Env.adsr(sustain*0.05,sustain*0.05,sustain*0.1,sustain*0.8,curve:-4),gate);

	sig2=DelayN.ar(Phasor.ar(Impulse.kr([fp,fp+0.25]),rate:rate),0.08,0.08)*volp;
	sig=Limiter.ar( Mix.fill(25, { arg i;SinOsc.ar([fenv, fenv+(i/10)],[0,i/30*pi])}), 0.9);
	sig=sig*env;
	sig2=sig2*env2;

	sig=(sig+sig2)*amp;
	DetectSilence.ar(sig,doneAction:2);

	Out.ar(0,sig);
}).add;
)


(
Pdef(\loplo,
	Pbind(
		\instrument, \lohi,
		\freq, Pseq([Pn(65,4),Pn(45,4),Pseq([65,45],1)],inf),
		\dur, Pseq([Pn(0.5,2),Pn(0.25,2),Pseq([0.5,1],1)],inf),
		\legato, Pseq([0.7,0.5],inf),
		\amp,1,
)).play;
)

//nomnom
(
Pdef(\loplo,
	Pbind(
		\instrument, \lohi,
		\freq, Pseq([Pn(35,4), Pn(40,4),Pn(55,6)],inf),
		\fp, Pseq([Pn(2000,4), Pn(200,4),Pseq([200,20,100,10,500,50],1)],inf),
		\volp, 0.5,
		\top, 3,
		\dur, Pseq([0.4,1],inf),
		\legato, Pseq([0.5,1.2],inf),
		\amp,1,
)).play;
)

s.scope(2);


{Phasor.ar(Impulse.kr(200),rate:0.2,start:-2,end:0.6)}.play;  ///change rate to play