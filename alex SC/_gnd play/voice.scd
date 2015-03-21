



///filters for voice 001
(
Ndef(\l).fadeTime=0.2;
Ndef(\l, {

	~s=AudioIn.ar(1);

	~s1=CombN.ar(~s*SinOsc.ar(0.25),0.01,0.01,4);
	~s1=GVerb.ar(~s1,1,damping:0);

	~s2=LPF.ar(~s,1800);
	~s2=~s*SinOsc.ar(500*(2..10));

	~s3=HPF.ar(CombN.ar(~s,0.2,0.002,0.5),100)+GrayNoise.ar(0.001)*Decay2.kr(Dust.kr(4),decayTime:1);


	//play from ~s1 to ~s3

	Mix.new([~s1]);

	}
).play;
)