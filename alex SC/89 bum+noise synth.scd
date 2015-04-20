p=ProxySpace.push(s);

(
ProxySynthDef(\l, {
	arg amp=1, freq, freq2, sustain, t_gate=1, out=0, pan;
	var sig, env, fenv, fenv2, speed;

	env=EnvGen.kr(Env.perc(releaseTime:sustain),t_gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*2,freq],sustain*0.04),t_gate,timeScale:sustain);
	fenv2=EnvGen.kr(Env.new([freq2,freq2*4],sustain),t_gate,timeScale:sustain);
	speed=EnvGen.kr(Env.new([freq2/8,freq2/2],[sustain*0.5]),t_gate,timeScale:sustain);

	sig=SinOsc.ar(fenv)+BPF.ar(WhiteNoise.ar(amp),fenv2,SinOsc.kr(speed).range(0.1,2),SinOsc.kr(speed).range(0,1));

	Out.ar(out,Pan2.ar(Limiter.ar(sig*env,0.5),pos:pan));
}).add;
)

(
~r.play;
~r[0]=Pbind(
	\instrument, \l,
	\dur,4,
	\legato, 0.5,
	\amp,0.7,
	\freq, Pseq([65,75,85,45],inf),
	\freq2, Pseq([Pn(100,4),Pn(500,2),Pn(1000,4)],inf),

    \pan, [-1,1],
    \strum, 0.5,
);

~r[30]=\filter-> {arg in; GVerb.ar(in,100)}
)

