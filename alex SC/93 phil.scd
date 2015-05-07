t=TempoClock(1,0).permanent_(true);
p=ProxySpace.push(s);
s.plotTree;
t.beats;

(
ProxySynthDef(\ph, {
	arg sustain, amp,speed,vol;
	var sig, env,fenv, lagenv;

	env=EnvGen.kr(Env.new(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*2,\freq.kr],[sustain*0.08]),\gate.kr(1),timeScale:sustain);
	lagenv=EnvGen.kr(Env.new([\lag.kr*0.1,\lag.kr],[sustain*0.7]),\gate.kr(1),timeScale:sustain);
	sig=Lag.ar(LFSaw.ar(\freq.kr),lagenv)*env*amp;
	sig=Pan2.ar(sig,SinOsc.kr(speed),vol);
}).add;
)

(
~ph.play;
~ph.quant=1;
~ph[0]=Pbind( \instrument, \ph,
	\dur, Pseq([Prand([8,12,10],2), 6,12],inf),
	\legato, 1.2,
	\octave, Prand([6,4,[3,5],7, [7,4],[3,6]],inf),
	\degree, [3,5,1],
	\strum, 12,
	\vol, 2,
	\lag, 0.2,
	\amp, 0.5,
	\speed, Prand([0.0125,0.00125,0.025],inf),

);
~ph[30]=\filter->{arg in; DFM1.ar(in,\freq2.kr,\res.kr,noiselevel:\noise.kr)*0.2+in};
~ph[31]=\set-> Pbind(\args, [\fdmf, \res, \noise],
	\dur, Prand([10,8,12],inf),
	\octave, Prand([4,6,5],inf),
	\degree, [3,2,8],
	\res, 0.01,
	\strum, 12,
	\noise, Prand([0.0003, 0.003, 0.002],inf),

);
~ph[32]=\filter-> {arg in; GVerb.ar(in,150,10)*0.5+FreeVerb.ar(in,room:2)};
)