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



	Mix.new([sig1*0.5, sig2]);


}).play; ////////// j_Wow
)

s.scope(2);

1.333/8

(
{
	Mix.fill(10,
		{CombN.ar(Pulse.ar(1),0.5,1/45,10)})}.play;
)

(
{
	Limiter.ar(Mix.fill(10,{arg i; SinOsc.ar([(1450..1450.8)],[(0..i)])}),0.8)*
	Decay2.kr(Impulse.kr([0.25,0.5]),0.1,0.1)}.play;
)

(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;
Ndef(\2,{

	var x,y,z,ex, ey, ez, b, freq;

	b=4/3;  //0.666, 1.333, 2.666 etc

	freq=Duty.kr( Dseq([b*4,b*2,b,b*2],inf),0, Dseq([45,60,Drand([50,85],1), 75],inf));


	ex=Decay2.kr(Impulse.kr([b/4,b/2]),0.1,0.5);
	ey=Decay2.kr(Impulse.kr([b*2,b*8]),0.1,0.2);
	ez=Decay2.kr(Impulse.kr([b*4,b]),0.01,0.1);

	x=Limiter.ar(Mix.fill(10,{arg i; SinOsc.ar([freq,freq+0.8],[(0..i)])}),0.2);
	y=Limiter.ar(Mix.fill(10,{arg i; SinOsc.ar([freq-15,freq-14],[(0..i)])}),0.2);
	z=Limiter.ar(Mix.fill(10,{arg i; SinOsc.ar([freq*1200,freq*1200+1],[(0..i)])*GrayNoise.ar(0.2)}),0.02);


	Mix.new([x*ex,y*ey,GVerb.ar(z*ez*0.5,10)]);



}).play;
)