(
Ndef(\buzz).fadeTime=2;
Ndef(\buzz).quant=1;

Ndef(\buzz, {
	~numharm=SinOsc.kr(0.25).range(400,500);

	~freq=SinOsc.kr(0.25).range(60,85);
	//~beatsbum=[[1,2,3],[0.5,1,1.5]];
	~beats=[[1,2,1.5],[2,1,0.5]];
	~delaytime=SinOsc.kr(0.025).range(0.1,0.001);


	~buz=Blip.ar(20,SinOsc.kr(0.25).range(200,600))+VarSaw.ar(SinOsc.kr(0.025).range(3,9)*SinOsc.ar(200))*SinOsc.ar(SinOsc.kr(0.025).range(20,50),0,SinOsc.kr(0.025).range(0,0.3)); //*Phasor.ar(Impulse.ar(0.5),0.0005); //65 with 500
	~buz=AllpassC.ar(~buz,0.7);
	~buz=Pan2.ar(~buz,SinOsc.kr(0.25),SinOsc.kr(0.5));

	~tim=CombN.ar(PinkNoise.ar(0.5)*Pulse.ar(~beats,0.002,SinOsc.kr(0.1).range(0,0.1)),SinOsc.kr(1).range(0.1,0.2),0.001,0.8,0.05);

	~bum=LPF.ar(SinOsc.ar([97,95],0,SinOsc.kr(1).range(0,0.2))*VarSaw.ar(SinOsc.kr(0.5),0,0.5),[170,172],0.5);
	~bum=FreeVerb.ar(~bum,0.5,0.6,1);

	~tss=PinkNoise.ar*Saw.ar([2,1,0.25,0.5],0.05).squared;
	~tss=CombL.ar(~tss,SinOsc.kr(0.25).range(0.1,0.4),SinOsc.kr(1).range(0.4,1.6),SinOsc.kr(1).range(2,4),0.5);


	Splay.ar([~buz,~tim, ~bum, ~tss]);

}).play;

)
s.scope(2);


