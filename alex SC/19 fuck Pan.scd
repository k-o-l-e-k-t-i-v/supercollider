s.scope(2);

(

Ndef(\zum).fadeTime=1;
Ndef(\zum).quant=1;

Ndef(\zum, {

	~sig1={CombN.ar(Pan2.ar(SinOsc.ar(55,0,SinOsc.kr(1).range(0,1))*Blip.ar(1,1200),Phasor.kr(Impulse.ar(1),0.0005)*(-1)))}.play;
~sig2={CombN.ar(Pan2.ar(SinOsc.ar(55,0,SinOsc.kr(1).range(0,1))*Blip.ar(1,1200),Phasor.kr(Impulse.ar(1),0.0005)))}.play;
	Mix([~sig1, ~sig2],2);
}).play;

)


(
//test
{CombN.ar(Pan2.ar(SinOsc.ar(55,0,SinOsc.kr(1).range(0,1))*Blip.ar(1,1200),Phasor.kr(Impulse.ar(1),0.0005)*(-1)))}.play;
{CombN.ar(Pan2.ar(SinOsc.ar(55,0,SinOsc.kr(1).range(0,1))*Blip.ar(1,1200),Phasor.kr(Impulse.ar(1),0.0005)*(-1)))}.play;
//{Pan2.ar(SinOsc.ar(800)*Pulse.ar(3,0.5),SinOsc.kr(0.5).range(0,1),1)}.play;
)

