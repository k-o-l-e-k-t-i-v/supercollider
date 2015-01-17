(

Ndef(\long).fadeTime=4;
Ndef(\long).quant=2;

Ndef(\long,{

	~dur=LFNoise0.kr(0.1).range(2,5);
	~car=LFNoise0.kr(0.25).range(200,70).round(10);
	~mod=VarSaw.kr(1).range(2,10);


	~sig=GrainFM.ar(2,Impulse.kr(0.5),
		dur:~dur,
		carfreq:~car,
		modfreq:~mod

	);

	~sig=~sig*Decay2.kr(Impulse.kr([1,2]));


}).play;

)

Ndef(\long).clear;



(

Ndef(\white).fadeTime=2;
Ndef(\white).quant=1;

Ndef(\white, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4),[12,6,6,10]);
	~sig=Pan2.ar(HPF.ar(WhiteNoise.ar(0.5)*Decay2.kr(Impulse.kr(1),0.01,0.2),~freq*1000),SinOsc.kr(0.25));

	~sig=FreeVerb.ar(~sig,0.33,4);

}).play;

)

Ndef(\white).clear;






(

Ndef(\tru).fadeTime=2;
Ndef(\tru).quant=1;

Ndef(\tru, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4), [5,8,8,10]);
	~vol=SinOsc.kr(0.1).range(0,0.7);

	~sig=(VarSaw.ar(Decay2.kr(Impulse.kr(2),0.01,1).range(~freq*100,0))*Pulse.kr([1,2,4]))*~vol;

	~sig=FreeVerb.ar(~sig, 0.5,3);




}).play;

)

Ndef(\tru).clear;


(

Ndef(\tt).fadeTime=4;
Ndef(\tt).quant=4;

Ndef(\tt, {


	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:6),[12,11,9,9,11]);
	~beat=Select.kr(Stepper.kr(Impulse.kr(0.5),max:6),[2,4,5,6,3]);
	~dur=Select.kr(Stepper.kr(Impulse.kr(0.5),max:6),[0.2,0.5,1,0.2]);


	~sig=SinOsc.ar(~freq*1000)*Decay2.kr(Impulse.kr(~beat),0.01,~dur);

	~sig=CombN.ar(~sig,decaytime:10);

	~sig=Normalizer.ar(FreeVerb.ar(~sig,room:2),0.5);



}).play;

)

(

Ndef(\5).fadeTime=4;

Ndef(\5).quant=1;

Ndef(\5, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4), [80,20,8,20,20]);
	~sig=SinOsc.ar(~freq*10)*Decay2.kr(Impulse.kr([1,2,4]),0.1,0.5);

	~sig=FreeVerb.ar(~sig,room:2);

}).play;

)




(
Ndef(\7).fadeTime=4;
Ndef(\7).quant=2;

Ndef(\7, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4), [100,90,80,5.00,200]);

	~sig=VarSaw.ar(~freq*10)*Phasor.kr(Impulse.kr(0.25),0.8);
	~sig=~sig*Decay2.kr(Impulse.kr([2,3]),decayTime:4);
	~sig=FreeVerb.ar(~sig,room:2);


}).play;

)

(

Ndef(\free).fadeTime=2;
Ndef(\free).quant=2;
Ndef(\free, {

	~once=4/3;   // 1.3333
	~twice=5.333/2; //2.666

	~freq=Select.kr(Stepper.kr(Impulse.kr(~twice), max:5), [5,10,20,11,6]);

	~sig=LPF.ar(WhiteNoise.ar(~once),~freq*100)*Pulse.kr(0.5,0.01);

	~sig=FreeVerb.ar(~sig,4,~freq/10,0.1,1);

	~sig=(~sig*Decay2.kr(Impulse.kr(30),0.5,0.001,1))*Pulse.kr([4,2],0.5)*2;

}).play;

)

s.scope(2);


