s.scope(2);

FreqScope(300,450);

(

Ndef(\bum).fadeTime=3;
Ndef(\bum).quant=2;

Ndef(\bum, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.25),max:3),[60,55,45]);
	~beat=LFNoise0.kr(Impulse.ar(2)).range(5,0.5);


	~sig=GVerb.ar(
	BPF.ar(
		in:WhiteNoise.ar,
		freq:~freq,
			rq:SinOsc.kr(0.1).range(0.0001,0.002),
		mul:VarSaw.kr(20).range(8,12))*Decay2.kr(Impulse.kr(~beat),0.8,2),
		roomsize:200,
		revtime:3,
		damping:0,
		inputbw:0,mul:3
	);


}).play;


Ndef(\step).fadeTime=3;
Ndef(\step).quant=2;

Ndef(\step, {

	~beat=SinOsc.kr(0.081).range(0.65,4);

	~sig=LFPulse.kr(~beat)*(VarSaw.ar(80).lag(0.02)*Decay.kr(Impulse.kr(~beat),0.1));
	~sig=FreeVerb.ar(~sig,room:10,damp:0);

}).play;


Ndef(\ala).fadeTime=3;
Ndef(\ala).quant=2;Ndef(\13, {

	~freq=Sweep.kr(Impulse.kr(1),0.1).range(3000,52);

	~ping=LFPulse.ar(~freq,mul:0.2)*Decay2.kr(Impulse.kr(0.081),attackTime:4);

}).play;



Ndef(\scratch).fadeTime=3;
Ndef(\scratch).quant=2;

Ndef(\scratch, {

	~sig=HPF.ar(WhiteNoise.ar(0.2)*LFSaw.kr(0.5).lag(0.02),5000,0.001);

}).play;

)

{Formant.ar(fundfreq:100,formfreq:50,bwfreq:250)}.play;
