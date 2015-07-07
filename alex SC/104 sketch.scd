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
	arg sustain, freq, n, gate=1, amp;
	var sig, env, glitch, fenv;
	glitch=SelectX.ar(n,[
		GlitchBPF.ar(WhiteNoise.ar(0.2),200),
		GlitchHPF.ar(GrayNoise.ar(0.5),800),
		LFPulse.ar(freq*4)]);
	env=EnvGen.kr(Env([0,1,0], [0.1,0.9]),gate:gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq], [sustain*0.04]),gate:gate,timeScale:sustain,doneAction:2);
	sig=SinOsc.ar(fenv)+glitch;
	sig*env*amp;}).add;




)



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
GlitchBPF


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