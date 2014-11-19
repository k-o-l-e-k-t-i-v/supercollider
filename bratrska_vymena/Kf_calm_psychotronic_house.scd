

///////////////////////////////////////////////////////////////
(
Ndef(\bass).quant = 2.0;
Ndef(\bass,{
	~s = Select.kr(Stepper.kr(Impulse.kr(1/4),max:8),[1.5,1.5,1.25,1.125,1,1.5,1.25,1.125,0.5]*1pi).lag(0.5);
	~base = [432,432/1.5] / ~s;
	~r = 1/2/[1,2,4,8,16,32];
	Splay.ar(
		Resonz.ar(
			LFSaw.ar(Decay.ar(Impulse.ar(~r)).range(~base,[3.1,3])) * Decay.ar(Impulse.ar(~r*8),0.75)
			,Decay.ar(Impulse.ar(~r*2)).range([3.1,3.2],~base))
)}).play;

Ndef(\bass)[1] = \filtera -> {|in| AllpassC.ar(Vibrato.ar(in,[4,5,6,7],0.5),2,0.0133,2)};
)

///////////////////////////////////////////////////////////////

(
Ndef(\mid).quant = 2.0;
Ndef(\mid,{
	~s = Select.kr(Stepper.kr(Impulse.kr(1/4),max:8),[1.5,1.5,1.25,1.125,1,1.5,1.25,1.125,0.5]*1pi).lag(0.5);
	~base = [432,432/1.5] / ~s * 4;
	~r = 1/2/[1,2,4,8,16,32];
	Splay.ar(
		Resonz.ar(
			SinOsc.ar(Decay.ar(Impulse.ar(~r)).range(~base,[3.1,3])) * Decay.ar(Impulse.ar(~r*8),0.75)
			,Decay.ar(Impulse.ar(~r*2)).range([3.1,3.2],~base))
)}).play;

Ndef(\mid)[1] = \filterb -> {|in| AllpassC.ar(Vibrato.ar(in,[4,5,6,7],0.5),2,0.0133,2)};
)

///////////////////////////////////////////////////////////////
(
Ndef(\high).quant = 2.0;
Ndef(\high).fadeTime = 4.0;
Ndef(\high,{Splay.ar(
	~f = [1,1.25,2,1.125] * 432 * [1.25,1.5,0.25,1.5,0.5] * Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8])),[1,2,4,2,1.5,1.25,1,2,4]*pi);
	SinOsc.ar([~f,~f+0.1]) * LFSaw.ar(1/16/[1,2,3,5,8],mul:0.25).squared * Decay.ar(Impulse.ar(16/[1,2,3,8,5]),0.15)

)}).play;
Ndef(\high)[1] = \filterc -> {|in| AllpassC.ar(Resonz.ar(Vibrato.ar(in,[4,5,6,7],0.15),~f,SinOsc.ar(1/32/[1,2,4,8,16]).range(0.02,3)),0.2,0.133,1)};
)

///////////////////////////////////////////////////////////////
(
Ndef(\bck).quant = 2.0;
Ndef(\bck).fadeTime = 4.0;
Ndef(\bck,{Splay.ar(
	~f = [1,1.25,2,1.125] * 432 * [1.25,1.5,0.25,1.5,0.5] / Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8])),[1,2,4,2,1.5,1.25,1,2,4]*pi);
	LFSaw.ar([~f,~f+0.1]) * LFSaw.ar(1/16/[1,2,3,5,8],mul:0.1725).squared * Decay.ar(Impulse.ar(8/[1,2,3,8,5]),0.75)

)}).play;
Ndef(\bck)[1] = \filterd -> {|in| AllpassC.ar(Resonz.ar(Vibrato.ar(in,[4,5,6,7],0.15),~f,SinOsc.ar(1/16/[1,2,4,8,16]).range(0.02,3)),0.2,0.133,1)};
)

///////////////////////////////////////////////////////////////
(
Ndef(\kick).quant = 2.0;

Ndef(\kick,{
	~r = 4/[1,2,4];
	Splay.ar(
		CombN.ar(
			Vibrato.ar(LFPar.ar(Decay.ar(Impulse.ar(~r),1/~r).range(133.33,[43,44]),mul:0.1735),[4,5,6,7,8],0.2) * Decay.ar(Impulse.ar(~r),1/~r)
			,1,0.02+(LFNoise1.ar(1!4).lag(0.25)/10000.0),1.5)
)}).play;
)

///////////////////////////////////////////////////////////////

(
Ndef(\hat).quant = 2.0;
Ndef(\hat).fadeTime = 2.0;

Ndef(\hat,{
	~r = 8/[1,2,3,8];
	Splay.ar(
		CombN.ar(
			Vibrato.ar(BPF.ar(WhiteNoise.ar(1!2),LFNoise1.ar(1!4).range(2000,12000).round(1000).lag(0.1),mul:0.1235),[5,6,7,8],0.7) * Decay.ar(Impulse.ar(~r),1/~r)
			,1,0.25+LFNoise1.ar(1!4).range(0.25,1).round(0.125),4)
)}).play;
)



///////////////////////////////////////////////////////////////


(
Ndef(\whales).quant = 2.0;
Ndef(\whales).fadeTime = 2.0;

Ndef(\whales,{
	~r = 1/8/[1,2,3,8];
	Splay.ar(
		CombN.ar(
			SinOsc.ar((LFSaw.ar(4/[1,2,4,8])).squared.range(2200,22000),LFNoise1.ar(16!4).range(-8pi,8pi).round(0.1).lag(0.5),mul:0.25) * Decay.ar(Impulse.ar(~r),1/~r)
			,1,0.25+LFNoise1.ar(1!4).range(0.25,1).round(0.125),4).distort
)}).play;
)

/////////////////////////////////////////////////////////////////