(
Ndef(\a).fadeTime = 8.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{

	~m = Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,2,4,8,1.5,2,4,8]);

	~s = Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,4,8])),[1,2,4,8,1.5,2,4,8] * 8pi);
	~a = CombN.ar(Vibrato.ar( LFPulse.ar(1/4/[1,2,4,8,16,32,64]),1/[1,2,4,8],0.125,8).range(0,4).round(1) ** LFPulse.ar(1/[1,2,4,8]).round(0.5).range(1,8) / ~s,1/[1,2,4,8],0.25);

	Splay.ar(
		FreeVerb.ar(
			Vibrato.ar(
			SinOsc.ar([1,1+(1/~m)]*~a,~a.lag(0.001)/8pi) + LFSaw.ar([1,1+(1/~m)]*~a/2,~a.lag(0.001)/8pi,mul:0.2) * Decay.ar(Impulse.ar(4/[1,2,2,4]),SinOsc.ar((1..10)/100.1).range(0,1));
			,[4,5,6,7],0.2)
		,0.33,100)
,1,0.5)}).play;
)
