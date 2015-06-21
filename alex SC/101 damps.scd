p=ProxySpace.push(s);


(
ProxySynthDef(\difuse, {
	arg sustain, amp, rq;
	var sig, env, fenv,denv;

	env=EnvGen.kr(Env([0,1,0.4,0.7,0], sustain*[0.1,0.3,0.2,0.4],[\step, \welch,\sin, \step]),doneAction:2);
	fenv=EnvGen.kr(Env(\freq.kr*[1,1.2,0.5,0.7,1], sustain*[0.1,0.3,0.2,0.4], [\step, \welch,\sin, \step]));
	denv=EnvGen.kr(Env(\d.kr*[1,20,1], sustain*[0.3,0.3,0.4], [\step, \welch, \step]));

	sig=SinOsc.ar(fenv!6,[0,pi,2pi]).lag(0.02)+Dust.ar(denv).clip(0.5,0.8);
	sig=Limiter.ar(sig,0.2)*amp;
}).add;

ProxySynthDef(\sin, {
	arg sustain, amp;
	var sig, env;
	env=EnvGen.kr(Env([0,1,0.7,0.2,1,0], sustain*[0.1,0.2,0.1,0.2,0.4],\welch),doneAction:2);
	sig=SinOsc.ar([\freq.kr, \freq.kr+2,\freq.kr+4, \freq.kr+6])*env*amp;
}).add;
)

(
~q.play;
~q.clock=TempoClock(60/60).permanent_(true);
~q.quant=2;
~q.fadeTime=2;

~q[0]=Pbind(\instrument, \difuse,
	\dur, Pseq([4,Rest(6)],inf),
	\freq, 75*[1,1.2,1.6],
	\d, 20,
	\amp, 0.3);

~q[30]=\filter-> {arg in; GVerb.ar(in,20, 3,damping:0)};
~q[31]=\filter->{arg in; CombN.ar(HPF.ar(in,100))};

)

(
~d.play;
~d.fadeTime=2;
~d.quant=2;
~d.clock=TempoClock(60/60).permanent_(true);
~d[0]=Pbind(\instrument, \sin,
	\dur, Prand([12,8,10],inf),
	\octave, Pseq([6,5],inf),
	\degree, [2,6,4],
	\strum, 2,
	\amp, 0.02,
);
~d[30]=\filter-> {arg in; GVerb.ar(in,roomsize:2,revtime:2,damping:\damp.kr)};
~d[31]=\set-> Pbind(\args, [\damp], \dur, Prand([4,8,6],inf), \damp,Pseq([0.2,0,1,0.8],inf));
~d[32]=\filter-> {arg in; DFM1.ar(in,220, 0.3,noiselevel:SinOsc.kr(\noise.kr).range(0.003, 0.0095))};
~d[33]=\set-> Pbind(\args, [\noise], \dur, Prand([4,2,6],inf), \noise, Prand([0.25, 0.125,0.5],inf));
)
