
(
~pulse={
	var mod = Duty.kr([8,4],0,Dseq([1,1,2,1.5,1.25,2,4,1.125],inf));
	var sig = [
		LFPulse.ar(50!2*mod[0]),
		LFTri.ar(50!2*mod[1]),
		WhiteNoise.ar(0.5!2),
		SinOsc.ar(0)
	];

	sig = Select.ar(LFSaw.kr(1/4).range(0,sig.size+4.01),sig) / 4;

	sig = (SinOsc.ar(BrownNoise.ar(1!16).range(50,500).lag(1/32)) ) + sig;

	sig = Resonz.ar(sig,4320/(1..8),0.1) * 8;

	sig = PitchShift.ar(sig,0.2,Saw.ar(8/[1,2,4,8]).range(0.5,2));

	sig = sig + (SinOsc.ar(50!2,mul:0.3)*LFPulse.ar(1/2,0,1/2));

	sig = CompanderD.ar(sig,1/2,1/2,1/2) / 3 * 2;

	sig = GVerb.ar(sig)/4+sig/3;

	Splay.ar(sig.flat,0.1,0.5);
};
~pulse.quant=2;
~pulse.play;

)

//crashes everything// SC_PortAudioDriver: exception in real time: alloc failed, increase server's memory allocation (e.g. via ServerOptions)
//increased memory and still crashed :)

// ..this one is unusually CPU heavy, not worth sqeezing the server.. sounds quite bad
