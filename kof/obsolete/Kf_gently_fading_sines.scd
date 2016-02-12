(

Ndef(\1,{

	var mod,mod2,vib;


	mod = LFDNoise0.ar(1/2/fib(12,4,5)).range(0.25,8).round(2**(1..8)/16);
	mod2 = LFDNoise0.ar(1/2/fib(12,4,5)).range(0.25,8).round(2**(1..8)/16);

	vib = SinOsc.ar(1/2/fib(12,4,5));

	Splay.ar(
	CombL.ar(
		SinOsc.ar(4320 / (mod*8pi/mod2),vib.range(0,2pi)) * LFSaw.ar(1/2/fib(12,4,5)).squared
		,0.01,4,8)
	,0.7,1)}).play;
)


s.scope;

//very nice!