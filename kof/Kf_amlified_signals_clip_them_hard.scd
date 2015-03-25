(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;
Ndef(\a,{
	var mod,a;
	mod = Select.kr(Stepper.ar(LFSaw.ar(1/2/[2,4,8,16,32,64])),[1,2,1.5,2,3,2,1.25,4,8]);
	a = RLPF.ar(
		BBandStop.ar(
			LFSaw.ar(1/2/[2,4,8,16,32,64]).squared *
			SinOsc.ar([432/4,432/16,432/8]/(mod/2pi),LFTri.ar(1/[2,4,8,16]).range(-1,1)) +
			LFSaw.ar([7777,7777]/(mod/2pi),mul:0.05) * LFPulse.ar(4*[1,2,2,4]).squared
			,LFNoise0.ar(8!8).range(22,18000).lag(1/8),0.21) * 0.5
		,18000) +
	HPF.ar(WhiteNoise.ar(LFSaw.ar(1/4/[1,2,3,8]).squared*0.1),8000+LFNoise0.ar(4!4).range(0,8000));

	Splay.ar(
		// GVerb.ar(
		LPF.ar(
			// CombN.ar(
				Compander.ar(a,a,0.5,1,0.33,0.01,0.01)
				// ,1,0.5,16)
			,18000)
			// ,2,3,drylevel:1,mul:0.2)
).clip(-0.99,0.99)}).play;
)