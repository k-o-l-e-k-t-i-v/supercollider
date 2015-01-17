s.scope(2);

(

Ndef(\sweep1).fadeTime=3;
Ndef(\sweep1).quant=2;

Ndef(\sweep1, {

	~beat=Select.kr(Stepper.kr(Impulse.kr(0.25),max:3),[1,2,4]);

	~range=Select.kr(Stepper.kr(Impulse.kr(~beat),max:7),[5,8,9,8,6,6]);

	~freq=Sweep.kr(Impulse.kr([1,~beat]),1).range(~range*1000,~range*(~range*50));

	~sig=Normalizer.ar(VarSaw.ar(~freq),0.1);

}).play;

)

(
Ndef(\bum).fadeTime=3;
Ndef(\bum).quant=2;

Ndef(\bum, {

	~sweep=Sweep.kr(Impulse.kr(1),0.11).range(1000,80);
	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:5), [80,~sweep,~sweep,60]);

	~sig=Normalizer.ar(BPF.ar(WhiteNoise.ar(0.5),~freq,0.1))*Decay2.kr(Impulse.kr(0.5),0.01,0.1);

	~sig=FreeVerb.ar(~sig,0.1,3,0);
	~pum=GVerb.ar(~sig,roomsize:200,revtime:4,damping:0,inputbw:1
		,spread:20,drylevel:1,earlyreflevel:2,taillevel:0.2);

	~pum=~pum*Phasor.kr(Impulse.kr([1,2,4]),0.051);

}).play;

)