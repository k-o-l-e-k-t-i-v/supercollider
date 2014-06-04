
(
s.boot;
)

(
Ndef(\a).fadeTime = 0.02;

Ndef(\a,{|freq = 77,voice = 33| Splay.ar(DelayN.ar(BBandPass.ar( Pulse.ar([3.3,2.2,1.1,0.55,6.6,13.2]).clip() * Blip.ar(SinOsc.kr(3.3).exprange(freq,freq+2.0),voice,1.0),SinOsc.kr(0.3).exprange(77.0,444.0),0.95),0.3,0.252))}).playN([0,1]);

)


(
Tdef(\tt,{
	var i = 0;
	loop{
		Ndef(\a).set(\freq,[60,63,65,67,69].wrapAt(i).midicps/4.0);
		Ndef(\a).set(\voice,[10,15,12,12,5,12,10,10].wrapAt(i));
		i = i + 3;
		2.2.wait();
	}
}).play;
)



(

Ndef(\b).fadeTime = 5.0;
// 8 ch magic
Ndef(\b,{Splay.ar(Pulse.ar(6.6*[2.0,0.5,0.25,0.0115,1.0,1.0,1.0,0.25]).clip() * SinOsc.ar(777+({ExpRand()*200.0}!8),{ExpRand()}!8,SinOsc.kr({ExpRand()*0.1}!8).exprange(0.1,0.74)))}).playN([0,1]);

)


s.scope;