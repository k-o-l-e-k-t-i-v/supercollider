s.scope(2);

(

///brr in the back

Ndef(\11).fadeTime=2;
Ndef(\11).quant=1;

Ndef(\11, {

	~freq=LFNoise0.kr(10).range(125,65).round(20);
	~freqvar=LFNoise0.kr(0.5).range(5,15).round(5);
	~vol=Select.kr(Stepper.kr(Impulse.kr(0.125),max:5),[0.05,0.1,0.11,0.25,0.8,0.25]);

	~sig=BPF.ar(BrownNoise.ar(VarSaw.kr(~freqvar).range(0,1)),~freq);
	~sig=(~sig*Phasor.kr(Impulse.kr([0.5,0.25]),0.001))*Decay2.kr(Impulse.kr([0.5,0.25]),0.5,4,mul:5,add:~sig*0.3);
	~sig=GVerb.ar(~sig,50,mul:~vol)

}).play;


///ticktick tss

Ndef(\2).fadeTime=3;
Ndef(\2).quant=2;

Ndef(\2, {


	~frtop=Select.kr(Stepper.kr(Impulse.kr(0.625),max:3),[12000,10000,8500]);
	~freq=Sweep.kr(Impulse.kr(4),0.1).range(~frtop,800);
	~vol=Select.kr(Stepper.kr(Impulse.kr(0.125),max:5),[0.05,0.1,0.11,0.25,0.8,0.25].reverse);
	~addfree=HPF.ar(WhiteNoise.ar(0.1),18000,3)*Decay2.kr(Dust2.kr(8),0.01,decayTime:0.05);

	~sig=SinOsc.ar(~freq)*Decay2.kr(Impulse.kr([0.5,0.25]),decayTime:0.051);
	~sig=Normalizer.ar(CombN.ar(~sig,maxdelaytime:2,delaytime:SinOsc.kr(0.125).range(0.7,0.2).round(0.1),decaytime:1.5),0.7);
	~sig=FreeVerb.ar(~sig,room:5,mul:~vol,add:~addfree);

	~sig=Pan2.ar(~sig,SinOsc.kr(0.25));

}).play;



//sometimes sounds like a voice

Ndef(\3).fadeTime=3;
Ndef(\3).quant=3;

Ndef(\3, {

	~freq=Select.kr(Stepper.kr(Impulse.kr(0.5),max:12),[1200,800,800,1000,400,220,85,100,2000]);

	~sig=GrainFM.ar(2,
	trigger:Impulse.kr(4/[2,0.5,1,3]),
	dur:SinOsc.kr(0.5).range(1,3).round(0.25),
	carfreq:Sweep.kr(Impulse.kr(0.5),0.2).range(~freq,~freq-200),
	modfreq:SinOsc.kr(0.25).range(1,4),
	mul:0.1);

	~sig=FreeVerb.ar(~sig,room:2,mul:0.2);
}).play;


)

