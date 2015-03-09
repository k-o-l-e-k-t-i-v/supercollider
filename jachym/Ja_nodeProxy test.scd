s.boot;
// m = JMix(4);
// m.gui;
// m.print;

(
c = NodeProxy.new(s, \audio);

b = Bus.audio(s,4);
g = Group.basicNew(s, 900);
s.sendBundle(nil, g.newMsg(addAction: \addToTail););

x = Monitor.new;
c.group = g;
c.bus = b;
c.monitor = x;

x.play(
	fromIndex: c.bus.index, fromNumChannels: 4,
	toIndex:0, toNumChannels:2
);
// c.play;
// c.numChannels.plot;
s.plotTree;
)

(
// Pdef(\testDrum).fadeTime = 4;
Pdef(\testDrum,
	Pbind(
		\instrument, \default,
		\amp, 0.3,
		\dur, 0.5,
		\legato, [0.2,0.35,1.3,3.5], // 4-buses
		\octave, Pseq([Pn(2,30), 4,4,1], inf), \degree, Pseq([3,3,3,3b,2], inf)
	);
);
Ndef(\testSin, {
	var aEnv, freq, osc;
	aEnv = Decay2.kr(Impulse.kr(4),0.15,0.85, 0.5);
	freq = Duty.kr(Dseq([4,1,4,2], inf), 0, Dseq([200,220,240,280], inf));
	osc = SinOsc.ar(freq!4,0,SinOsc.kr(0.5,0,0.2,0.8)) * aEnv; // 4-buses
	}
);
)
(

)
// Pdef(\testDrum).sources.postln;
c.source = Ndef(\testSin);
c.source = Pdef(\testDrum);
c.stop;

Pdef(\testDrum).stop;
Ndef(\testSin).free;
