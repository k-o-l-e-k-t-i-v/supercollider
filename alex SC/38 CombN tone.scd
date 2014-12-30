s.scope(2);

FreqScope(350,500);


(Ndef(\beat, {Pulse.kr([1,0.5],0.8)}));


(

Ndef(\saw).fadeTime=3;
Ndef(\saw).quant=2;

Ndef(\saw, {


	~fsaw=Select.kr(Stepper.kr(Ndef(\beat),max:5),[65,75,55,65,75]);
	~sig=CombN.ar(LFSaw.ar([~fsaw,~fsaw+(~fsaw/85)]).lag(0.1),0.2,1/85,decaytime:5,mul:0.5);
	// ~sig=BPF.ar(~sig,1200);

}).play;

Ndef(\bum).fadeTime=2;
Ndef(\bum).quant=2;

Ndef(\bum, {

	// ~freq=Decay2.kr(Impulse.kr(1),0.5,1).range(205,95);
	~sig=Limiter.ar(Mix.fill(15, {SinOsc.ar((95..95.5785),(1pi..2pi))}),0.5);

	~sig=~sig*Ndef(\beat);

}).play;



Ndef(\ts).fadeTime=3;
Ndef(\ts).quant=2;

Ndef(\ts, {

	~beat=Select.kr(Stepper.kr(Impulse.kr(0.5),max:3),[3,2,1]);

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.5),max:3),[4000,8005,9005]);
	~sig=BPF.ar(WhiteNoise.ar*Pulse.ar([~beat,15],0.5),~freq,0.1,0.2);
	~sig=CombN.ar(FreeVerb.ar(~sig,room:2,damp:0),10,3,-1,0.2);


}).play;

)
