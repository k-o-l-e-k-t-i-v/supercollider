(
Ndef(\long).fadeTime=1;
Ndef(\long).quant=2;

Ndef(\long, {

	~freqI=SinOsc.kr(0.05).range(0.25,1);
 ~vol=0.5;
 ~freq=2200;


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
 ~tone=FreeVerb.ar(~tone,mix:0.2,room:2,damp:0.1,mul:0.8);


	Splay.ar(~tone,1,0.6);
}).play;

)


Ndef(\long).clear;

(

Ndef(\pic).fadeTime=1;
Ndef(\pic).quant=2;

Ndef(\pic, {
	~freq=SinOsc.kr(0.025).range(65,600)*VarSaw.ar(650);

	~tone=SinOsc.ar(~freq)*Pulse.ar([0.25,0.05],0.2);
	~tone=FreeVerb.ar(~tone, 0.5,2,2,0.3);
	~tone=CombN.ar(~tone, 0.5,2,4,0.1);
	~tone=Pan2.ar(~tone, SinOsc.kr(0.5).range(-1,1),0.1);




	Splay.ar([~tone],1);
}).play;
)


Ndef(\pic).clear;


(

Ndef(\pink).fadeTime=1;
Ndef(\pink).quant=1;

Ndef(\pink, {

	~pink=PinkNoise.ar*Pulse.ar(2/[1,2,3],0.025,0.2);
	~pink=FreeVerb.ar(~pink,0.3,1,0.8,0.2);
	~pink=CombN.ar(~pink,0.8,0.2,1,0.8);
	~pink=Pan2.ar(~pink, SinOsc.kr(0.25).range(-1,1),0.8);


	Splay.ar(~pink);

}).play;
)

Ndef(\pink).clear;


(

Ndef(\long).fadeTime=1;
Ndef(\long).quant=1;

Ndef(\long, {

	~long=FreeVerb.ar(
	Pan2.ar(
		in:WhiteNoise.ar(Phasor.kr(Impulse.ar(0.25),0.0005).range(0,0.3))*Pulse.ar([0.2,0.1],0.05,0.5),
		pos:SinOsc.kr(0.25).range(-1,1);
	),
		mix:0.5,
		room:1,
		damp:0.8,
		mul:0.2);

	Mix.ar(~long);
}).play;
)

Ndef(\long).clear;


(

Ndef(\blip).fadeTime=1;
Ndef(\blip).fadeTime=1;

Ndef(\blip,{

	~blip=FreeVerb.ar(
		in:
		Blip.ar(65,SinOsc.ar(0.025).range(5,15),0.3),
		mix:0.5,
		room:1,
		damp:0.8,
		mul:0.3);
}).play;
)

Ndef(\blip).clear;

s.scope(2);

(
Ndef(\sin).fadeTime=1;
Ndef(\sin).quant=1;

Ndef(\sin, {

	~sin=SinOsc.ar([120,130],0,SinOsc.kr(0.25).range(0,0.8))*
	SinOsc.ar(220,0,SinOsc.kr(1).range(0,0.7))*
	SinOsc.ar(440,0,SinOsc.kr(4).range(0,0.6));

	~sintwo=FreeVerb.ar(
		CombN.ar(SinOsc.ar([1200,880],0,0.3)*Pulse.ar([0.05,0.0025],[0.08,0.02],0.3),0.8,0.4,1,0.5),
		mix:0.5,room:1,damp:0.8);

	Splay.ar([~sin, ~sintwo],1,0.1);


	}).play;

)

Ndef(\sin).clear;


(
Ndef(\bum).fadeTime=1;
Ndef(\bum).quant=1;

Ndef(\bum, {

	~bum=FreeVerb.ar(
	LPF.ar(
		VarSaw.ar(65)*Pulse.ar([1,2,3],0.5,0.3),[170,172],1
	),
		mix:0.4,
		room:0.8,
		damp:0.5)

	;
}).play;
)

Ndef(\bum).clear;


(
Ndef(\ritm).fadeTime=1;
Ndef(\ritm).quant=1;

Ndef(\ritm, {

	~ritm=(SinOsc.ar(96)*LFSaw.kr([1,1.5]))*SinOsc.kr([0.25,0.05]);
	~ritm=LPF.ar(~ritm);

}).play;

)

Ndef(\ritm).clear;



(
Ndef(\zum).fadeTime=1;
Ndef(\zum).quant=1;
Ndef(\zum, {

	~freq=65;
	~beat=1;

	~bum=LPF.ar(
		Pan2.ar(
			(VarSaw.ar(
				[~freq,~freq+1/[1,2,3,5,8]]
				,0,0.5)*VarSaw.ar(40))

	*Decay2.ar(
		Impulse.ar(~beat),
		attackTime:0.5,
		decayTime:1.2,
				mul:0.8),0),80);

	~bum=FreeVerb.ar(~bum,0.3,0.5,0.8,0.8);

}).play;

)





s.scope(2);

   