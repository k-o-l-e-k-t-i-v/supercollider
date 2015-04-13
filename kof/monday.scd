


(
~a={
	var env = Decay.ar(Impulse.ar(1/2),4);
	var sig = PinkNoise.ar(0.5!4) + SinOsc.ar(44*[1,2,4,8]*pi);


	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = CombN.ar(sig,0.01*(1..8),0.01*(1..8),8);
	sig = Normalizer.ar(sig,0.5);
	sig = BBandPass.ar(sig,LFTri.ar(1/32/[1,2,4,8]).exprange(16000.0001,33),0.5);
	sig = HPF.ar(sig,150);
	sig = GVerb.ar(sig)/1.75+sig/1.25;
	sig = CompanderD.ar(sig,0.75,1/2,1/4);

	env = Mix.fill(2,env);
	sig = sig + (SinOsc.ar(50*(env**10*0.001+1),mul:0.95) * env);
	sig = sig + (SinOsc.ar(150*(env**10*0.001+1),mul:0.5) * env);

	sig = CompanderD.ar(sig,0.75,1/1.5,1/1.5);


	Splay.ar(sig,0.3);

};
~a.play;
)