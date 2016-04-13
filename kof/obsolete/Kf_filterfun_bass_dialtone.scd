// moc pekne
(
Ndef(\b).quant = 2.0;
Ndef(\b).fadeTime = 4.0;

Ndef(\b,{
	var s;
	s = BBandPass.ar(
		SinOsc.ar(44+8800/(LFNoise0.ar((16/[2,3,5,8,13,21])).range(1,32).round([1,1.5,2,4,8]).squared*2)) *
		LFSaw.ar(8/[2,3,5,8,13,21]).squared * 12	,SinOsc.ar(11.1).range(22,8800).lag(1),SinOsc.ar(1/[4,2.1]).range(0.01,0.7)) +

	BBandPass.ar(
		HPF.ar((WhiteNoise.ar({ExpRand()/2.0}!4) * Pulse.ar(4/[1,2,2,4])),[1000,2000,8000,16000])

		,SinOsc.ar(11).range(1000,16000).lag(1),SinOsc.ar(2/[4,2.1]).range(0.01,0.7));

	Splay.ar(
		FreeVerb.ar(
			Compander.ar(s,s,0.75,1,0.5,0.01,[0.01,0.1,0.5]);
			,0.1,100)
).clip(-1,1)}).play;
)

Ndef(\b).stop(5);