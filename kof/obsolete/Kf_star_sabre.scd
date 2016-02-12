s.boot;

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;

Ndef(\a,{Splay.ar(
		VarSaw.ar([44,44.1,88.1,88*2,88*1.5,88.1*8]*1.5*4.0+LFNoise0.ar(8!4).lag(1).range(-8,8),0,SinOsc.ar([0.1,0.201,0.04,0.081]/4).range(0.1,0.9),mul:0.33) * LFSaw.ar(1/8/[1,2,3,5,8,13,21]).squared

)}).play;
)

Ndef(\a).stop;


(
Ndef(\zzz).fadeTime = 0.0;
Ndef(\zzz).quant = 2.0;

Ndef(\zzz,{
	var mod;
	mod = Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1,2,1.5,1.25,1.5,2,1,1,1]).lag(0.1);

	Splay.ar(
		Ringz.ar(
			Impulse.ar(1/[1,1/4,1/2]),[88,88/1.5,88/2]*mod,[2,0.5,0.14],mul:0.0133
		) +
	Pan2.ar(
		BPF.ar(
				OnePole.ar(WhiteNoise.ar(0.7!8),SinOsc.kr([0.03,0.08]).range(0.1,0.9)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),{ExpRand()*1}!8)
			,2200+LFNoise0.ar(2!4).range(-400,4000).lag(0.001))
		,SinOsc.kr(2.01))

)}).play;
)

Ndef(\zzz).stop(10);
s.freeAll;
