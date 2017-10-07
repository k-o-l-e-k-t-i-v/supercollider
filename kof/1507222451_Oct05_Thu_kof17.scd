
(
s.reboot;
MIDIClient.init;
MIDIIn.connectAll;
~control = { arg src, chan, num, val;
	[chan,num,val].postln;
};
MIDIIn.addFuncTo(\control, ~control);
)

(

SynthDef("moogbass", {
	arg out = 0, pan = 0, freq = 440, amp = 0.1, gate = 1, cutoff = 1000, gain = 2.0, lagamount = 0.01, att = 0.001, dec = 0.3, sus = 0.9, rel = 0.2, chorus = 0.7;
	var osc, filter, env, filterenv, snd, chorusfx;
	osc = Mix(VarSaw.ar(
		freq: freq.lag(lagamount) * [1.0, 1.001, 2.0],
		iphase: Rand(0.0,1.0) ! 3,
		width: Rand(0.5,0.75) ! 3,
		mul: 0.5));
	filterenv = EnvGen.ar(
		envelope: Env.asr(0.2, 1, 0.2),
		gate: gate);
	filter =  MoogFF.ar(
		in: osc,
		freq: cutoff * (1.0 + (0.5 * filterenv)),
		gain: gain);
	env = EnvGen.ar(
		envelope: Env.adsr(0.001, 0.3, 0.9, 0.2, amp),
		gate: gate,
		doneAction: 2);
	snd = (0.7 * filter + (0.3 * filter.distort)) * env;
	chorusfx = Mix.fill(7, {
		var maxdelaytime = rrand(0.005, 0.02);
		DelayC.ar(
			in: snd,
			maxdelaytime: maxdelaytime,
			delaytime: LFNoise1.kr(
				freq: Rand(4.5, 10.5),
				mul: 0.25 * maxdelaytime,
				add: 0.75 * maxdelaytime)
		)
	});
	snd = snd + (chorusfx * chorus);
	Out.ar(out, Pan2.ar(snd, pan));
}).add;

~legato = PatternProxy(1);
c = MIDIFunc.cc({ |value = 0.05, num, chan, src|
	~legato.source = value.linlin(0, 127, 0.01, 1)
}, 1);    // modwheel
~attack = PatternProxy(1);
d = MIDIFunc.cc({ |value = 0.05, num, chan, src|
	~attack.source = value.linlin(0, 127, 0, 1)
}, 22);    // pot.1
~decay = PatternProxy(1);
e = MIDIFunc.cc({ |value = 0.05, num, chan, src|
	~decay.source = value.linlin(0, 127, 5, 50)
}, 24);    // pot.2
~sustain = PatternProxy(1);
f = MIDIFunc.cc({ |value = 0.05, num, chan, src|
	~sustain.source = value.linlin(0, 127, 0, 0.5)
}, 33);    // pot.3
~release = PatternProxy(1);
g = MIDIFunc.cc({ |value = 0.05, num, chan, src|
	~release.source = value.linlin(0, 127, 0, 20)
}, 35);    // pot.4


// loadRelative("utilities.scd");  << i do not have, using:
h = Pbind(
	\amp,      ~attack,    //0.5,
	\midinote, ~decay,       //Pseq([24, 36, 48, 36, 35, 36, 43, 48],inf),
	\dur,      ~sustain,        //Pstutter(8, Pseq([0.5, 0.25], inf)),
	\gain,     ~release,        // Pn(Pseries(2, 0.1, 19),inf),
	\cutoff,   Pn(Pseries(4000, 400, 18), inf),
	\chorus,   ~legato,         //         0.7,
	\instrument, \moogbass
);
)


// BACHA NA TO - volume down !!!!!!!!!!!
h.play;

c.free;
d.free;
e.free;
f.free;
g.free;
