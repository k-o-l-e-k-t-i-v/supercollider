(
~h={var s, b;

	s=(LFSaw.ar(105).lag(0.2)+LFPulse.ar(65))*LFSaw.ar(2,add:BrownNoise.ar(0.1));
	s=Pan2.ar(Limiter.ar(s,0.4),SinOsc.kr(0.125));
	s=GVerb.ar(s,100,1,0);


};
~h.play;
)

p=ProxySpace.push(s);
(
~q={var b, s1,s2,s3;
	b=2;

	s1=BPF.ar(GrayNoise.ar+BrownNoise.ar(0.8).clip(0.6,0.9),LFNoise2.kr(b*(0.25..1.5)).range(200,1200),LFNoise0.kr(0.125).range(0.0001,0.1));
	s1=BMoog.ar(s1,LFNoise1.kr(b*(1..20)).range(40,800),0.1,saturation:0.1,mode:2);

	s2=FreeVerb.ar(s1,room:1);
	s3=(LPF.ar(s1,150)+BrownNoise.ar(0.001))*Decay.kr(Impulse.kr(b*[0.25,0.75,1.5,1.25]));
	s3=FreeVerb.ar(s3,room:2,damp:0,room:2);



	Mix.new([s2*0.3,s3*7]);


};
~q.play;
)