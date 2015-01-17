(
Ndef(\1).fadeTime=1;
Ndef(\1).quant=1;

Ndef(\1, {

	~freq=Sweep.kr(Impulse.kr(0.01),0.5).range(400,2200)*VarSaw.ar(850);

	~sig=SinOsc.ar(~freq/2)*Pulse.ar([2,1],0.5);

	~sig=FreeVerb.ar(~sig,0.5,1,0.8,0.2);
	~sig=CombN.ar(~sig,2,1,2,0.2);
}).play;
)

Ndef(\1).clear;

(
Ndef(\2).fadeTime=1;
Ndef(\2).quant=1;


Ndef(\2, {

	~freq=Sweep.kr(Impulse.kr(3),0.5).range(2,8)+[1,2,4];

	~tin=WhiteNoise.ar(SinOsc.kr(0.5).range(0.2,0.8))*Pulse.ar(~freq,0.02);
	~tin=~tin*Decay2.ar(Impulse.ar(1),0.1,2,1);
	~tin=FreeVerb.ar(~tin,0.5,4,1);




}).play;
)

Ndef(\2).clear;

(

Ndef(\3).fadeTime=1;
Ndef(\3).quant=1;

Ndef(\3, {

	~long=(SinOsc.ar(95)*VarSaw.kr(5))*2;
	~long=~long*Decay2.ar(Impulse.ar(1),0.1,2,1);
	~long=FreeVerb.ar(~long);


}).play;

)

s.scope(2);





(
Ndef(\4).fadeTime=3;
Ndef(\4).quant=1;

Ndef(\4, {

	~sus=SinOsc.ar([Sweep.kr(Impulse.kr(0.5),0.5).range(1200,2200),
		Sweep.kr(Impulse.kr(0.5),0.5).range(400,800)]);
	~sus=~sus*Decay2.kr([Impulse.kr([1,0.5]),Impulse.kr([2,1])],0.5,3,0.5);
	~sus=FreeVerb.ar(~sus);
	~sus=Pan2.ar(~sus,SinOsc.kr(0.5));
	// Mix.ar(~sus,2);

}).play;

)

Ndef(\4).clear;

(
Ndef(\5).fadeTime=1;
Ndef(\5).quant=2;

Ndef(\5,  {

	~pik=WhiteNoise.ar(0.5)*Pulse.ar([0.5,1],0.2);
	~pik=LPF.ar(~pik*Decay2.ar(Impulse.ar(0.5),0.1,3),400);
	~pik=FreeVerb.ar(~pik,0.5,2,0.8);

}).play;

)

Ndef(\5).clear;


(

Ndef(\6).fadeTime=1;
Ndef(\6).quant=1;

Ndef(\6, {

	~bur=(SinOsc.ar(2000)*Saw.kr(12,0.1)).softclip(-1,1);
	~bur=Decay2.ar(Impulse.ar,0.2,2)*~bur;
}).play;

)

s.scope(2);



(
Ndef(\water).fadeTime=1;
Ndef(\water).quant=1;

Ndef(\water, {

	~wa=Pan2.ar(WhiteNoise.ar(0.1),SinOsc.kr(0.25));

	~sun=HPF.ar(SinOsc.ar([8000,7200])*Pulse.ar([1,3]),1200);
	~sun=CombN.ar(~sun,2,0.5,1);

	Mix.ar(~wa+~sun);


}).play;

)



Ndef(\water).clear;








(
Ndef(\lon).fadeTime=1;
Ndef(\lon).quant=2;

Ndef(\lon, {

	~lon=SinOsc.ar(Sweep.ar(Impulse.ar([1,2,3]),20)*800)*Saw.ar(10);

	~lon=~lon*Decay2.ar(Impulse.ar([1,2]),0.5,SinOsc.kr(0.25).range(1,4));

}).play;

)


Ndef(\lon).clear;

























	