(

Ndef(\tr3).fadeTime=2;
Ndef(\tr3).quant=2;
Ndef(\tr3, {


	~trig=Impulse.kr([1,2,4]);
	~freq=Select.kr(Stepper.kr(Impulse.kr(1),max:5), [4,3,4,4,2]);

	~sig=GrainSin.ar(
		2,
		trigger:~trig,
		dur:Select.kr(Stepper.kr(Impulse.kr(0.25),max:5),[0.25,1,0.5,0.25,1]),
		freq:~freq*150*VarSaw.kr(2),
		pan:SinOsc.kr(0.5),
		maxGrains:200,
		mul:0.37

	);

	~sig=LPF.ar(~sig,50);

	~sig=GVerb.ar(~sig,roomsize:30,revtime:2,damping:0.8,inputbw:0.5,spread:15,drylevel:1);
}).play;

)


s.scope(2);

{CombN.ar(SinOsc.ar*Decay2.kr(Impulse.kr(0.005),0.1,0.8),0.2,0.2,1)}.play;