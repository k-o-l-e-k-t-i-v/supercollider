
(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
	SinOsc.ar(4320/([1,2,4,8]*pi)) * LFPulse.ar(4/[1,2,4,8])
});

Ndef(\a).mold(4);
Ndef(\a).numChannels.postln;


Ndef(\a)[1] = \filter -> {|in| CombN.ar(in,1/[1,2,4,8],LFSaw.ar(1/16/[1,2,4,8]).range(0.01,0.1),[1,2,4,8])};
Ndef(\a)[2] = \filter -> {|in| Vibrato.ar(in,[1,2,4,5],0.2)};
Ndef(\a)[3] = \filter -> {|in| FreeVerb.ar(in,0.7,100)};
Ndef(\a)[4] = \filter -> {|in| LFPulse.ar(in.range(432/8,432/2)).lag(0.01)};
// Ndef(\a)[5] = \filter -> {|in| BBandPass.ar(in*2,LFDNoise1.ar(1!8,4400))};
// Ndef(\a)[5] = \filter -> {|in| Splay.ar(in,SinOsc.ar(4/[1,2,4,8]).range(0.1,1),0.25).clip(-1,1)};
)
