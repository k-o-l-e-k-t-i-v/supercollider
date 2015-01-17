s.scope(2);

(

Ndef(\drag).fadeTime=2;
Ndef(\drag).quant=2;

Ndef(\drag, {

	~rate=0.1;

	~rangef=Select.kr(Stepper.kr(Impulse.kr(0.25),max:4), [85,85,45,95]);
	~freq=Sweep.kr(Impulse.kr(2),~rate).range(~rangef-40,~rangef);
	~rq=Sweep.kr(Impulse.kr(4/3),0.5).range(4,0.01);

	~sig=BPF.ar(WhiteNoise.ar(VarSaw.kr(20).range(0.4,0.7)),~freq,~rq)*Phasor.kr(Impulse.kr(4/3),0.001);



	~sig=Pan2.ar(~sig*8,SinOsc.kr(0.25));

	~sig2=SinOsc.ar(Sweep.kr(Impulse.kr(4/3*2),1).range(12000,500))*Decay2.kr(Impulse.kr(4/3*3),0.01,0.1,0.021);

	~sig3=~sig+~sig2;


}).play;

)