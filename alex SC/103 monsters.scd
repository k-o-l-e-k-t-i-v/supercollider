p=ProxySpace.push(s);

(
ProxySynthDef(\bur, {
	arg amp, sustain, freq, gate=1;
	var sig, env, fn;
	env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	fn=EnvGen.kr(Env.new([0.001, 0.2, 0.1], [sustain*0.4, sustain*0.1],\step),gate);

	sig=BPF.ar(
		PinkNoise.ar(1!4)+WhiteNoise.ar(1!4),
		freq:[freq, freq+[2,4,6,8], freq+[12,18,24]],
		rq:LFNoise0.kr(2).range(0.0001,0.00001));
	// sig=sig+(GrayNoise.ar(fn!4)*LFSaw.ar(\f2.kr*2*0.1));
	sig*env*amp;
}).add;

ProxySynthDef(\ts, {
	arg sustain,gate=1, freq, f2,b, amp,pos;
	var sig, env,fenv, fn, noise;

	env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	fn=EnvGen.kr(Env.new([0.001, 1,0], [sustain*0.4, sustain*0.01],\step),gate);
	fenv=EnvGen.kr(Env([freq*2, freq], [sustain*0.04], \welch),gate);
	/*noise=SelectX.ar(b,[
		WhiteNoise.ar(fn),
		GrayNoise.ar(fn),
		PingPong.ar(fn)]);
	*/
	sig=Pan2.ar(SinOsc.ar(fenv)+(WhiteNoise.ar(fn)*LFSaw.kr(f2)),pos);
	sig*env*amp;}).add;


ProxySynthDef(\ll, {
	arg sustain, gate=1, amp, freq;
	var sig, env, fenv,fn;
	env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*5, freq], [sustain*0.04],\welch),gate);
	fn=EnvGen.kr(Env.new([0.001, 0.5, 0.1], [sustain*0.4, sustain*0.1],\step),gate);
	sig=Mix.fill(20, {arg i; SinOsc.ar(fenv!4+i,add:WhiteNoise.ar(fn).clip(0.1,0.4)*LFSaw.kr(\f2.kr))})*env;
	Limiter.ar(sig,0.4)*env*amp;}).add;


ProxySynthDef(\ki, {
	arg sustain,  freq, amp, gate=1;
	var sig, fenv, env;

	env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*5, freq, freq*8,freq], [sustain*0.04, sustain*0.5,sustain*0.05],\welch),gate);
	sig=LFSaw.ar(fenv!4).clip(-0.5,0.5).lag(0.02)+WhiteNoise.ar(8!4);
	sig=Resonz.ar(sig,fenv, 0.5)*env*amp;
}).add;

ProxySynthDef(\saz, {
	arg sustain,  gate=1,amp, freq, lag;
	var sig, env, fenv,lenv;

	env=EnvGen.kr(Env(times:[0.1,0.9],curve: \welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env(freq*[1.2,1], sustain*[0.1],[\sin, \step]),gate);
	lenv=EnvGen.kr(Env(lag*[0.1,1], [sustain*0.4],\welch),gate);
	sig=Pan2.ar(Lag.ar(LFSaw.ar(fenv),lenv), SinOsc.kr(\f2.kr));

	sig=sig*env*amp}).add;


ProxySynthDef(\bum, {
	arg sustain, freq, amp, voln, top;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*top, freq],[ sustain*0.04], [\welch]));
	sig= SinOsc.ar(fenv!2,add:LPF.ar(Dust.ar(voln).lag(0.0002),2000));
	sig*env*amp;

}).add;

)

)
s.inspect;
s.freeAll;
s.queryAllNodes;

(~y.play;
~y.fadeTime=1;
~y.quant=1;
~y.clock=TempoClock(60/60).permanent_(true);
~y[0]=Pbind(\instrument, \ts,
	\dur, Pseq([1,Rest(1), 1, Rest(1.75),0.5,0.25,Rest(1)],inf),
	\octave,Pseq([Pn([3,2],14),Pn([4,2],4),Pn([5,3],3)],inf),
	\degree, [6,8,4],
	\pos, Pseq([1,-1],inf),
	\b, Pseq([0,1,2],inf),
	\amp, 0.7,
	\f2, Pseq([8,4,20,15,2],inf),
);
~y[30]=\filter->{arg in; FreeVerb.ar(in,room:1,add:in)};
)


(~x.play;
~x.fadeTime=1;
~x.quant=1;
~x.clock=TempoClock(60/60).permanent_(true);
~x[0]=Pbind(\instrument, \bur,
	\dur, 10,
	\strum, 2,
	\octave, Pseq([[4,3],[2,5]],inf),
	\degree, [2,4,3,4],
	\legato, 0.8,
	\amp, 280);
~x[30]=\filter->{arg in; FreeVerb.ar(in,room:2,add:in)};
)

(
~w.play;
~w.fadeTime=1;
~w.quant=1;
~w[0]=Pbind(\instrument, \bur,
	\dur, 4,
	// \f2, 2,
	\octave, Pseq([4,6,5,7,6],inf),
	\degree,[4,3,2,4],
	\strum ,4,
	\amp, 30,

);
~w[30]=\filter->{arg in; FreeVerb.ar(in,room:0.5,add:in)};
// ~w[31]=\filte-> {arg in;
)
~w.stop;
~w.clear;
~d.stop;
~d.clear;
(
~d.play;
~d.fadeTime=1;
~d.clock=TempoClock(60/60).permanent_(true);
~d.quant=1;
~d[0]=Pbind(\instrument, \ki,
	\dur, 6,
	\legato, 0.1,
	\octave, 3,
	\degree,[2,6,4,8],
	\amp, 0.1

);
~d[30]=\filter-> {arg in; GVerb.ar(in,roomsize:120,add:in)};
)
// ~w[30]=\filter->{arg in; GVerb.ar(in,1.2,3)};
)
s.netAddr;
~w.clear;
~r.clear;
(
~r.play;
~r.fadeTime=1;
~r.quant=1;
~r.clock=TempoClock(60/60).permanent_(true);
~r.mold(4);
~r[0]=Pbind(\instrument, \ll,
	\dur, Pseq([Rest(4),1,0.25],inf),
	\octave, Pseq([Pn([2,3],14),Pn([4,3],14),Pn([2,5],7)],inf),
	\degree, [3,5,7],
	\legato, 0.8,
	\f2, [2,1],
	\amp, 1
);
~r[30]=\filter->{arg in; FreeVerb.ar(in, room:2,add:in)};
~r[31]=\filter->{arg in; CombN.ar(in,maxdelaytime:0.5,delaytime:0.5,decaytime:1)};
)

~h.clear;
(
~h.play;
~h.fadeTime=1;
~h.clock=TempoClock(60/60).permanent_(true);
~h[0]=Pbind(\instrument, \saz,
	\dur, Pseq([3,2,6,4],inf),
	\legato, Prand([1,1.5,1.2],inf),
	\f2, Pseq([0.25,0.5,2],inf),
	\octave, Pseq([[3,4,5],[4,3,2],4],inf),
	\degree, Pseq([[5,3],6,[2,8],4],inf),
	\lag, Pseq([Penv([0.4,0.1,0.005

	],[4,2]),0.02,0.4],inf),
	\amp, Pseq([Pseries(0.1,0.2,4),0.4],inf)
	);
~h[30]=\filter-> {arg in; FreeVerb.ar(in,mix:0.3,room:2,add:in,damp:0.8)};
// ~h[31]=\filter-> {arg in; AllpassN.ar(in,0.5,0.5,decaytime:1)};
~h[32]=\filter-> {arg in;  Resonz.ar(in,\rez.kr,add:in)};
~h[33]=\set-> Pbind(\args, [\rez], \dur, Pseq([4,6,8],inf), \rez, Pseq([400,200,500],inf));
)


~c.clear;
(
~c.play;
~c.fadeTime=1;
~c.quant=1;
~c.clock=TempoClock(180/60).permanent_(true);
~c[0]=Pbind(\instrument, \bum, \dur, Pseq([2,4],inf), \legato, 0.5, \freq, [75,65,45],\voln, 7000, \top, 4, \amp, 0.3);
~c[30]=\filter-> {arg in;  FreeVerb.ar(in,room:\room.kr,damp:\damp.kr,add:in)};
~c[31]=\set-> Pbind(\args, [\room, \damp], \dur, 2, \damp, Pseq([Penv([0.8,0.1],[7]),0.1],inf),
	\room, Pseq([Penv([2,0.2],[7]), 0.4],inf));
)

~b.clear;

(
~b.play;
~b.fadeTime=1;
~b.quant=1;
~b.clock=TempoClock(240/60).permanent_(true);
~b[0]=Pbind(\instrument, \bum, \dur, Pseq([4, Rest(0.25), 0.5,0.25,Rest(0.25),0.25],inf), \legato, 0.2, \degree,[2,4,6],\octave, 3,\voln, 70, \top, 7, \amp, 0.2);
~b[30]=\filter-> {arg in;GVerb.ar(in,roomsize:50,damping:0,taillevel:1,revtime:SinOsc.kr(0.5).range(4,0.1),add:in)};
)


(
~i.play;
~i.fadeTime=1;
~i.quant=1;
~i.clock=TempoClock(60/60).permanent_(true);
~i[0]=Pbind(\instrument, \bur,\dur, Pseq([2,4,3],inf),
	\octave, [4,3,5],
	\degree, Pseq([4,6,[8,5],4,5,[4,2]],inf), \strum, 2, \amp, 400);
~i[30]=\filter-> {arg in; FreeVerb.ar(in,room:2)};
)