
(
b = Bus.control(s);


SynthDef("tone1", { arg freq = 220;
	var osc, imp;
	osc = SinOsc.ar([freq, freq+2]);

	Out.ar(0,osc);
}).add;


)

(

Tdef( \aLoop, {

	x = Synth("tone1");
	x.map(\freq,b);

	loop {

		b.set(100);
		0.25.wait;

		b.set(300);
		0.25.wait;
	}

}).play;
)


x.free; \aLoop.stop;

