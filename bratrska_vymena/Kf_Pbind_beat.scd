s.boot;



(

Ndef(\bassline).quant = 2.0;
Ndef(\bassline,{|sp = 1, l = 0.5|
	Splay.ar(
		SinOsc.ar([60,61]) * Decay.ar(Impulse.ar((8*sp)/[1,3,5,8]),l.lag(0.5)).squared;
)}).play;

//////////////

Ndef(\bassline)[1] = \set -> Pbind(
	\dur, 1/2,
	\l,  Pseq([1,1,1,2,1/2,1,2]/2,inf),
	\sp, Prand([1,1,1,1,1/2],inf)
);

/////////////

Ndef(\hiss).quant = 2.0;
Ndef(\hiss,{|sp = 1,hpf = 200,l=0.5,echo=1|
	Splay.ar(
		FreeVerb.ar(
			BPF.ar(
				WhiteNoise.ar(1!2),
				hpf.lag(1/32)) *
			Decay.ar(Impulse.ar((8*sp)/[1,3,5,8]),l.lag(0.5)).squared;
			,echo,1)
)}).play;

////////////

Ndef(\hiss)[1] = \set -> Pbind(
	\dur, 1/4,
	\l,  Pxrand([1,1,1,2,1/2,1,2] / 4,inf),
	\sp, Prand([1,1,1,1,1,2],inf),
	\hpf,Pxrand([1/8,1/4,1/2,2,3,1,8,4,4,10] * 2000,inf),
	\echo, Pxrand([1,1,1,2,1/2,1,2]/8 ,inf),
);

//////////////

t = Tuning.harmonic;
Ndef(\bass).quant = 2.0;
Ndef(\bass,{|mod1 = 1,mod2 = 0.5|
	Splay.ar(
		~t = t.cents.at([1,2,7,11]) / (mod1.lag(0.1) * pi) * mod2;

		FreeVerb.ar(	SinOsc.ar(~t,SinOsc.kr(~t.lag(1)/([1,2,4,8]*8000)).range(-8pi,8pi),mul:LFSaw.kr(1/4).exprange(0.001,0.4));
			,0.133,1)
)}).play;

Ndef(\bass)[1] = \set -> Pbind(
	\dur, 4,
	\mod1, Pseq([1,1,1.5,1,1,2]*16,inf),
	\mod2, Pxrand([1,1,2,1,1,4]*4,inf),
);
)



