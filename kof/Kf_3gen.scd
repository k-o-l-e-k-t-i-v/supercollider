s.boot;

//////////////////////

(
Ndef(\bass,{
	var f;
	Splay.ar(
		f = [55,56,57,58];
		MoogFF.ar(
			LFSaw.ar(f,{ExpRand()}!4)
			,SinOsc.ar(f/1.01).range(f/2,f*2))
	)
}).play;
)

//////////////////////

(
t = Tuning.young;
Ndef(\pinks,{
	Splay.ar(
		f = t.cents.at([1,2,7,11]) * pi * 1.5;
		FreeVerb.ar(
			MoogFF.ar(
				SinOsc.ar(f)
				,SinOsc.ar(f/2048.013).range(f/2,f*2))
			* Decay.ar(Dust.ar([1,2,4,8]/64),8)
		)
	)
}).play;
)

//////////////////////

(
Ndef(\dusts,{
	var trigs;
	Splay.ar(
		FreeVerb.ar(
			trigs = Decay.ar(Dust.ar([1,2,4,8,16,32,64]/64),{ExpRand()*8+1}!8);
			RHPF.ar(WhiteNoise.ar(0.5!8), {ExpRand()*11000}!8) * LFSaw.ar({ExpRand()*75}!8 + (1100*(trigs.exprange(0.001,1)+1))) * trigs
		,0.33,1)
	)
}).play;
)


/////////////////////