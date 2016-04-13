


(
~a.quant=2;
~a={
	var harm = Harmonics.new(32);
	var sig = LFSaw.ar((harm.formant(1,40)*2200).scramble/2pi,mul:0.5);
	sig = SelectX.ar(LFSaw.ar(1/16/4).range(0,32),sig);
	sig = MoogFF.ar(sig,LFSaw.ar(1/8/[1,2,4]).exprange(0.00001,1)**2 * 3000+22);
	sig = GVerb.ar(sig)/4+sig;

	Splay.ar(sig,0.1);

};
~a.mold(2);
~a.play;
)