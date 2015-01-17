(
Ndef(\tr1).fadeTime=2;
Ndef(\tr1).quant=2;

Ndef(\tr1, {

	~freq=[85,85.001];
	~trig=Impulse.ar([4/3,4/3]);
	~div=Select.kr(Stepper.kr(Impulse.kr(0.5),max:4),[3,4,2,5]);
	~sig=LPF.ar(VarSaw.kr(~freq/~div)*SinOsc.ar(~freq+~div),120,Decay2.ar(~trig,0.8,1.5,1.5));

	~sig2=CombN.ar(GrainFM.ar(2,~trig,0.1,2,~div*4000,mul:0.005),1,0.2,20);

	~sig3=HPF.ar(
		WhiteNoise.ar*Decay2.kr(
		Impulse.kr([1,2,4]),
			SinOsc.kr(0.25).range(0.01,0.03),

				SinOsc.kr(0.25).range(0.008,0.1),
),
		12000);
	~sig3=FreeVerb.ar(~sig3,0.3,SinOsc.kr(0.25).range(0.3,0.9),SinOsc.kr(0.25).range(0.8,0.2),0.5);


	~sig4=~sig2+~sig+~sig3;

}).play;

)

Ndef(\tr1).clear;

s.scope(2);


(

Ndef(\tr2).fadeTime=2;
Ndef(\tr2).quant=2;

Ndef(\tr2, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.5),max:4), [4,4.2,3,6]);

	~sig=BPF.ar(Saw.ar(~freq*10,0.1)+SinOsc.ar(5)*7.5,
		freq:2**LFNoise0.kr(4/3,2)*200,
		rq:0.1).distort;
	~sig=CombN.ar(~sig,0.2,0.2,20);

}).play;

)

Ndef(\tr2).clear;



(
Ndef(\tr3).fadeTime





