(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
	var mod,s;
	mod = 	CombN.ar( SinOsc.ar( (_*LFDNoise1.ar(1/16!4).range(0.01,32)!8) ,mul:0.5) , 0.2 , LFDNoise1.ar(8!2).range(0.0002,2),2	).range(-2pi,2pi);

	s = SinOsc.ar([110,220,440,880]*2,mod,0.75);

	s = BBandStop.ar(s,LFDNoise1.ar(16!16).range(33,22000),0.15,0.125) * Pulse.ar(8/[1,2,2,4]).squared;

	Splay.ar(

		CompanderD.ar(
			s,0.5,0.25,1) ;
		,1,0.5).clip(-1,1)}).play;
)


s.scope


{LFPulse.ar(1111)}.plot


