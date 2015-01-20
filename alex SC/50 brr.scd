(

Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;

Ndef(\1, {
	var sig1, sig2, sig3, env, b, damp, fb, env2, beat, freq;

	b=4/3;
	freq=65;
	beat=Impulse.kr([b,b/4]);

	damp=Select.kr(Stepper.kr(Impulse.kr([b/2,b/6]),max:4),[0.1,0.9,0.1,0.5]);

	sig1=Mix.fill(10,
		{ arg i;
			BPF.ar(BrownNoise.ar([1,1,0.5,0.7,0.25,0.45]),LFNoise0.kr(200).range(60,120),LFNoise0.kr(800).range(0.01,i))}
	);
	sig1=Limiter.ar(sig1,0.7);
	sig1=DelayN.ar(sig1,0.4,0.4);
	sig1=GVerb.ar(sig1,1,mul:0.4,revtime:1,damping:damp);
	env=Phasor.kr(Impulse.kr([b/6,b/4]),rate:0.0002);
	sig1=sig1*env;

	fb=Sweep.kr(Impulse.kr([b*40,b*100]),20).range(freq*2,freq);
	sig2=Limiter.ar(Mix.fill(10, {arg i; SinOsc.ar([fb-25, fb-10, fb, fb+10, fb+20, fb+25],[0,i/10*i, i/20*pi])}),0.7);
	env2=Decay2.kr(beat,b/4,b);
	sig2=sig2*env2;



	Mix.new([sig1*0.1]);


}).play;
)

s.scope(2);

1.333/8