s.boot;

a = Ardour();

(
a.recToggle;
a.play;
Ndef(\a,{
	Splay.ar(
		SinOsc.ar(432/2pi*(1..8),mul:1/(1..8)) * Decay.ar(Impulse.ar(4/(1..8))).squared
		,0.5,1,0.5)
}).play;
)

(
a.stop;
s.freeAll;
)
