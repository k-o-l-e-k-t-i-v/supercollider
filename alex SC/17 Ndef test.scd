(

//Ndef.gui(21);

Ndef(\test).fadeTime=1;
Ndef(\test).quant=1;

Ndef(\test, {

	~beats=[1,2,3];//controls no of beats--will be mixed at the end

	~sig1=LPF.ar(         //bass
		VarSaw.ar(
			freq:65,
			phase:0,
			mul:0.5,
			)*
		Pulse.kr(
			freq:~beats,
			width:0.5)


		,85);

	~sig2=PinkNoise.ar(0.2)*Pulse.ar(~beats,0.01); //simple pink beat

	~sig3=Splay.ar(              //delays
		CombN.ar(
			~sig2,
			maxdelaytime:0.25,
			delaytime:SinOsc.kr(0.125).range(0.5,1),
			decaytime:SinOsc.kr(0.125).range(4,20),
			mul:0.25,
	));

	~freqvar=Phasor.kr(Impulse.kr(1),10,0,20);

	~sig4=SinOsc.ar(           //bingg
		freq:500,
		phase:0,
		mul:SinOsc.kr(1).range(0,0.1),
		add:0,
	)*
	VarSaw.ar(~freqvar);
	//~freqvar.plot; -


		Mix([~sig1,~sig3, ~sig4]);
}).play;
)


s.scope(2);
