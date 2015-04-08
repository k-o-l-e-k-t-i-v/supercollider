(
~h={var s, b;

	s=(LFSaw.ar(105).lag(0.2)+LFPulse.ar(65))*LFSaw.ar(2,add:BrownNoise.ar(0.1));
	s=Pan2.ar(Limiter.ar(s,0.4),SinOsc.kr(0.125));
	s=GVerb.ar(s,100,1,0);


};
~h.play;
)