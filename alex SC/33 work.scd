(

Ndef(\work).fadeTime=4;

Ndef(\work).quant=2;

Ndef(\work, {

	~freq=Decay2.kr(Impulse.kr(4)).range(600,12000);
	~beat=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4), [4,2,1]);

	~sig=HPF.ar(BrownNoise.ar(0.7)*Decay2.kr(Impulse.kr([~beat,~beat-1]),0.01,SinOsc.kr(0.5).range(0.01,0.08)),~freq);
	~sig=Normalizer.ar(~sig*Decay2.kr(Impulse.kr(2), 0.4,2),0.4);
	~sig=CombN.ar(~sig, 1,0.2);

}).play;

)

Ndef(\work).clear;


(

Ndef(\wo).fadeTime=3;
Ndef(\wo).quant=1;


Ndef(\wo, {

	~fru=Select.kr(Stepper.kr(Impulse.kr(0.5),max:4), [4,2,8]);

	~fr=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4), [400,200,100]);
	~f=LFPulse.kr(1).range(~fr,~fr*10);

	~sig=VarSaw.ar(~f,0,mul:0.051)*LFPulse.kr(~fru);

}).play;
)

(

Ndef(\1).fadeTime=2;
Ndef(\1).quant=2;

Ndef(\1, {

	~sig=Pan2.ar(HPF.ar(PinkNoise.ar(0.1),SinOsc.kr(0.1).range(850,400))*Decay2.kr(Impulse.kr(1),attackTime:0.2,decayTime:SinOsc.kr(0.25).range(1,0.2)), SinOsc.kr(0.25));

	~sig=GVerb.ar(~sig,200,3,0.5);

}).play;

)

(

Ndef(\2).fadeTime=4;
Ndef(\2).quant=2;

Ndef(\2, {

	~sig=GrainFM.ar(
		2,
		trigger:Impulse.kr(1.5),dur:Select.kr(Stepper.kr(Impulse.kr(0.5),max:3),[0.2,2,1]),
		carfreq:LFNoise0.kr(0.25).range(200,1200),
		modfreq:100,
		mul:0.2
	)* VarSaw.kr(10);

	~sig=GVerb.ar(~sig,150,mul:0.2);

}).play;

)


(
Ndef(\3).fadeTime=2;
Ndef(\3).quant=1;

Ndef(\3, {

	~sig=CombN.ar(SinOsc.ar(800)*LFPulse.kr(1),2,0.25,1,0.5);

}).play;

)





