(
SynthDef(\baseSin, { |aBus, freq = 440, vol = 0.5, dt = 0.5|
	var tone, env;
	env = EnvGen.ar(Env.linen(0.02, 0.0, 0.1),doneAction:2);
	tone = SinOsc.ar(freq, 0, env);
	//tone = tone
	Out.ar(b, tone ! 2);
}).store;
)
(
SynthDef(\Echo, { |out, in, mx = 0.33, roomSize = 0.1|
	var efx;
	var audio = In.ar(b,2); //In.ar([20,21],2);

	efx = FreeVerb.ar(audio,mx,room:roomSize);

	Out.ar(0,efx);
}).store;
)

b = Bus.audio(numChannels: 2);

//a = Synth(\Echo);
//a = Synth.after(1, \Echo);


//a.set(\roomSize, 5, \mx, 0.9);
b.free;
(
Pdef(\loopDrum1, {
	Pbind( \instrument, \baseSin,
		\freq, Pseq([Pn(220/2,4)],inf),
		\vol, 0.1,
		\dur, Pseq([1],inf),
		\dt, Pseq([0.3],inf)
		//\aBus, ~b
	)
}).play(quant:4)
)

(
Pdef(\piano, {
	Pbind(
		\midinote, Pseq([66, 71, 73, 74, 66, 64, 73, 71, 66, 74, 73], inf),
		\dur, Pseq([1/8],inf),
		\legato, 0.8,
			)
}).play(quant:4)
)
Pdef(\piano).stop;


e = Pfx(p, \simplerev, \decay, 2);
e.play;


(
Pdef(\loopEcho, {
	Pbind( \instrument, \Echo,
		\dur , Pseq([2],inf),
		\mx, Pseq([1,2,4],inf)

	)
}).play(quant:4)
)

///////////////////////////////////////////////////////
(
SynthDef(\echo, { arg out=0, maxdtime=0.2, dtime=0.2, decay=2, gate=1;
    var env, in;
    env = Linen.kr(gate, 0.05, 1, 0.1, 2);
    in = In.ar(out, 2);
    XOut.ar(out, env, CombL.ar(in * env, maxdtime, dtime, decay, 1, in));
}, [\ir, \ir, 0.1, 0.1, 0]).add;

SynthDef(\distort, { arg out=0, pregain=40, amp=0.2, gate=1;
    var env;
    env = Linen.kr(gate, 0.05, 1, 0.1, 2);
    XOut.ar(out, env, (In.ar(out, 2) * pregain).distort * amp);
}, [\ir, 0.1, 0.1, 0]).add;

SynthDef(\wah, { arg out=0, gate=1;
    var env, in;
    env = Linen.kr(gate, 0.05, 1, 0.4, 2);
    in = In.ar(out, 2);
    XOut.ar(out, env, RLPF.ar(in, LinExp.kr(LFNoise1.kr(0.3), -1, 1, 200, 8000), 0.1).softclip * 0.8);
}, [\ir, 0]).add;
)

(
var p, q, r, o;
p = Pbind(\degree, Prand((0..7),12), \dur, 0.3, \legato, 0.2);

q = Pfx(p, \echo, \dtime, 0.8, \decay, 3);

r = Pfx(q, \distort, \pregain, 20, \amp, 0.25);

o = Pfx(r, \wah);

Pseq([p, q, r, o], 2).play;
)