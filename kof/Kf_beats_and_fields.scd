
// nice trick  "CTRL + /" to comment out line.. nice for livecoding

(
Ndef(\a).fadeTime = 1.0;
Ndef(\a).quant = 1;
Ndef(\a,{|tempo = 1,sel = 4|



	//////// signal ////////////
	var s;
	s =
	SinOsc.ar(44) +
	CombN.ar((LFPulse.ar(tempo*1/[1,4,2,3],[0,0.25,0,0.25]))) *
	Pulse.ar(tempo*4/[1,2,3,4]) +
	Vibrato.ar(LFCub.ar(4320/(pi*sel)*([1.5,16,8,1.5,8,16,32]),mul:0.75) * LFSaw.ar(1/4/[4,8,16,32,64,128]).squared,[4,5,6,7],0.2) +
	(SinOsc.ar([77,99]) + SinOsc.ar([4320,4320*2pi,4320/2pi],mul:0.2) * Decay.ar(Impulse.ar(1/4/[1,2,4]))) +
	0;

	////////// band pass /////////////


	s = BBandPass.ar(s,LFNoise0.ar(4!2).range(44,4320*2),1,mul:0.5,add:s);

	///////// add hisses /////////////

	s = s + RHPF.ar(Decay.ar(Impulse.ar(tempo*4/[1,2,4,8]),LFNoise0.ar(4!4).range(0.01,0.2)) * WhiteNoise.ar(0.5!4),LFNoise0.ar(4!4).range(432,16000));

	////////// compressor ///////////

	s = Compander.ar(s,s,0.75,1,0.25,0.01,0.01);

	Splay.ar(s).clip(-1,1)};

).play;

// Ndef(\a)[1] = \filter -> {|in| GVerb.ar(in,5,mul:0.25) + (in/3*2)};
)



///// post-param mods

Ndef(\a).lag(\sel,0.02,\tempo,4);
Ndef(\a).set(\sel,16);

// Ndef(\ctla,{SinOsc.ar(1/16/[1,2]).range(1,8).round(2)});
// Ndef(\ctla).quant = 2.0;
// Ndef(\ctla).fadeTime  = 4.0;
// Ndef(\a).map(\sel,Ndef(\ctla));

Ndef(\a).set(\tempo,1);
Ndef(\a).set(\sel,16);

