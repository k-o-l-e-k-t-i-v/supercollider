//////////////////////////////////////////////////////

s.boot;

//////////////////////////////////////////////////////

(

Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;
Ndef(\a,{Splay.ar(

	~amp = SinOsc.kr((_*0.01!8)+0.01).range(0,1);

	~f = [99,100,55,66,88,77];
	RLPF.ar(
		LFPulse.ar(~f),
		LFSaw.ar(~f/4.01).range(~f/2,~f*2)
	) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),1) * ~amp;
)}).play;

)


//////////////////////////////////////////////////////

(

Ndef(\b).quant = 2.0;
Ndef(\b).fadeTime = 5.0;
Ndef(\b,{Splay.ar(

	~amp = SinOsc.kr((_*0.01!8)+0.01).range(0,1);

	~f = [999,1000,2000,4000,8000]/4;
	MoogFF.ar(
		LFCub.ar(~f,mul:0.75),
		LFSaw.ar(~f/4.01).range(~f/2,~f*2)
	) * Decay.ar(Impulse.ar(4/[1,2,3,5,8,13]),2) * (1-~amp);
)}).play;

)

//////////////////////////////////////////////////////

(

Ndef(\c).quant = 2.0;
Ndef(\c).fadeTime = 2.0;
Ndef(\c,{Splay.ar(

	~amp = SinOsc.kr((_*0.01!8)+0.01).range(0,1);

	~f = [999,1000,2000,4000,8000];
	RHPF.ar(
		PinkNoise.ar(2!8),
		LFSaw.ar(~f/4.13).range(~f/2,~f*2)
	) * Decay.ar(Impulse.ar(16/[1,1,2,3,5,8,13]),0.1) * (1-~amp);
)}).play;

)


//////////////////////////////////////////////////////

(

Ndef(\d).quant = 2.0;
Ndef(\d).fadeTime = 2.0;
Ndef(\d,{Splay.ar(

	~amp = SinOsc.kr((_*0.01!8)+0.01).range(0,1);

	~f = [200,400,800,1600,110]/2;
	MoogFF.ar(
		LFPar.ar(~f,mul:0.3),
		SinOsc.ar(~f/1.01).range(~f/2,~f*2)
	) * ~amp;
)}).play;


)

//////////////////////////////////////////////////////

NdefMixer(s)