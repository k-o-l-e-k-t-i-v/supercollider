{SinOsc.ar([84,86])*LFPulse.ar([84,86])}.play;
{SinOsc.ar([84,86])*LFSaw.ar([84,86])}.play;
{SinOsc.ar([84,86])*Saw.ar([84,86])}.play;


{GVerb.ar(Splay.ar(Decay2.ar(Impulse.ar(2/[1,2,8,4,9]),0.01,0.2)*(SinOsc.ar([440,460])*LFPulse.ar([64,66]).lag(0.02)),1,2),[40,100])}.play;

(
{var in;
	in=(GrayNoise.ar(Decay.ar(Impulse.ar(1/[1,2,3,5,8]),0.01).range(1,0.1)))*Decay2.ar(Impulse.ar([2,5]),decayTime:0.02);
	Splay.ar(GVerb.ar(HPF.ar(in,800),20,mul:0.9,revtime:1,drylevel:0.5,maxroomsize:100,add:in));
	CombN.ar(in,40,10,0.5);
	GVerb.ar(in,40,0.1);

}.play;
)


//////////

p=ProxySpace.push(s);
currentEnvironment.clear;

~ts1.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);
~ts1.clock=TempoClock(127/60).permanent_(true);

(
~ts1[0]={
	var sig, env, lpfreq;

	env=EnvGen.kr(Env.perc(0.0001,0.02,curve:\lin),\trig.tr);
	sig=WhiteNoise.ar(1!2)*env;};)

~ts1[1]=\set->Pbind(\args, [\trig], \dur, Pseq(1/[1,2,3],inf), \trig, 1);


~ts1[30]=\filter-> {arg in; CombN.ar(in,4,1.2,1)};
~ts1[31]=\filter-> {arg in; GVerb.ar(in, [20,22],[1,0.2])};
~ts1[32]=\filter->{arg in; HPF.ar(in,\freq.kr)}
~ts1[33]=\set->Pbind(\args, [\freq], \dur, 16, \freq,Pseq([1200,8000,1200,12200],inf));

////////////


~ts2.play(vol:0.2, fadeTime:4, numChannels:2).quant_(4);
~ts2.clock=TempoClock(127/60).permanent_(true);

(
~ts2[0]={
	var sig, env, lpfreq, fenv;

	env=EnvGen.kr(Env.perc(0.0001,0.5,curve:\exp),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr],[0.01,0.8]),\trig.tr);
	sig=LPF.ar((WhiteNoise.ar(1!2)+LFPulse.ar(fenv!2))*env,fenv);};)

~ts2[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Pn(0.2,8),Rest(0.4),Pn(0.2,2),Rest(0.6)],inf), \trig, 1);
~ts2[2]=\set->Pbind(\args, [\freq], \dur,1 , \freq,Pseq([400],inf));


~ts2[31]=\filter-> {arg in; GVerb.ar(in,[42,10],[15,8],mul:SinOsc.kr([0.125/4,0.125/8]).range(0.02,0.2),add:in)};
~ts2[32]=\filter->{arg in; LPF.ar(in,8880)};

///////////////

~noise1.play(vol:0.4, fadeTime:8, numChannels:2).quant_(8);
~noise1.clock=TempoClock(127/2/60).permanent_(true);

(
~noise1[0]={
	var sig, env, fenv;
	env=EnvGen.kr(Env(times:[2,6],curve:\welch),\trig.tr);

	sig=BPF.ar(ClipNoise.ar([0.01,0.02,0.05]),\freq.kr,rq:\rq.kr(0.01),mul:6);
	sig=PitchShift.ar(sig,
		windowSize:0.5,
		pitchRatio:SinOsc.kr([1,4]).range(0.5,3),
		pitchDispersion:0.2,
		timeDispersion:0.1);
};)


~noise1[1]=\set->Pbind(\args, [\trig], \dur, 8, \trig, 1);
~noise1[2]=\set->Pbind(\args, [\freq], \dur,1, \freq,Pseq([400],inf));

~noise1[30]=\filter-> {arg in; GVerb.ar(in,[200,150],mul:0.8,add:in)};


////////////



~test.play(fadeTime:2, vol:0.5).quant_(2);
~test.clock=TempoClock(127/60).permanent_(true);

(
~test[0]={
	var sig, env, freq;

	env=EnvGen.kr(Env(times:[0.01,0.4]),\trig.tr);
	freq=EnvGen.kr(Env([40,240,40],[0.01,0.04]),\trig1.tr);
	sig=if( Impulse.kr(8) , SinOsc.ar(800!2), SinOsc.ar(freq!2) );

	sig=LPF.ar(GVerb.ar(sig,[40,20],[4,6]),5000);
	Limiter.ar(sig,1)*env;
};

)

~test[1]=\set-> Pbind(\args, [\trig], \dur, 4, \trig, 1);
~test[2]=\set-> Pbind(\args, [\trig1], \dur, 12, \trig1, 1);

~test[30]=\filter->{arg in; GVerb.ar(in,[70,80],[2,4])}
};

~test.stop;




~w.play(vol:0.2, fadeTime:2, numChannels:2).quant_(4);
~w.clock=TempoClock(60/60).permanent_(true);

(
~w[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.2,1]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*2,\freq.kr],[0.2,1]),\trig.tr);

	sig=LFSaw.ar(fenv!2)*LFPulse.ar(fenv!2);
	sig=sig*env;

};)

~w[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~w[2]=\set->Pbind(\args, [\freq], \dur, 24, \freq, Pseq([10,11,12,15],inf));

~w[30]=\filter->{arg in; GVerb.ar(in,[10,20],[2,4])};


{Splay.ar(SinOsc.ar([12000,220,800])*Decay2.ar(Impulse.ar(1/[8,4]),decayTime:0.5))}.play;

/////////////////


~g.play(vol:0.7, fadeTime:0.0001, numChannels:2).quant_(1);
~g.clock=TempoClock(60/60).permanent_(true);

(
~g[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.2,0.2]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],[0.01,0.2]),\trig.tr);

	sig=if(Impulse.kr(8),ClipNoise.ar(0.2),WhiteNoise.ar(0.2))*LFPulse.kr(2);
	sig=LFSaw.ar(fenv!2)+sig;

	sig=FreeVerb.ar(sig)*env;

};)

~g[1]=\set->Pbind(\args, [\trig], \dur, Pseq([Pn(0.5,2),1,Rest(0.5), 1, Rest(1),1,Rest(0.5)],inf), \trig, 1);
~g[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([45,47,49],inf));

~g[30]=\filter->{arg in; GVerb.ar(in,[40,20],[2,1])};

~g[31]=\filter-> {arg in; HPF.ar(in,2)};


SystemClock

//////////////


~d.play(vol:0.7, fadeTime:8, numChannels:2).quant_(8);
~d.clock=TempoClock(60/60).permanent_(true);

(
~d[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.02,0.4]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr],[0.01,0.4]),\trig.tr);

	sig=if(Impulse.kr(8),ClipNoise.ar(0.2),WhiteNoise.ar(0.2))*LFPulse.kr(2);
	sig=LFSaw.ar(fenv!2)+sig;

	sig=FreeVerb.ar(sig,room:2)*env;

};)


~d[1]=\set->Pbind(\args, [\trig], \dur,Pbind([Rest(2),1,Rest(5)],inf), \trig, 1);
~d[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([45,55,65],inf));


///////////////




~k.play(vol:0.7, fadeTime:2, numChannels:2).quant_(4);
~k.clock=TempoClock(60/60).permanent_(true);

(
~k[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.02,0.1],[\welch, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr],[0.01,0.4]),\trig.tr);

	sig=(ClipNoise.ar([0.1,0.2])*LFSaw.ar(fenv));
	sig=
	sig=sig*env;

};)


~k[1]=\set->Pbind(\args, [\trig], \dur,2, \trig, 1);
~k[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, 2);

~k[30]=\filter->{arg in; GVerb.ar(in,[80,20],[3,4])};



//////////////

p=ProxySpace.push(s);

currentEnvironment.clear;

~f.stop;
~f.play(vol:0.021, fadeTime:0.0001, numChannels:2).quant_(1);
~f.clock=TempoClock(60/60).permanent_(true);

(
~f[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[4,10],\welch),\trig.tr);

	sig=BPF.ar(ClipNoise.ar(LFNoise0.ar(20).range(0.01,0.8)),freq:\freq.kr+fib(10),rq:LFNoise0.kr(5).range(0.001,0.08));
	sig=FreeVerb.ar(sig,room:1)*env;

};)

~f[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~f[2]=\set->Pbind(\args, [\freq], \dur, 2, \freq, Pseq([200,220,440,800,165,640],inf));

~f[30]=\filter->{arg in; GVerb.ar(in,[2,2],[3,2])};

~f[31]=\filter-> {arg in; HPF.ar(in,2)};

///////////


~h.play(vol:0.06, fadeTime:0.0001, numChannels:2).quant_(1);
~h.clock=TempoClock(127/60).permanent_(true);

(
~h[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.02],\welch),\trig.tr);

	sig=ClipNoise.ar([0.01,0.02,0.05,0.1,0.05]);
	sig=FreeVerb.ar(sig,room:1)*env;

};)

~h[1]=\set->Pbind(\args, [\trig], \dur,Pseq([Pn(0.1,11),Rest(0.9)],inf), \trig, 1);
~h[2]=\set->Pbind(\args, [\freq], \dur, 4, \freq, Pseq([65,64,72,74,65,82,72],inf));

~h[30]=\filter->{arg in; GVerb.ar(in,[40,20],[6,4],add:in)};

~h[31]=\filter-> {arg in; HPF.ar(in,140)};

////////




~x.play(vol:0.02, numChannels:2).quant_(1);
~x.clock=SystemClock;

(
~x[0]={
	var sig,sig1,sig2,sig3, env,env1,env2, fenv;

	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*2,\freq.kr],[12,8]),\trig.tr);

	env=EnvGen.kr(Env([0,1,0],[15,2],\welch),\trig.tr);
	env1=EnvGen.kr(Env([0,1,0],[1,10],\welch),\trig.tr);
	env2=EnvGen.kr(Env([0,1,0],[12,5],\welch),\trig.tr);

	sig=LFSaw.ar(fenv+[20,40]).lag([0.02,0.01])*env;
	sig1=LFSaw.ar(fenv+[60,80]).lag([0.002,0.03])*env1;
	sig2=LFSaw.ar(fenv+[2,400]).lag([0.04,0.01])*env2;

	sig3=Splay.ar([sig*env,sig1*env1,sig2*env*2]);


};)

~x[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~x[2]=\set->Pbind(\args, [\freq], \dur, 20, \octave, Pseq([[3,2],[3,2],[4,3]],inf), \degree, Pseq([[2,4],[3,5,7],[4,8]],inf));

~x[30]=\filter->{arg in; GVerb.ar(in,[10,40,20],[18,19,17])};
~x[31]=\filter-> {arg in; HPF.ar(in,12)};

//////////////


~d.clear;
~d.play(vol:0.2, fadeTime:8, numChannels:2).quant_(8);
~d.clock=TempoClock(127/60).permanent_(true);

(
~d[0]={

	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.02,1]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr],[0.01,0.04]),\trig.tr);

	sig=if(Impulse.kr(8),ClipNoise.ar(0.2),WhiteNoise.ar(0.2))*LFPulse.kr(2);
	sig=LFSaw.ar(fenv!2)+sig;

	sig=FreeVerb.ar(sig,room:2)*env;

};)


~d[1]=\set->Pbind(\args, [\trig], \dur,1, \trig, 1);
~d[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([45,55,65],inf));


