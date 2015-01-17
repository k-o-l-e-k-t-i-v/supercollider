
(

Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;

Ndef(\2, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:3),[75,85,95]);
	~beat=Select.kr(Stepper.kr(Impulse.kr(0.25),max:3),[3,2,1]);
	~sig=SinOsc.ar([~freq,~freq+0.5887],(1pi..2pi))*Decay2.kr(Impulse.kr([~beat,2]),0.5,decayTime:1);
	// ~sig=Normalizer.ar(~sig,0.8);


}).play;

)


s.scope(2);

(

Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;

Ndef(\1, {

	~sig=GrainFM.ar(2,

		trigger:Impulse.kr([1,8]),
		dur:0.1,
		carfreq:LFSaw.kr(LFNoise0.kr(1).range(8,15)).range(400,3000).range(200),
		modfreq:LFNoise0.kr(0.25).range(50,4),

	mul:2);
	~sig=Limiter.ar(~sig, 0.5);

	~sig=FreeVerb.ar(~sig,room:10)*Decay2.kr(Impulse.kr(6),0.8,0.1);
	// ~sig=Normalizer.ar(~sig,0.5);
	~sig=CombN.ar(~sig,0.5,2,30);


}).play;

)

(

Ndef(\3).fadeTime=2;
Ndef(\3).quant=2;

Ndef(\3, {

	~sig=WhiteNoise.ar*Pulse.ar([0.25,0.25],0.1);
	~sig=GVerb.ar(~sig,50);



}).play;

)



(
{

	Ndef(\1).play;

	2.wait;

	Ndef(\2).play;

	1.wait;

	Ndef(\3).play;

	4.wait;

	Ndef(\2).clear;

}.fork;

)