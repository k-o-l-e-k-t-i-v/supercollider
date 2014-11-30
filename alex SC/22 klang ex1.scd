(
SynthDef(\bum, {
	arg freq=65, gate=1, vol=0.5;
	var tone;

	tone= VarSaw.ar(freq)*Pulse.kr([1,2]);
	tone=Splay.ar(LPF.ar(tone, [170,172],vol));

	Out.ar(0, tone);
}).add;
)

(
Pdef(\loopbum, {
	Pmono(
		\bum,
		\freq, Pseq([Pn(65,2),95,150],inf),
		\vol, 0.5,
		\dur, Pseq([Pn(2,2),1, 2],inf),
)}).play(quant:2);
)

Pbindef(\loopbum, \freq, Pseq([Pn(1800,2),2500],inf), \dur, Pseq([Pn(0.25,2),0.1],inf),);
Pbindef(\loopbum).stop;




(
Ndef(\long).fadeTime=3;
Ndef(\long).quant=1;


Ndef(\long, {
	~freqI=[1,2];
 ~vol=0.5;
 ~freq=1200;


 ~tone=Klank.ar(specificationsArrayRef:[
		`[[~freq,~freq+200,~freq+400],[0.2,0.3,0.4],[0.4,0.3,0.2]],
		`[[~freq-25,~freq-50,~freq-200],[0.2,0.3,0.4],[0.5,0.1,0.6]] ],

		input:[Dust.ar(SinOsc.kr(0.025).range(1,4),0.5),
			Impulse.ar(~freqI)],
		freqscale: 1,
		freqoffset:0.01,
		decayscale:1.2,
		);
 ~tone=CombN.ar(~tone,maxdelaytime:1.6,delaytime:0.7,decaytime:3);
 ~tone=FreeVerb.ar(~tone,mix:0.2,room:2,damp:0.1,mul:0.5);


	Splay.ar(~tone,1,0.3);
}).play;

)

