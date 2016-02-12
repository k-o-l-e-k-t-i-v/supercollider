
(
Ndef(\dude_say,{
	var dust;
	dust = Impulse.ar(8/[1,2,4,8]+LFNoise0.ar(8).range(0.001,0.002));
	Splay.ar(
		GVerb.ar(
		AllpassC.ar(
				(WhiteNoise.ar(SinOsc.ar(0.1).range(0.01,0.2))*LFPulse.ar(8/[1,2,4,8])) +
				(Gendy1.ar(1,1,1,1,22,880,mul:0.01) * LFPulse.ar(8/[1,2,4,8])) +
			SinOsc.ar(LFPulse.ar(dust).exprange(1.00001,45.00001)) * Decay.ar(dust,0.33)
			,1.5,0.0033 + dust/100.0+(SinOsc.ar([4.4,5.5]).abs/10000.0),1.5)
			,2,3,0.5,0.5,SinOsc.kr(0.11).range(10,30),SinOsc.kr(0.0011).range(0.01,0.9),SinOsc.kr(0.011).range(0.01,0.9),SinOsc.kr(0.01).range(0.01,0.9))
)}).play;
)


//hawt! love the name *_*