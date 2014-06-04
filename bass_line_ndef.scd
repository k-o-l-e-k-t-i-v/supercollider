
(
s.boot;
)

(
Ndef(\a).fadeTime = 1.2;

Ndef(\a,{|freq = 77,voice = 33| DelayN.ar(BBandPass.ar( Pulse.ar([3.3,2.2,1.1,0.55,6.6,13.2]).clip() * Blip.ar(SinOsc.kr(3.31).exprange(freq,freq+10.0),voice,1.0),SinOsc.kr(1.1).exprange(77.0,444.0),0.95),1.8,1.252)}).playN([0,1]);
)

(
Tdef(\tt,{
	var i = 0;
	loop{
		Ndef(\a).set(\freq,[60,63,65,67,69].wrapAt(i).midicps/4.0);
		Ndef(\a).set(\voice,[10,15,20,70,5,12,10,10,10].wrapAt(i));
		i = i + 3;
		2.2.wait();
	}
}).play;
)