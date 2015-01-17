
(
b = Bus.control(s);


SynthDef("tone1", { arg freq = 220;
	var osc, env;
	osc = SinOsc.ar([freq, freq+2]);
	env = Line.kr(1,0,10,doneAction:2);
	Out.ar(0,osc * env);
}).add;
)

(

Tdef( \aLoop, {
	loop (
		{
			x = Synth("tone1");
			x.map(\freq,b);


			b.set(100);
			1.wait;

			b.set(130);
			0.75.wait;

			b.set(100);
			1.wait;

			b.set(120);
			4.wait;

			b.set(100);
			3.wait;

			x.free;
		}
	)

}).play;

)

Tdef(\aLoop).stop;



