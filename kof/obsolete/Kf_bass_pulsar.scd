

(
Ndef(\pulsar).quant = 2.0;
Ndef(\pulsar).fadeTime = 2.0;
Ndef(\pulsar,{
	var z;
	z = SinOsc.ar((1..10)*0.513,LFTri.ar([45,45]),mul:0.35);

	Splay.ar(

		Compander.ar(
		z,z,0.5,1,0.01
		)
	).clip(-1,1)
}).play;

)