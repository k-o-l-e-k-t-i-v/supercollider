s.boot;
s.scope;

(
q = Bus.control(s);
w = Bus.control(s);
e = Bus.control(s);


SynthDef.new("tone2", { arg freq = 220;

	var env, outFreq, noise;
	env = EnvGen.ar(  Env([0,1,0.6,0],[1.5, 0.1, 5.5]),  doneAction: 2);
	outFreq = SinOsc.kr(0.25,0,freq/3,freq/2);
	noise = LFNoise0.kr(200,0.35,0.4);

	Out.ar(0, SinOsc.ar( [outFreq*noise , (outFreq*noise)+2], 0 ,0.4)  * env);
}).add;


SynthDef("tone1", { arg freq = 220, vol = 0.2;

	Out.ar(0, SinOsc.ar([freq,freq+2], 0 , vol/3, vol/2)  * SinOsc.ar(0.05,0,vol/2,vol/2));
}).add;


SynthDef("bum", { arg freq = 120, vol = 0.2;

	Out.ar(0, (SinOsc.ar([freq,freq+2], 0, vol) + SinOsc.ar(0.5, 0, 0.5)) * SinOsc.kr(8,0,0.3,0.35));
}).add;
)

(
	x = Synth("bum", [\freq, 80, \vol, 0.60,]);
	x.map(\freq, q);

	y = Synth("tone1", [\freq, 220]);
	y.map(\freq, w);
	y.map(\vol, e);
)

(
Tdef (\a, {


	loop {
		e.set(0.60);
		q.set(120);
		w.set(180);

		3.wait;

		z = Synth("tone2", [\freq,300]);//[\freq,180.rrand(300)]);
		1.wait;

		q.set(155);
		w.set(130);
		0.5.wait;

		e.set(0.08);
		1.wait;
	}
}).play
);

Tdef(\a).stop(1);
x.free; y.free;
