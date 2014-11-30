
(
Ndef(\dark_kick).quant = 2.0;
Ndef(\dark_kick).fadeTime = 2.0;

Ndef(\dark_kick,{Splay.ar(
	FreeVerb.ar(
		Delay2.ar(
			CombN.ar(
				SinOsc.ar(LFSaw.ar([4.4,5.5]).range(44,99)) * LFPulse.ar(4/[1,2,4,8]);
				,1,0.133,0.5)
		)
		,0.33,2,0.5)
)}).play;
)

(

Ndef(\tone).quant = 2.0;
Ndef(\tone).fadeTime = 2.0;

Ndef(\tone,{Splay.ar(
	FreeVerb.ar(
		Delay2.ar(
			CombN.ar(
				Vibrato.ar(
					SinOsc.ar(43.2*([1,2,4,8,1.5,6]*pi),mul:0.25) * LFSaw.ar(1/2/[1,2,3,5,8,13])
					,[4,5,6,7],0.3)
				,1,0.133,0.5)
		)
		,0.33,2,0.5)
)}).play;
)

(

Ndef(\tone2).quant = 2.0;
Ndef(\tone2).fadeTime = 2.0;

Ndef(\tone2,{
	~melody = Select.kr(Stepper.kr(Impulse.kr(1/8,[0,0.5])),[1,1,1.5,1.25,1.125,0.5,1,2,3]*pi);
	Splay.ar(
	FreeVerb.ar(
		Delay2.ar(
			CombN.ar(
				Vibrato.ar(
					LFTri.ar(4320/1.5/([1,2,4,8,1.25,3]*~melody),mul:0.25) * LFSaw.ar(1/8/[1,2,3,5,8,13])
					,[4,5,6,7],0.3)
				,1,0.133,0.5)
		)
		,0.33,2,0.5)
)}).play;
)



(

Ndef(\hiss).quant = 2.0;
Ndef(\hiss).fadeTime = 2.0;

Ndef(\hiss,{Splay.ar(
	FreeVerb.ar(
		Delay2.ar(
			CombN.ar(
				Vibrato.ar(
					WhiteNoise.ar(0.3!4) * Decay.ar(Impulse.ar(4/[1,2,3,5,8,13]),0.2).squared
					,[4,5,6,7],0.3)
				,1,0.133,0.5)
		)
		,0.33,1,0.5)
)}).play;
)