m = JMix(4);
m.gui;
m.print;

(
// Pdef(\testDrum).fadeTime = 4;
Pdef(\testDrum,
	Pbind(\instrument, \default, \out, 0,
		// \group, m.inGroup,
		\amp, 0.3,
		\dur, Pseq([Pn(2,30), 0.25,0.25,Rest(4)], inf), \legato, Pseq([0.17,0.15,0.16,0.19], inf),
		\octave, Pseq([Pn(2,30), 4,4,1], inf), \degree, Pseq([3,3,3,3b,2], inf)
	)
).play;
)
Pdef(\testDrum).stop;
)

(
Ndef(\testSin, {
	var aEnv, freq, osc;
	aEnv = Decay2.kr(Impulse.kr(4),0.15,0.85, 0.5);
	freq = Duty.kr(Dseq([4,1,4,2], inf), 0, Dseq([200,220,240,280], inf));
	osc = SinOsc.ar(freq!2,0,SinOsc.kr(0.5,0,0.2,0.8)) * aEnv;
	}
);
)
Ndef(\testSin).free;

c = NodeProxy.audio(s, 2);
c.play;
c.source =  Ndef(\testSin) ;

// c.fadeTime = 4;
c.source =  Pdef(\testDrum) ;
c.source =  Ndef(\testSin) ;
s.plotTree;
c.stop;

a = NodeProxy.new.play; // play to hardware output.
a.fadeTime = 2; // fadeTime specifies crossfade
// set the source
a.source = { \testDrum };
a.source = { SinOsc.ar([350, 351.3], 0, 0.2) };
a.source = { Pulse.ar([350, 351.3] / 4, 0.4) * 0.2 };
a.source = Pbind(\dur, 0.03, \freq, Pbrown(0, 1, 0.1, inf).linexp(0, 1, 200, 350));

b = NodeProxy.new;
a.source = { Ringz.ar(b.ar, [350, 351.3] * 8, 0.2) * 4 };
b.source = { Impulse.ar([5, 7]/2, [0, 0.5]) };

a.clear(3); // clear after 3 seconds
b.clear(3);