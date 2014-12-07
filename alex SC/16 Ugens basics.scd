
s.scope(2);

//phasor ^_^

{Saw.ar(40)*Decay2.kr(Impulse.kr(1),0.8,5,0.2)*Phasor.ar(Impulse.ar(1),0.005)}.play;
{LPF.ar(Phasor.ar(Impulse.ar(SinOsc.kr(1,0,1,SinOsc.kr(1).range(2,5))),0.00002,0,1)*Saw.ar(70),300)}.play;



//Klang //bells!
play({ Klang.ar(`[[65,67],[0.5,0.8],[0,2pi]],1,0)});


(
Ndef(\long).fadeTime=1;
Ndef(\long).quant=2;

Ndef(\long, {

	~freqI=SinOsc.kr(0.05).range(0.25,1);
 ~vol=0.5;
 ~freq=75;


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


//Vibrato
{ LFPulse.ar(10) * 0.1 }.play;
{SinOsc.ar(Vi.brato.ar(DC.ar(400.0),5,0.02) )}.play;

{DC.ar(0.0) }.play;

{SinOsc.ar(Vibrato.ar(DC.ar(800.0),LFNoise1.kr(1,3,7),MouseX.kr(0.0,1.0),1.0,1.0,MouseY.kr(0.0,1.0),0.1) )}.play

{SinOsc.ar(Vibrato.kr((SinOsc.ar(65).range(2000,4000)),MouseX.kr(2,20),0.5,0.02,1,SinOsc.kr(1),SinOsc.kr(50),0))}.play;




//ClipNoise

{(ClipNoise.ar(0.2)*Phasor.ar(Impulse.kr(1),0.00005))*SinOsc.ar(SinOsc.kr(1).range(3,9))}.play;



//CombN


{ CombN.ar((Resonz.ar(PinkNoise.ar(0.5), 4000, Phasor.kr(Impulse.ar(SinOsc.ar(1).range(40,70)),0.0005))),1,0.2,1) }.play
{CombN.ar(PinkNoise.ar(0.2)*Impulse.ar(1,0),0.2,5,1,0.5)}.play;
{(PinkNoise.ar(0.2)*LFTri.ar(500,0,0.5))*Pulse.ar(0.2,0.5)}.play;




//Resonz

{Resonz.ar(SinOsc.ar(SinOsc.kr(1).range(60,300)),50,1)}.play;



//Tdef


Tdef(\x).play;


Tdef(\x, { loop { 0.5.wait; "aaaaaaaaaaaaaazz".scramble.postln } }).play;
Tdef(\x, { loop { 0.125.wait; "aazz".scramble.postln } });
Tdef(\x, { loop { 0.5.wait; (note: 14.rand).play } });
Tdef(\x, { loop { 0.5.wait; (note: 14.rand + [0, 3, 6, 7].keep(4.rand)).play } });
Tdef(\x).stop;
Tdef(\x).play;
Tdef(\x)clear;




//Sweep - Xline by Impulse

s.scope(2);

(

{HPF.ar(Sweep.ar(Dust.ar([1,3]),0.1)*WhiteNoise.ar(0.2),1100)+
Sweep.ar(Impulse.ar([1,3]),0.1)*VarSaw.ar(100,0,0.3)}.play;
)



// Stepper - growing Series

(
Ndef(\talk).fadeTime=1;
Ndef(\talk).quant=1;

Ndef(\talk, {


	~freq1=Stepper.kr(Impulse.kr(1),40,40,120,25);
	~freq2=LFNoise0.kr(4).range(90,120).round(10);

	// ~beats=Impulse.kr(1)+LFNoise0.kr(2).range(1,3).round(1);


	~talk=FreeVerb.ar(
		SinOsc.ar(
		freq:Stepper.kr(Impulse.kr(2),1,1,[2,3],1) * [~freq1,~freq2],
		phase:0,
			mul: 0.5 )*VarSaw.ar(5)

		, 0.5,SinOsc.kr(0.5).range(0.5,1),SinOsc.kr(0.5).range(0.2,0.8));

}).play;

//used for frequence


)

(
{FreeVerb.ar(
	WhiteNoise.ar(0.2)*Pulse.ar(Stepper.kr(Impulse.kr(4),0,1,4,[3,2]),0.2),
	mix:0.1,                                //how fast
	room:2,
	damp:0.1,
	mul:0.2,
)}.play;                         //used as a beat rithm
)


(
Ndef(\test).fadeTime=2;
Ndef(\test).quant=2;

Ndef(\test, {

	~trig=Impulse.kr(0.25);//every 4 sec there's 3 beats at

	~freq=Stepper.kr(~trig,80,80,900,-100); //frequency steps down 100Hz every ~trig, then resets

	~sig= (SinOsc.ar(~freq)*Decay2.ar(Impulse.ar(3),0.1,1))*Decay.kr(~trig,1,0.1);

}).play;

)


//PulseCount



//Decay2 //Decay
s.scope(2);

(
{SinOsc.ar( Decay2.ar(
	[Impulse.ar(4).range(4,8),
	Impulse.ar(4).range(12,14)],
	attackTime:2,
	decayTime:Decay2.ar(Impulse.ar(0.25),0.5,4)),0,0.008)}.play;
)



{(SinOsc.ar([105,108],[0,0.45513*pi],Decay2.ar(Impulse.ar(5),0.1,0.8,1))*Decay2.ar(Impulse.ar(1)))*Decay2.ar(Impulse.ar(0.25),1,3)}.play;




//PulseDivider - still don't get the "div" argument /maybe it divides the freq of Impulse as many times=> period; blegh.

{SinOsc.ar(600,  0, Decay2.ar(PulseDivider.ar(Impulse.ar(1),0.2), 0.005, 0.1))}.play;

// Crackle

{ Crackle.ar(1.98, 0.5)*Pulse.ar(1)}.play;






//Dgeom

{SinOsc.ar(Dgeom.new(Impulse.kr(0.5),50,3))}.play; //NOPE


//LFNoise



(

Ndef(\kick).fadeTime=2;
Ndef(\kick).quant=2;

Ndef(\kick, {

	~pan=MouseX.kr(-1, 1);

	~freq=LFNoise1.kr(0.25).range(440,1200).round(100);

	~beats=Decay.kr(Impulse.kr(1),1).range(0.25,1).round(0.05)+LFNoise1.kr(1).range(1,0.2).round(0.5);

	~kick=LFSaw.kr(~beats).squared*SinOsc.ar(SinOsc.kr(3).range(~freq,220).round(100));

	~kick=FreeVerb.ar(~kick, 0.5,MouseY.kr(0.5,1), MouseX.kr(0.5,0.8));
	~kick=Pan2.ar(~kick,~pan,1 );

	//make it sound decent


}).play;

)




// GrainSin

{GrainSin.ar(2,SinOsc.kr(1200),10,LFSaw.kr(1).range(85,400),SinOsc.kr(0.25),-1,512,0.01)}.play;

{LFSaw.ar(SinOsc.kr(LFNoise0.kr(2).range(2,10).round(1)).range(40,400),0,0.01)*Decay2.ar(Impulse.ar(1),0.1,2)}.play;

(

Ndef(\grain1).fadeTime=1;
Ndef(\grain1).quant=1;

Ndef(\grain1, {

	~grain=GrainSin.ar(2,SinOsc.kr(10),5,LFSaw.kr(1).range(85,400),SinOsc.kr(1),-1,100,0.01);
	~tss=LFSaw.ar(SinOsc.kr(LFNoise0.kr(2).range(2,10).round(1)).range(40,400),0,0.1)*Decay2.ar(Impulse.ar(0.5),0.1,2);
	~tss=FreeVerb.ar(~tss, 0.1,SinOsc.kr(0.25).range(0.5,0.8), 1);

	Mix(~grain+~tss);
}).play;

)


(
Ndef(\grain).fadeTime=1;
Ndef(\grain).quant=2;

Ndef(\grain, {
 ~beat=Stepper.kr(Impulse.kr(1),1,1,6,2);

 ~freq=LFNoise1.kr(~beat).range(190,240).round(5);
.3
 ~sig=GrainSin.ar(2,Impulse.ar(~beat),0.5,~freq/SinOsc.kr(0.5).range(2,4).round(0.5)
 ,SinOsc.kr(0.5)).softclip*Saw.kr(10).squared;




 }).play;
)

s.scope(2);

//Formant

//Harmonics

//LFPar

//LFCub

//LFSaw

//Tdelay

// Trig

//Array

//Pluck

//Place

//Select
