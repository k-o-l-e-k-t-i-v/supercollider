

(
Ndef(\weird_tune).quant = 2.0;
Ndef(\weird_tune).fadeTime = 2.0;

Ndef(\weird_tune,{

	~mm = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,4,2])),[1,1,1.5,2,4,8,1,2,4,8]);


	~base = [432,432.1] / (1+(1/~mm));//(1+(1/~mm));
	~m = Select.kr(Stepper.kr(Impulse.kr(1/[4,2])),[2,4,1.5,3,1,0.5,1,2,4,8]);
	~f = ~base * 4 * ~m / (2 ** LFSaw.ar(4/[1,2,4,8,16,32,64,128]).range(1,8).round(~m));

	Splay.ar(
		FreeVerb.ar(
			Vibrato.ar(
				(SinOsc.ar(~f+((1..10)/8.0),((1..10)/pi),mul:0.5) +
					LFCub.ar(~f/~m+((1..10)/4.0),((10..20)/2pi),mul:0.9)).softclip *
				Pulse.ar(4/[1,2,4,8])
				,[4,5,6,7],0.33).softclip
			,0.33,20)
		,0.75,0.65)}).play;
)