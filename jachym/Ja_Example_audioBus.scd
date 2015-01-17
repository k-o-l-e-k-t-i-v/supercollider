(
SynthDef("baseSin", { arg freq = 100, inBus;
	var tone;

	tone = SinOsc.ar(freq, 0,0.2);

	Out.ar(inBus,[tone,tone]);
}).add;

SynthDef("SawSin", { arg eBus, freq = 20;
	var source;
	var input = In.ar(eBus);

	source = LFSaw.ar(freq,0,0.25,0.5) * input;

	Out.ar(0,[source,source]);
}).add;


)



(
b = Bus.audio(s,1);

x = Synth.new("baseSin", [\inBus, b]);
y = Synth.after(x,"SawSin", [\eBus, b, \freq, 5]);
)


s.scope(2);

y.set(\freq,20);
y.set(\freq,5);
y.set(\freq,Env([5,200,5],[10,10],\exp));

x.free; y.free; b.free;


//(Env([5,200,5],[10,10],\exp)).postln;

/*
// Changing an Env while playing
(
SynthDef(\env, { arg i_outbus=0;
    var env, envctl;

    // make a dummy 8 segment envelope
    env = Env.newClear(8);

    // create a control argument array
    envctl = \env.kr( env.asArray );

    ReplaceOut.kr(i_outbus, EnvGen.kr(envctl, doneAction: 2));
}).add;
)

(
SynthDef(\sine, { |freq = 0|
    Out.ar(0, SinOsc.ar(freq, 0, 0.2));
}).add;
)

f = Bus.control(s, 1);
f.set(800);

// use f's control bus value for frequency
// i.e. *map* the control to read from the bus
a = Synth(\sine, [freq: f.asMap]);

Synth(\env, [i_outbus: f, env: Env([700, 900, 900, 800], [1, 1, 1]*0.4, \exp)]);

Synth(\env, [i_outbus: f, env: Env([1000, 1000, 800, 1000, 900, 1000], [1, 1, 1, 1, 1]*0.3, \step)]);

a.free;
f.free;
*/