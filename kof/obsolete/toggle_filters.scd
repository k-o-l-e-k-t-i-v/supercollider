

(
~togl.play;
~togl.quant=2;
~togl={
	var sig,t;
	t = Impulse.ar(8/[1,2,4,8,1,2,3,4,5,6]);

	sig= LFSaw.ar(43.22);

	sig = sig + (ToggleFF.ar(t)[0] * CombN.ar(sig,0.25,0.25,10)) /2.0;
	sig = sig + (ToggleFF.ar(t)[1] * FreeVerb.ar(sig,0.29,10))/2.0;
	sig = sig + (ToggleFF.ar(t)[2] * FreeVerb.ar(sig,0.29,100))/2.0;
	sig = sig + (ToggleFF.ar(t)[3] * FreeVerb.ar(sig,0.29,1))/2.0;
	sig = sig + (ToggleFF.ar(t)[4] * FreeVerb.ar(sig,0.29,0.5))/2.0;
	sig = sig + (ToggleFF.ar(t)[5] * FreeVerb.ar(sig,0.29,0.1))/2.0;


	Splay.ar(sig,0.1,1);


};
)