
p=ProxySpace.push(s);

(

ProxySynthDef(\bum2, {
	arg sustain, amp, voln, f2;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\freq.kr*4,\freq.kr],[sustain*0.04]),\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!2,
		add:HPF.ar(WhiteNoise.ar(voln).clip(0.05,0.1),Saw.kr(2).range(11000,f2))

	)*env*amp;
}).add;


ProxySynthDef(\ripple, {
	arg  sustain=1, freq=40,f2, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq], [sustain*0.05],\welch));

	sig=BPF.ar(GrayNoise.ar(amp),fenv,SinOsc.kr(f2).range(0.001,1))*env;
	sig=Limiter.ar(Pan2.ar(sig,SinOsc.kr(f2)),0.7)*env*amp;

}).add;

ProxySynthDef(\dfm, {
	arg  sustain=2, freq=100, amp=1, lag=0.0002,res;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),doneAction:2);
	sig=LFSaw.ar([freq, freq+2, freq+4], [0,pi,2*pi]);
	sig=Fold.ar(sig,0,0.6).lag(lag);
	sig=DFM1.ar(sig,SinOsc.kr(0.25).range(freq,freq+10),res:res,
		noiselevel:SinOsc.kr(0.125).range(0.0041,0.00008))-0.5;
	Out.ar(0, sig*env*amp);

}).add;


ProxySynthDef(\sin, {
	arg gate=1, sustain=1, freq=440, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.2,0.7,sustain*0.5),gate,doneAction:2);
	sig=SinOsc.ar(freq*(1..8))*env*amp;

}).add;


ProxySynthDef(\tictum, {
	arg sustain=0.2, freq=1000, amp=1;
	var sig, env,fenv;


	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),doneAction:2);
	fenv=EnvGen.kr(Env([freq*10,freq], [sustain*0.8],\welch));

	sig=BPF.ar(LFSaw.ar(20).lag(0.002),fenv,0.5,mul:SinOsc.kr(50).range(0.2,0.8));
	sig=HPF.ar(CombN.ar(sig,maxdelaytime:0.1,delaytime:0.1,decaytime:sustain*0.5),800);
	sig=Pan2.ar(sig,SinOsc.kr(0.5))*amp;
}).add;


ProxySynthDef(\woosh, {
	arg sustain=0.2, freq=3000, amp=1,f2;
	var sig, env,fenv;
	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),doneAction:2);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain],\welch));

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(f2).range(0.2,0.8));
	sig=HPF.ar(sig,16000).clip(-0.3,1);
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig*env,SinOsc.kr(f2))*amp;
}).add;



)

////beat grill party
(
~t.clock=TempoClock(60/60).permanent_(true);
~t.play;
~t.quant=2;
~t[0]=Pbind(
		\instrument, \ripple,
		\dur, 0.5,
		\freq,Pseq([8000,600,Pn(800,2),140],inf),
		\amp, 0.8,
		\legato,0.5,
		\f2,0.5,
);
~t[30]=\filter -> {arg in; FreeVerb.ar(in,mix:SinOsc.kr(1).range(0.3,1),room:2,damp:1,add:in)};  //better with damp 0
)
~t.free;


//////HAT WITH ECHO
(
Pdef( \lopwoosh,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([0.5,Rest(1.5)],inf),
		\freq,10000,
		\legato, 2,
		\f2, Pseq([Pseries(2,4,5),Pseries(10,-2,3)],inf),  ///rythmical
		\amp, 1
)).play(quant:2);
)
Pdef( \lopwoosh).stop;

(
Pdef( \lopwoosh1,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([1,Rest(1)],inf),       //very simple
		\freq,6000,
		\legato, 0.6,
		\amp, 0.8,
		\f2, 5,
)).play(quant:2);
)
Pdef( \lopwoosh1).stop;

///////beat
(
~b1.clock=TempoClock(120/60).permanent_(true);

~b1.quant=2;
~b1.play;
~b1.mold(4);
~b1[0]=Pbind(
	\instrument, \bum2,
	\dur, Pseq([0.25,0.25,0.25,0.25, Rest(0.25), 0.25, Rest(0.5)],inf),
	\legato, 1,
	\voln, Pseq([
		Pseq([Pn(0,7)],2),
		Pseq([0,0.2,0,0,0,0.1,0],4),
		Pseq([0,0.2,0,0.1,0,0.3,0],4),
		Pseq([0,0.6,0,0,0,0.5,0],2)],inf),
	\f2, Pseq([Pn(4000,14), Pn(8000,7)],inf),
	\amp, 0.3, //dont touch this
	\octave,2,
	\degree, Pseq([2,2,7,5,8],inf),
);
~b1[30]=\filter -> {arg in; FreeVerb.ar(in,room:1,damp:0.1,add:in)};

)
~b1.stop;
~b1.clear;

///////////////ASTRAL AS FUCK

(
~a.quant=1;
~a.play;
~a[0]=Pbind(
		\instrument, \sin,
		\dur,4,
		\octave, Pseq([5,6,7,5,6],inf),
		\note, [1,5,7,9],
		\strum,0.45,
		\amp, 0.008,
		\legato,2,
);
~a[30]=\filter -> {arg in; FreeVerb.ar(in,room:0.25,damp:1,add:in)};
)
~a.stop;
~a.clear;



//////////DRONE////////
(
~d.quant=1;
~d.play;
~d[0]=Pbind(
		\instrument, \dfm,
		\dur, 4,
	// \strum, 1,
		\octave, Prand([[4,3],[5,2],[4,3],[4,4]],inf),
		\notes, Prand([[1,5,7],[6,4,8],Prand([[2,5],[1,3],[2,4]],2)],inf),
		\legato,1.2,
		\lag, 0.002,
		\res, Prand([1,0.5,1.2,1.4,0.2],inf),
		\amp, 0.02,   //not bigger than 0.05
);
)
~d.stop;
~d.clear;


/////////////TIC TUM

(
~y.play;
~y.quant=2;
~y[0]=Pbind(
		\instrument, \tictum,
		\dur, Pseq([3,Rest(12)],inf),
		\freq, Pseq([Pn(100,4),Pn(500,2)],inf),  //////
		\amp, 0.5,
		\legato, 1.2,
);
~y[30]=\filter -> {arg in; FreeVerb.ar(in,room:2,damp:0,add:in)};
)
~y.stop;
~y.clear;



//////////////////PIANO
(

SynthDef(\piano1, { |out=0, freq=440, gate=1,sustain=1, amp=1|
	var sig = MdaPiano.ar(freq, gate,decay:sustain*0.5,release:sustain*0.4, release: 0.9, stereo: 0.3, sustain: 0);
	DetectSilence.ar(sig, 0.01, doneAction:2);
	Out.ar(out, sig * 0.1);
}).add;
)


(
Pdef(\piano,
	Pbind(
		\instrument, \piano1,
		\octave, Pseq([3,3,4,2,3,6,5,2],inf),
		\note, [1,5,7,1,3],
		\dur,2,
		\strum, 0.75,
		\amp, 1,
)).play;
)
Pdef(\piano).stop;


(
Pdef(\piano2,
	Pbind(
		\instrument, \piano1,
		\octave, Pseq([6,7,4,5,6,5, Pn(6,2), Pn(4,2),Pn(2,2)],inf),
		\note, [1,3,7,5,3,7],
		\dur,2,
		\strum, 0.75,
		\amp, 0.1,
)).play;
)
Pdef(\piano2).stop;




///final monologue

p=ProxySpace.push(s);
(
~w={var b,noise, s1,t, add,rq, beat, s2,s3,s4,f;

	b=0.5;        //increase b in 5 min (line)
	t=Impulse.kr([b,b/2]);
	rq=Decay.kr(t,b/10).range(1.1,0.01);

	noise=[PinkNoise.ar(0.1),
		BrownNoise.ar(0.2),
		WhiteNoise.ar(1).clip(0.7,1)
	];
	add=SelectX.ar(Stepper.kr(Impulse.kr(b/2),0,max:2),noise);
	beat=Duty.kr(Dseq([b,b*4],inf),0,Dseq([b,b/2],inf));
	f=Duty.kr(b,0,Drand([6000,200,800,1100,15000],inf));

	s1=SinOsc.ar(45*[1.25,1.35,1.65],add:add)*LFSaw.ar([b,beat]).lag(0.02);//rough !!LFSaw env **
	s1=FreeVerb.ar(s1,room:1);

	s2=BPF.ar(BrownNoise.ar(1),LFNoise0.kr([b/2,b/4,b/8,b]).range(85,405),0.001); //nope

	s3=SinOsc.ar(Decay.kr(Impulse.kr([b,b*2]),b*0.2).exprange(1,285)+65!2);//beat
	s3=s3*Decay2.kr(Impulse.kr([b,b*2]),decayTime:b/4);

	s4=BPF.ar(WhiteNoise.ar,f,rq)*Decay2.kr(t,decayTime:b/5); //high
	s4=CombN.ar(s4,b/4,b/4,b);


	Mix.new([Limiter.ar(s1+(s3*0.5)+s4,0.5)]);

};
~w.play;
)