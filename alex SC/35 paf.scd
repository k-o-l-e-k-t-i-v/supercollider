s.scope(2);

FreqScope(300,400);


////////////////////////////////////////


(

Ndef(\brr1).fadeTime=3;
Ndef(\brr1).quant=2;

Ndef(\brr1, {

	~freqvar=LFNoise0.kr(0.5).range(5,15).round(5);
	~freq=LFNoise0.kr(Impulse.kr(3)).range(9000,600);

	~sig=BPF.ar(BrownNoise.ar(VarSaw.kr(~freqvar).range(0,1)),~freq,rq:0.01);
	~sig=~sig*Decay2.kr(Impulse.kr(0.25),0.1,1);
	~sig=Normalizer.ar(~sig,0.2);
	~sig=GVerb.ar(~sig,10);

}).play;

)

Ndef(\brr1).clear;

(
Ndef(\2).fadeTime=3;
Ndef(\2).quant=2;

Ndef(\2, {

	~sig=HPF.ar(WhiteNoise.ar(0.3),10000)*Decay2.kr(Impulse.kr(1),decayTime:0.09);
	~sig=FreeVerb.ar(~sig,room:2)*8;
	// ~sig=Normalizer.ar(~sig,0.3);

}).play;

)


(

Ndef(\3).fadeTime=3;
Ndef(\3).quant=2;

Ndef(\3, {

	~freq=Sweep.kr(Impulse.kr(1),0.1).range(11000,80);
	~beat=Impulse.kr([2,4]);

	~sig=HPF.ar(WhiteNoise.ar(0.5),~freq)*Decay2.kr(~beat,0.01,0.051);
	~sig=FreeVerb.ar(~sig,room:2,damp:0);

}).play;

)


(
Ndef(\4).fadeTime=3;
Ndef(\4).quant=3;


Ndef(\4, {

	~sig=GrainFM.ar(2,
		trigger:Impulse.kr(2),
		dur:2,
		carfreq:
		Sweep.kr(Impulse.kr(2),0.1).range(LFNoise0.kr(Impulse.kr(1)).range(11000,1000),80),
		modfreq:LFNoise0.kr(0.5).range(60,200));

	~sig=~sig*Decay2.kr(Impulse.kr([1,2]),decayTime:[1,0.2]);
	~sig=FreeVerb.ar(~sig,room:2);

}).play;

)

(

Ndef(\4).fadeTime=3;
Ndef(\4).quant=2;

Ndef(\4, {



	~sig=GrainFM.ar(2,
		trigger:Impulse.kr(0.25),
		dur:LFNoise0.kr(Impulse.kr(2)).range(3,1),
		carfreq:LFNoise0.kr(Impulse.kr(0.5)).range(45, 80),
		modfreq:LFNoise0.kr(Impulse.kr(0.5)).range(100,200));

	~sig=CombN.ar(~sig,4,1);

	~sig=GVerb.ar(~sig,200);


}).play;

)


(

Ndef(\51).fadeTime=4;
Ndef(\51).quant=2;

Ndef(\51, {


	 ~sig=BPF.ar(BrownNoise.ar(0.5),LFNoise0.kr(5).range(200,65),rq:VarSaw.kr(3).range(0.1,0.01));
	~sig=~sig*Decay2.kr(Impulse.kr(0.25),attackTime:0.1,decayTime:1);

	// ~sig=Normalizer.ar(~sig,0.2);
	~sig=GVerb.ar(~sig,20);

}).play;

)



(

Ndef(\6).fadeTime=4;
Ndef(\6).quant=2;

Ndef(\6, {

	~sig=Pan2.ar(HPF.ar(WhiteNoise.ar(0.5),11000)*Decay2.kr(Impulse.kr([2,4]),decayTime:0.1),SinOsc.kr(0.25));

	~sig=FreeVerb.ar(~sig,room:1);

}).play;

)


(

Ndef(\7).fadeTime=3;
Ndef(\7).quant=3;

Ndef(\7, {

	~bum=BPF.ar(WhiteNoise.ar,Sweep.kr(1,0.2).range(600,65),0.5);
	~bum=~bum*Decay2.kr(Impulse.kr(0.5),0.5,1);

	~bum=Normalizer.ar(~bum,0.8);

}).play;

)



(

Ndef(\8).fadeTime=4;
Ndef(\8).quant=2;

Ndef(\8, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:3),[65,65,55]);

	~sig=VarSaw.ar([~freq,~freq*1.025])*Decay2.kr(Impulse.kr(0.25),0.4,2)*0.8;

	~sig=GVerb.ar(~sig,10);

}).play;

)




























