p=ProxySpace.push(s);

(
ProxySynthDef(\tit, {
	arg sustain, gate=1, freq, f2, amp, lag, top;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.4,0.5]),gate:gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq,freq*0.5], [0.04,0.96], \welch),gate);
	sig=(LFPulse.ar(f2).lag(0.002)*VarSaw.ar(freq).lag(lag)+
		(Pulse.ar(freq*top,mul:0.2)*Decay.ar(Impulse.ar(f2),0.2).lag(0.02)))*env;
	sig=Pan2.ar(sig,SinOsc.kr(f2))*amp;}).add;

ProxySynthDef(\tss, {
	arg sustain, freq,noise, gate=1, amp, pos, f2;
	var sig, env, fenv;
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.4,0.5]),gate:gate,timeScale:sustain,doneAction:2);
	sig=Dust.ar(noise)*LFSaw.ar(freq/10).lag(0.002)+SinOsc.ar(freq);
	sig=Pan2.ar(sig,SinOsc.kr(f2))*env;}).add;

ProxySynthDef(\exp, {
	arg sustain, amp, freq, gate=1,f2;
	var sig, env;
	env=EnvGen.kr(Env([0,1,0], [0.5,0.5]),gate:gate,timeScale:sustain,doneAction:2);

	sig=LFSaw.ar(freq!2)*WhiteNoise.ar(LFNoise1.kr(10).range(0.1,0.4)!2)+GrayNoise.ar(LFNoise0.kr(f2).range(0.1,0.4)!2);
	sig=BPF.ar(sig,
		freq:LFNoise0.kr(f2).range(freq, freq+100),
		rq:LFNoise0.kr(f2).range(0.0001, 0.008),mul:env)*amp;
	/*sig=Pan2.ar(sig, SinOsc.ar(f2));*/
}).add;

ProxySynthDef(\glitch, {
	arg sustain, freq, n, gate=1, amp, pos;
	var sig, env, glitch, fenv;
	glitch=SelectX.ar(n,[
		HPF.ar(GrayNoise.ar(1)*Decay2.kr(Impulse.kr(15),decayTime:0.5),9000),
		LFSaw.ar(LFNoise0.kr(100).range(3,0.5)),
		LFPulse.ar(freq/15,add:Dust.ar(700)),
		WhiteNoise.ar(Decay.kr(Impulse.kr(5)).exprange(0.8,0.01))

	]);
	env=EnvGen.kr(Env([0,1,0], [0.1,0.9]),gate:gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq], [sustain*0.04]),gate:gate);
	sig=Pan2.ar(Limiter.ar(Mix.fill(20,{SinOsc.ar(fenv)}),1)+glitch,pos);
	sig*env*amp;}).add;

ProxySynthDef(\onion, {
	arg sustain, gate=1, amp, freq, f2, fsaw;
	var sig, env, fenv, penv, nenv;

	env=EnvGen.kr(Env([0,1,0.2,1,0],[0.1,0.2,0.6,0.1],\welch),gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq],[sustain*0.04],\welch),gate);
	penv=EnvGen.kr(Env([0,-1,1,0,-1,1],[0.2,0.05,0.5,0.2,0.05]),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0,0,1,0,0,1,0],[0.2,0.05,0.05,0.6,0.05,0.05]),gate,timeScale:sustain);

	sig=Mix.fill(15, {arg i;
		SinOsc.ar(SinOsc.kr(LFNoise0.kr(f2).range(fenv,fenv+i)).range(fenv,fenv+i),[0,i,pi],add:GrayNoise.ar(nenv))})*SinOsc.ar(fsaw);
	sig=Pan2.ar(Limiter.ar(sig+WhiteNoise.ar(0.1),1)*amp,penv);}).add;




ProxySynthDef(\bpf, {
	arg freq, amp, sustain,gate=1;
	var sig, env, fenv, rqenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate,timeScale:sustain,doneAction:2);
	rqenv=EnvGen.kr(Env([0.001,0.1,2,0.001,0.1],[0.1,0.2,0.6,0.1],\welch),gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq],[sustain*0.04],\welch),gate);
	penv=EnvGen.kr(Env([-1,1,0],[sustain*0.1,sustain*0.9]),gate,timeScale:sustain);

	sig= BPF.ar(WhiteNoise.ar(Decay.kr(Impulse.kr(0.5),2).range(0.1,0.7)),fenv+100,rqenv)+
	BPF.ar(PinkNoise.ar(Decay.kr(Impulse.kr(0.125),2).range(0.7,0.2)),fenv+40,rqenv-0.02)+
	BPF.ar(GrayNoise.ar(Decay.kr(Impulse.kr(2),2).range(0.1,0.2)),fenv-10,rqenv-0.01);

/*	sig=Mix.fill(5,{arg i; BPF.ar(WhiteNoise.ar([env,env+0.1, DelayN.kr(env+0.2), Lag.kr(env)]),
		freq:fenv+[1,2.5,3,5.5,8,13.5,21.5,i],
		rq: rqenv)});*/
	sig=Pan2.ar(Limiter.ar(sig,0.06),penv)*amp*env;}).add;




ProxySynthDef(\pitch, {
	arg sustain, gate=1, amp, freq, pitch;
	var sig, env,fenv;

	env=EnvGen.kr(Env([0,1,0],[[0.5,0.5],[0.1,0.9],[0.8,0.2]],[\welch,\sin,\lin]),gate,timeScale:sustain,doneAction:2);

	sig=LFSaw.ar(freq!2).lag([0.01,0.2,0.002,0.05,0.02,0.03]);
	sig=PitchShift.ar(sig,
		windowSize:0.1,  // don't fuck with this guy
		pitchRatio:[0.5,0.8,1.2]);
	sig=Pan2.ar(sig,0)*env*amp;}).add;


)

currentEnvironment.free;

(
~o.play;
~o.fadeTime=1;
~o.quant=1;
~o.clock=TempoClock(120/60).permanent_(true);
~o[0]=Pbind(\instrument, \tit,
	\dur, 4,
	\legato, 1.2,
	\octave, Pseq([3,4,3,5,5,4],inf),
	\degree, [4,2,2,5],
	\strum, 2,
	\top, Pseq([15,17,10,15,17],inf),
	\lag, 0.002,
	\f2, Pseq([0.25,0.5],inf),
	\amp, Pseq([Pseries(0.4,-0.1,4),Rest(1),0.1,0.2],inf),
);
~o[30]=\filter->{arg in; FreeVerb.ar(in, room:0.7,add:in,damp:0)};
)
(


~f.play;
~f.fadeTime=1;
~f.quant=1;
~f.clock=TempoClock(60/60).permanent_(true);
~f[0]=Pbind(\instrument, \tss,
	\dur, Pseq([4,2],inf),
	\legato, 0.3,
	\freq, 65,
	\noise, Pseq([200,700,2000,1200],inf),
	\amp, 0.1,
	\f2, Pseq([0.25,0.125],inf)
);
~f[30]=\filter->{arg in ;GVerb.ar(in,1.2,5,mul:0.7,add:in*0.2)};

)



//unpredictable low volume
(
~e.play;
~e.fadeTime=1;
~e.quant=1;
~e.clock=TempoClock(60/60).permanent_(true);
~e[0]=Pbind(\instrument, \exp,
	\dur, 2,
	\f2, 0.25,
	\legato, 1.2,
	\octave, [4,3],
	\degree, Pseq([4,8,5,2,6],inf),
	\amp,5);

~e[30]=\filter->{arg in; GVerb.ar(in,LFNoise0.kr(0.5).range(0.9,2),add:in)};
~e[31]=\filter->{arg in; FreeVerb.ar(in,room:1)};
~e[32]=\filter->{arg in; LPF.ar(in,1800,add:in)};
)

(
~z.play;
~z.fadeTime=1;
~z.quant=1;
~z.clock=TempoClock(240/60).permanent_(true);
~z[0]=Pbind(\instrument, \glitch,
	\dur,Pseq([Pn(0.5,5),Rest(5)],inf),
	\legato,0.7,
	\freq, 70,
	\amp, 0.8,
	\pos, Pseq([-1,1],inf),
	\n, Pseq([0,1,2,3],inf),
);
// ~z[30]=\filter->{arg in ;CombN.ar(in,0.1,0.1,SinOsc.kr(0.125).range(0.2,1),add:in)};
~z[31]=\filter-> {arg in; FreeVerb.ar(in,room:0.5,add:in)};
)


(
~m.play;
~m.fadeTime=1;
~m.quant=1;
~m.clock=TempoClock(60/60).permanent_(true);
~m[0]=Pbind(\instrument, \onion,
	\dur, 8,
	\legato, 0.5,
	\freq, 65,
	\f2, 500,
	\amp, 0.2,
	\fsaw, Prand([20,40,100,80,60],inf),
);
~m[30]=\filter->{arg in; GVerb.ar(in,10,maxroomsize:21,add:in)}
// ~m[31]=\set-> Pbind(\args, [\room], \dur, 2, \room ,Pseq([10,50],inf));
)


(
~n.play;
~n.fadeTime=1;
~n.quant=1;
~n.clock=TempoClock(60/60).permanent_(true);
~n[0]=Pbind(\instrument, \bpf,
	\dur, 16,
	\legato, 0.5,
	\freq, 100,
	\amp, 15,

);
~n[30]=\filter->{arg in; FreeVerb.ar(in,mix:SinOsc.kr(0.25).range(0.3,0.7),room:1,add:in)};
// ~n[31]=\filter->{arg in;
)


(
~k.play;
~k.fadeTime=1;

~k.quant=1;
~k.clock=TempoClock(60/60).permanent_(true);
~k[0]=Pbind(\instrument, \pitch,
	\dur,6,
	\legato, 1.2,
	\octave, Pseq([Pn([2,3],1), Pn(3,2), Pn([4,3],4), Pn([6,5],2)],inf),
	\degree,[6,4,8],
	\strum, Pseq([4,2,1],inf),
	\amp, 0.5,

);
~k[30]=\filter->{arg in; AllpassN.ar(in,0.2,0.2)};
~k[31]=\filter->{arg in; FreeVerb.ar(in,mix:SinOsc.kr(0.125).range(0.3,0.7),room:1,add:in)};
~k[32]=\filter->{arg in; OnePole.ar(in,0.5,add:Dust.ar(12)*Decay.kr(Dust.kr(0.5)))};
~k[33]=\filter->{arg in; GVerb.ar(in,40,maxroomsize:85,add:in)};


)


currentEnvironment.free;
currentEnvironment.postln;
(
~e.play;
~e.fadeTime=1;
~e.quant=1;
~e[0]={
BPF.ar(WhiteNoise.ar(1),XLine.kr(1000,[80,45,80],60),rq:XLine.kr([0.001,0.01,0.1],[0.001,0.01,0.1],60))+
BPF.ar(GrayNoise.ar(1),XLine.kr(10,[80,75,60],60),rq:XLine.kr([1,0.01,0.1],[0.001,0.01,0.1],60))+
BPF.ar(PinkNoise.ar(1),XLine.kr(1000,[40,65,80,20],60),rq:XLine.kr([1,0.01,0.1,1],[0.001,0.01,0.1],60))+
	BPF.ar(BrownNoise.ar(1!2),XLine.kr([10,2,5,3],[8,1,0.5],60),rq:XLine.kr([0.1,0.01,1],[0.001,0.01,0.1],60));};
~e[30]=\filter->{arg in; FreeVerb.ar(in,room:1,add:in)};
~e[31]=\filter->{arg in; in*LFSaw.ar([\f2.kr,\f2.kr+2]).lag(0.02)};
~e[32]=\set->Pbind(\args, [\f2], \dur, Pseq([5,4,2],inf), \f2, Pseq([10,1,5],inf));
~e[33]=\filter->{arg in; GVerb.ar(in,roomsize:140,maxroomsize:150,add:in)};

~e[34]=\filter->{arg in;
	var env;
	env=EnvGen.kr(Env([[0,1,0],[0,0.5,0]],[[0.2,0.8],[0.1,0.9],[0.6,0.4]],\welch),\aTrig.tr);
	in*env;};
~e[35]=\set->Pbind(\args, [\aTrig],\dur, Pseq([0.25,1,0.5],inf),\aTrig, Pseq([1,0,1],inf));
~e[36]=\filter->{arg in; FreeVerb.ar(in,room:2,add:in)};

)