(
SynthDef(\r1, {
	arg gate=1, freq=85,sustain=1,amp=1,wide,rqq=0.001, room, tail;
	var sig, env,rq;
	rq=EnvGen.kr(Env.new([0.001,0.02,tail],[sustain*0.1,sustain*0.9]),gate);

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.2,0.7,sustain*0.7),gate);
	sig=BPF.ar(GrayNoise.ar(amp!2),[freq,freq+2],rq);
	sig=sig*env;
	sig=FreeVerb.ar(sig,room:room,damp:1);
	DetectSilence.ar(sig,doneAction:2);
	Out.ar(0,sig);
}).add;
)

(
Pdef(\r1,
	Pbind(
		\instrument, \r1,
		\dur, Pseq([Pn(0.15,10),1, Rest(1)],inf),
		\room, Pseq([Pn(0,10),1.5, Rest(1)],inf),
		\amp, Pseq([Pn(2,10),0.7, Rest(1)],inf),
		\legato, Pseq([Pn(0.9,10),1, Rest(1)],inf),
		\tail, Pseq([Pn(1,10),1, Rest(1)],inf),
		\freq, Pseq([Pn(85,6),Pn(65,4),84,Rest(1)],inf),
)).play;
)


p=ProxySpace.push(s);
(
~w={var b,noise, s1,t, add,rq, beat, s2,s3,s4,f;

	b=0.5;
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