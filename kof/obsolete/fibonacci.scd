s.boot;


(
var fibonacci = 1/[1,1,2,3,5,8,13,21,34,55,89];

Ndef(\a,{|freq = 440| Splay.ar(CombN.ar(Pulse.ar((fibonacci) * 220/60).clip(-1,1) *
	SinOsc.ar((fibonacci)*freq.lag(0.2)) *
	SinOsc.ar((fibonacci)).range(0.0,1.0),0.2,0.2,1.0),0.5,0.2)}).play;

Tdef(\tt,{
	var i = 0;
	var fibonacci = 1/[1,1,2,3,5,8,13,21,34,55,89];
	loop{
		Ndef(\a).set(\freq,(220/(fibonacci.wrapAt(i))));
		i = i + 1;
	1.0.wait;
	}
}).play;
)