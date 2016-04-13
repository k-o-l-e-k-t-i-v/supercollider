///////////////////////////////////////////////////
///  VIM rulezz  ////////  and this sound sucks ///
///////////////////////////////////////////////////


(
Ndef(\abrakadabra).fadeTime = 2.0;
Ndef(\abrakadabra).quant = 2.0;
Ndef(\abrakadabra,{
	var mod;
	mod = 0.25;
	Splay.ar(
		FreeVerb.ar(
			CombN.ar(
				SinOsc.ar(
					SinOsc.ar([4,5,6,7]).range(-18,18) +
					4320/mod/(2.0001**(1..12).scramble),mul:0.2).distort.distort *
				LFSaw.ar(1/(2**(1..12))).squared
				* Decay.ar(Impulse.ar(8/fib(12)),{ExpRand(0.2,1)}!12)
				,0.01,4,32)
			,0.133,10)
		,0.5,1)

}).play;
)

//what's VIM?