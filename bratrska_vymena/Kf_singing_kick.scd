(
Ndef(\1).quant = 4.0;
Ndef(\1).quant = 2.0;
Ndef(\1,{
	Splay.ar(
		AllpassC.ar(
			SinOsc.ar([55,55.5]).tanh
			,0.1,TExpRand.ar(0.0002,0.05,Impulse.ar(4!4)).lag(1/2000))
		* Pulse.ar(4/[1,2,2,4])
)}).play;
)


/// 2nd derivation


(
Ndef(\2).quant = 4.0;
Ndef(\2).quant = 2.0;
Ndef(\2,{
	Splay.ar(
		AllpassC.ar(	(LFSaw.ar(TExpRand.ar(43.2,432,Impulse.ar(8!4)).round(432/[1,2,4,8]).lag(1/40) ,mul:0.15))
			,0.1,TExpRand.ar(0.0002,0.5,Impulse.ar(4!4)).lag(1/40))
		* Pulse.ar(4/[1,2,2,4])


).softclip}).play;
)

