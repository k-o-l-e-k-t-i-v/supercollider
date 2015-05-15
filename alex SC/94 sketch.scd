p=ProxySpace.push(s);
s.plotTree;

(
ProxySynthDef(\pulse, {
	arg sustain, amp;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\n.kr,[WhiteNoise.ar(0.35!2),PinkNoise.ar(0.7).softclip(0.5,1), BrownNoise.ar(0.3)]);

	env=EnvGen.kr(Env([0,1,0],[0.25,0.75],\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\freq.kr,\f2.kr],[sustain*0.1],\welch),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(fenv,iphase:0.7)*BPF.ar(noise,fenv,add:noise*0.5)*env*amp;
}).add;


ProxySynthDef(\voice, {
	arg  sustain, amp;
	var sig, env;
    env=EnvGen.ar(Env.perc(sustain*0.25,sustain*0.75),doneAction:2);
	sig=Mix.fill(10,
		{ arg i;
    BPF.ar(
        PinkNoise.ar(Array.fill(4,{arg i; i/10+0.5})),
        freq:LFNoise0.kr(10).range(\freq.kr, \freq.kr+i),
        rq:LFNoise0.kr(20).range(0.001,i/10))
    })*env*amp;
	sig=PitchShift.ar(sig,SinOsc.kr(2).range(0.2,1.2))
}).add;

)






(
~d.play(fadeTime:2);
~d.quant=2;

~d[0]=Pbind(\instrument, \pulse,
	\dur, 8,
	\legato, 0.7,
	\freq, 10,
	\f2, 1,//Penv([0,200,10],[Pkey(\dur)*0.01,Pkey(\dur)*0.99]),
	\n, Pseq([0,1,2],inf),
	\amp, 0.3);
~d[1]=\filter-> {arg in; GVerb.ar(in,roomsize:150,revtime:3,
	spread:SinOsc.kr(\mix.kr).range(10,50))};
~d[2]=\set->Pbind(\args, [\mix], \mix, 0.25);
~d[3]=\filter->{arg in; LPF.ar(in,200)+in};
)

(
~v.play(fadeTime:2);
~v.quant=6;
~v[0]=Pbind(\instrument, \voice,
	\dur, Pseq([6,4,2,8],inf),
	\legato, 1.5,
	//\freq, [165,168,250,400],
	\octave, Pseq([[3,4], 5, 6,[4,6]],inf),
	\degree, Pseq([Pn([2,4,6],2), [1,3]],inf),
	\amp, 0.7
);
~v[30]=\filter->{arg in; GVerb.ar(DelayN.ar(in),1,0.2)};
~v[31]=\filter->{arg in; FreeVerb.ar(in,room:2)};
)