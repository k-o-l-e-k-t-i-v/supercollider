p=ProxySpace.push(s);
(
~a={ var sig = LFSaw.ar(44*(_*1.5!8)+SinOsc.ar(1/(1..8)).range(-4,4));
	sig = BMoog.ar(sig,LFSaw.ar(8/(1..8)).range(800,5));
	sig = sig + LFSaw.ar(44.1*[1,2,4,1.5,1.25,1.125,4,8]);
	sig = sig + SinOsc.ar([4410,8820,17660]+LFSaw.ar(1/(1..10)).range(1000,-100),mul:0.1);
	sig = BPF.ar(sig,LFSaw.ar(1/8/(1..8)).exprange(44.001,18000),0.2)/2;
	sig = CombN.ar(sig,0.4,(0.1)*(_*1.68133!8),2);
	sig = FreeVerb.ar(sig,0.33,1.5);
	sig = CompanderD.ar(sig,0.5,1/1.25,1);
	sig= Pan2.ar(Mix.ar(sig),LFCub.ar(4).range(-0.5,0.5));
};
~a.fadeTime=2;
~a.play;
)

//this is insane 