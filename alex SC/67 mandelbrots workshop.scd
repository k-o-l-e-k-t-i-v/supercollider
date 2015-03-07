GlitchHPF
JPverb
Greyhole
AntiAliasingOscilators

{ BlitB3.ar(XLine.kr(10000, 20, 10), 0.5) }.play;
s.scope(2);

BatUGen

{DFM1.ar(SinOsc.ar(800!2)*Decay2.kr(Impulse.kr(0.5),decayTime:1),4000,0.1)}.play;

{SinOsc.ar({Rand(80.0,800.0)}!8).lag(0.02).sum!4*0.2}.play

{Saw.ar({Rand(80.0,800.0)}!8).lag(0.02).sum!4*0.2}.play
{LFSaw.ar({Rand(80.0,400.0)}!8).lag(0.02).sum!4*0.2}.play;
{Pulse.ar({Rand(80.0,800.0)}!8).lag(0.02).sum!4*0.2}.play;

(
Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;
Ndef(\1, {
	var f,b,f2, sig, env;
	b=4;

	env=Decay2.kr(Impulse.kr([b/8,b/4]),0.7,b+2);
	f=Duty.kr(Dseq([b,b/2,b,b/4,b,b*2],inf),0,Dseq([50,800,200,200,400],inf));
	f2=Duty.kr(b/2,0,Dseq([600,1000,220,800],inf));


	sig=LFSaw.ar({LFNoise2.kr(500).range(80,f)}!8).lag(0.2).sum!2*env;
	// sig=SinOsc.ar({LFNoise2.kr(5000).range(80,f)}!8).lag(0.2).sum!2*env;
	// sig=LFSaw.ar({Rand(80.0,f2)}!8).lag(0.02).sum!2*env;
	// sig=DFM1.ar(sig,f*2,add:sig);
	// sig=SinOsc.ar(f2);

	sig=Limiter.ar(sig,1);


}).play;
)