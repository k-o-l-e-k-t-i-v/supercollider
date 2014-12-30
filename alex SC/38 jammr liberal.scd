(

Pbind(
	\note, Prand([1,3,5,7],inf),
	\octave, 3,
	\amp, 1,
	\dur, 4/3*2,
	\legato, 2,

).play;

)
s.scope(2);

(

Ndef(\1).fadeTime=2;
Ndef(\1).quant=1;

Ndef(\1, {

	~freq=Select.kr(Stepper.kr(Impulse.kr([1,4/3]),max:3),[440,220,880]);

	~sig=Mix.fill(8,{SinOsc.ar((~freq),mul:SinOsc.kr(0.25).range(0,0.3))})*Pulse.ar(4/[2,1,3,5]);
	~sig=Limiter.ar(~sig,0.7);
	~sig=FreeVerb.ar(~sig,room:1);

}).play;

)

Ndef(\1).clear;



(
Ndef(\3).fadeTime=2;
Ndef(\3).quant=1;

Ndef(\3, {

	~freq=Select.kr(Stepper.kr(Impulse.kr([1,4/3]),max:3),[100,90,120]);
	~sig=VarSaw.ar(~freq)*Phasor.kr(Impulse.kr(0.5),0.001);
	// ~sig=Limiter.ar(~sig,0.8);


}).play;

)


Ndef(\3).clear;

(

Ndef(\44).fadeTime=2;
Ndef(\44).quant=1;

Ndef(\44, {



	~freq=Select.kr(Stepper.kr(Impulse.kr([1,4/3]),max:3),[800,1200,1000]);

	~sig=WhiteNoise.ar(5)*Decay2.kr(Impulse.kr(5/[2,1,3,4,7]),decayTime:0.005);
	~sig2=VarSaw.ar(~freq)*Decay2.kr(Impulse.kr(5/[2,1,3,4,7]),decayTime:0.1);

	~sig=HPF.ar(~sig,200);
	~sig=CombN.ar(~sig+~sig2,2,4,10);


}).play;

)

Ndef(\44).clear;




(

Ndef(\66).fadeTime=2;
Ndef(\66).quant=1;

Ndef(\66, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.5),max:3),[200,220,180]);

	~sig=LFSaw.ar(~freq)*Phasor.kr(Impulse.kr([4/3,2]),0.001);
	~sig=LPF.ar(~sig);

	// ~sig=Pan2.ar(WhiteNoise.ar(0.5)*Pulse.kr(1,0.2),SinOsc.kr(0.25));


}).play;
)


(

Ndef(\7).fadeTime=2;
Ndef(\7).quant=1;

Ndef(\7, {

	~sweep=Select.kr(Stepper.kr(Impulse.kr([0.25/4,0.25/2]),max:6),[50,60,100,10,20,5]);
	~up=Select.kr(Stepper.kr(Impulse.kr([0.5,1]),max:3),[880,440,660]);
	~freq=Decay2.kr(Impulse.kr(~sweep),0.2,decayTime:0.4).range(45,~up);

	~sig=Mix.fill(10,{SinOsc.ar([~freq,~freq+2])})*Pulse.ar(4/[2,3,5]);
	~sig=Limiter.ar(~sig,0.8);

	~sig=FreeVerb.ar(~sig,mix:0.5,room:2,damp:1);

}).play;

)