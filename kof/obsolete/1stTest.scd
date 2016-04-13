s.boot;

(
Ndef(\a, {
	var osc1,osc2,osc3,osc4;

	osc1 = VarSaw.kr([0.5]);
	osc2 = SinOsc.kr([100]);
	osc3 = LFSaw.kr([1]);
	osc4 = SinOsc.kr([0.1]);

	SinOsc.ar( osc3.range(220,300),0, osc4.range(0.3,1) )
}).play;
)
Ndef(\a).stop(2);

(
Ndef(\c, {

	var osc1,osc2,osc3,osc4;

	osc1 = VarSaw.kr([0.5]);
	osc2 = SinOsc.kr([100]);
	osc3 = LFSaw.kr([1]);
	osc4 = SinOsc.kr([0.1]);

	SinOsc.ar( osc3.range(80,300),0, osc4.range(0,0.7))+SinOsc.ar(150,0,0.3);
}).play;
)
Ndef(\c).stop(2);

//do ndefu
Ndef(\scitani,{Ndef(\a).ar*Ndef(\c).ar}).play;

(
Ndef(\b, {
	SinOsc.ar( SinOsc.kr([4,4]).range(22,160), 0, SinOsc.kr([2,1]).range(0,1) )
});
)





Ndef(\b).play;

(

Ndef(\b).stop(2);
)