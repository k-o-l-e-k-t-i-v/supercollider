p=ProxySpace.push(s);


//vrum

~vrum.clock=TempoClock(120/60).permanent_(true);
~vrum.play(vol:0.6, fadeTime:2, numChannels:1).quant_(4);
(
~vrum[0]={
	var sig,env, fenv;

	env=EnvGen.kr(Env([0,1,0],[4.9,0.001],\welch),\trig.tr);
	fenv=EnvGen.kr(Env([0.25,45,0.25],[3,0.001]),\trig.tr);

	sig=PinkNoise.ar([0.1,0.5])+BrownNoise.ar([0.2,0.3]);
	sig=sig*LFSaw.ar(fenv);
	sig=sig*env;


});
~vrum[1]=\set-> Pbind(\args, [\trig], \dur,10, \trig, 1);
~vrum[2]=\set-> Pbind(\args, [\freq], \dur,4, \freq, 45);

~vrum[27]=\filter->{arg in;Pan2.ar(Mix.ar(in),SinOsc.kr(0.5))};
~vrum[28]=\filter->{arg in; GVerb.ar(in,[80,40,120],[12,8])};
~vrum[29]=\filter->{arg in; LPF.ar(in,8400)};



//asaw1

~saw1.clock=TempoClock(120/60).permanent_(true);
~saw1.play(vol:0.3, fadeTime:2).quant_(2)|;
(
~saw1[0]={
	var sig, sig2,env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.5],\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],[0.01,0.02]),\trig.tr);

	sig=SinOsc.ar([fenv,fenv]+fib(4).reciprocal);
	sig2=GrayNoise.ar([0.1,0.05])*Decay2.ar(Impulse.ar(8),decayTime:0.1);
	sig=(sig+sig2)*env;


});
~saw1[1]=\set-> Pbind(\args, [\trig], \dur,2, \trig, 1);
~saw1[2]=\set-> Pbind(\args, [\freq], \dur,4, \freq, 45);

~saw1[28]=\filter->{arg in; GVerb.ar(Splay.ar(in),80,[4,8],mul:0.7,add:in)};
~saw1[29]=\filter->{arg in; LPF.ar(in,8400)};



//asaw2

~saw2.clock=TempoClock(160/60).permanent_(true);
~saw2.play(vol:0.5, fadeTime:2).quant_(4);
(
~saw2[0]={
	var sig,env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.2],\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*[4.8],\freq.kr],[0.01,0.02]),\trig.tr);

	sig=SinOsc.ar([fenv,fenv+2]+fib(4).reciprocal)+(GrayNoise.ar([0.2,0.1])*Decay2.ar(Impulse.ar(12),decayTime:0.1));
	sig=sig*env;

});
(
~saw2[1]=\set-> Pbind(\args, [\trig],
	\dur,Pseq([Pn(0.2,4),Rest(0.2),Pn(0.2,3),Rest(0.2)],inf),
	\trig, 1);
)
~saw2[2]=\set-> Pbind(\args, [\freq], \dur,Pkey(\dur*2), \freq,85);

~saw2[28]=\filter->{arg in; GVerb.ar(Splay.ar(in),40,[0.1,0.22],mul:0.7,add:in)};
~saw2[29]=\filter->{arg in; LPF.ar(Limiter.ar(in),2400)};



~q[1]={FreeVerb.ar((BrownNoise.ar([0.1,0.4])*LFSaw.ar([0.0125,0.025]))*LFSaw.ar(Decay.ar(Impulse.ar(0.125),4).range(40,1)),[0.5,0.6], [0.5,1])};
~q.play;
~q.free;


//asaw3

~saw3.clock=TempoClock(120/60).permanent_(true);
~saw3.play(vol:0.1, fadeTime:2).quant_(2);
(
~saw3[0]={
	var sig,sig2,env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.2],\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr],[0.01,0.02]),\trig.tr);

	sig=SinOsc.ar([fenv,fenv+2]+fib(4).reciprocal);
	sig2=CombN.ar(PinkNoise.ar([0.01,0.05])*Decay.ar(Impulse.ar(8),0.4),4,0.5);
	sig2=HPF.ar(sig2, 4000);
	sig=sig+sig2;
	sig=sig*env;
});
(
~saw3[1]=\set-> Pbind(\args, [\trig],

	\dur,Pseq([0.2,0.1, Rest(0.7)],inf),
	// \dur, Pseq([Pseq([0.2,0.1, Rest(1.8)],4),Rest(2)],inf),

	\trig, 1);
)
~saw3[2]=\set-> Pbind(\args, [\freq], \dur,1, \freq, 45);
~saw3[28]=\filter->{arg in; GVerb.ar(Splay.ar(in),80,[4,2],mul:0.7,add:in)};
~saw3[29]=\filter->{arg in; LPF.ar(Limiter.ar(in),\lpf.kr(5500))};


//row

~row.clock=TempoClock(120/60).permanent_(true);
~row.play(vol:0.8, fadeTime:2).quant_(2);
(

~row[0]={
	var sig,sig2,env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.2],\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr],[0.01,0.02]),\trig.tr);

	sig=BPF.ar(PinkNoise.ar([0.5,0.6]),LFNoise0.kr(8).range(1000,50))*VarSaw.ar(SinOsc.ar(0.5).range(20,1));
	sig=sig+(Clip.ar(GrayNoise.ar(0.3),0.2,1)*Decay.ar(Impulse.ar([10,5]),decayTime:0.1));
	sig=sig+Dust.ar(5);
	sig=sig*env;
});
(
~row[1]=\set-> Pbind(\args, [\trig],

	\dur,1,
	\trig, 1);

)
~row[2]=\set-> Pbind(\args, [\freq], \dur,1, \freq, 45);
~row[28]=\filter->{arg in; GVerb.ar(Splay.ar(in),80,mul:0.7,add:in)};
~row[29]=\filter->{arg in; LPF.ar(Limiter.ar(in),\lpf.kr(4200,2))};


//wrap



~wrap.clock=TempoClock(130/60).permanent_(true);
~wrap.play(vol:0.8, fadeTime:2, numChannels:2).quant_(2);
(

~wrap[0]={
	var sig,sig2,env, fenv;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.1],\welch),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*6,\freq.kr],[0.01,0.02]),\trig.tr);

	sig=SinOsc.ar([44,44])*SinOsc.ar([0.125,0.25]);
	sig2=BPF.ar(WhiteNoise.ar([0.5,0.8])!2,fenv,0.1,8);
	sig2=sig2*env;


});
(
~wrap[1]=\set-> Pbind(\args, [\trig],

	\dur,Pseq([Pn(0.15,5),Rest(0.15), Pn(0.15,4), Rest(0.15*2)],inf),
	\trig, 1);
)
~wrap[2]=\set-> Pbind(\args, [\freq], \dur,1, \freq, 45);

~wrap[28]=\filter->{arg in; GVerb.ar(Splay.ar(in),80,mul:0.7,add:in)};
~wrap[28]=nil;
~wrap[29]=\filter->{arg in; BPF.ar(Limiter.ar(in),LFSaw.ar([0.25,0.5]).range(4000,50))};