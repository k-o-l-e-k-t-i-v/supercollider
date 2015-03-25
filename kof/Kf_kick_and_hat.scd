(
Ndef(\kick).quant = 2.0;

Ndef(\kick,{
	var r;
	r = 4/[1,2,4];
	Splay.ar(
		CombN.ar(
			Vibrato.ar(LFPar.ar(Decay.ar(Impulse.ar(r),1/r).range(133.33,[43,44])),[4,5,6,7,8],0.2) * Decay.ar(Impulse.ar(r),1/r)
			,1,0.02+(LFNoise1.ar(1!4).lag(0.25)/10000.0),1.5)
)}).play;
)



(
Ndef(\hat).quant = 2.0;
Ndef(\hat).fadeTime = 2.0;

Ndef(\hat,{
	var r;
	r = 8/[1,2,3,8];
	Splay.ar(
		CombN.ar(
			Vibrato.ar(BPF.ar(WhiteNoise.ar(1!2),LFNoise1.ar(1!4).range(2000,12000).round(1000).lag(0.1)),[5,6,7,8],0.7) * Decay.ar(Impulse.ar(r),1/r)
			,1,0.25+LFNoise1.ar(1!4).range(0.25,1).round(0.125),4)
)}).play;
)


//this hat is amazing ^_^