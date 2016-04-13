s.boot;
s.scope;

(
Ndef(\bass).quant = 2.0;
Ndef(\bass).fadeTime = 2.0;

Ndef(\bass,{
	var rythm,sel,freq,dec;
	Splay.ar(
	rythm = [1,2,3,5,8,13,21,34,55,89,144];
	sel = Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,3,5])),1/[1,2,4,1,2,4,1,2,4,2,4]);
	freq = [25,30,34,39,44,49,54,58,63,68,73,78,82,87].midicps.scramble*(sel).lag(0.01);
	dec = Decay.ar(Impulse.ar(4/rythm),rythm/2);

	Limiter.ar(
		Resonz.ar(
			SinOsc.ar(freq + SinOsc.kr(freq/21,mul:0.2).range(-1.midiratio,1.midiratio),SinOsc.kr(freq/96).range(0.2,1.0)) * dec

			,freq) +
		(LFCub.ar([25,30].midicps,mul:0.4) * Decay.ar(Impulse.ar(8/[1,2,3,5]*sel,[1,2,3,5]/1))) +

		(PinkNoise.ar(0.2!4) * Decay.ar(Impulse.ar(2/rythm/sel,rythm/144)))

	)
)}).play;
)