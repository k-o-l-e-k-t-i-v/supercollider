// (ja) more about this concept at SChelp -> jitlib_fading and ProxySynthDef

p = ProxySpace.push(s);
p.clock = TempoClock.default;
// t = TempoClock(1).pernament_(true); // why isnt allowed permanent? Have to use TempoClock.default now

(
ProxySynthDef(\test1, {|freq, amp| SinOsc.ar(freq!2,0,amp)}).add; // auto added EnvGen, like in NodeProxy[index] functions
ProxySynthDef(\test2, {|freq, amp| LFSaw.ar(freq!2, 0.2, 1) * LFPulse.ar([freq, freq+2], 0, 0.3, 0.8, 0.2); }).add;

// example of writtening with triggers
ProxySynthDef(\test3, {|out = 0, t_gate = 1, sustain, freq, amp|
	var aEnv = EnvGen.ar(Env.perc(0.25,0.45,0.3), t_gate, 1, 0, sustain, doneAction:2);
	var fEnv = EnvGen.kr(Env.perc(0.05,0.05,0.2), t_gate, 1, freq, 0.3 * sustain);
	var osc = BrownNoise.ar(0.2,0.8) + LFPulse.ar([fEnv, fEnv+2], 0, 0.3, 0.8, 0.2);
	Out.ar(out, osc * aEnv * amp);
}).add;
)

~a.play.quant_(4);
~a.scope;
(
~a[0] = Pbind(\instrument, \test1, // \test2 or \test3
	\dur, Pseq([Pn(0.125,8), Rest(6)], inf),
	\legato, 1.2,
	\amp, 0.3, \octave, 3, \degree, Pseq([3,4,3,7], inf))
)
(
~a[1] = Pbind(\instrument, \test3, // \test2 or \test3
	\dur, Pseq([Rest(2), Pn(0.25,4)], inf),
	\legato, 1.1,
	\amp, 0.2, \octave, 8, \degree, Pseq([3,4,3,7], inf))
)

~a[30] = \filter -> {|in| AllpassC.ar(in, 0.25, 0.125, 2) };
~a[32] = \filter -> {|in| LPF.ar(in, SinOsc.kr(0.5, 0, 1550,1800)) };
~a[34] = \filter -> {|in| GVerb.ar(in, 220, SinOsc.kr(120,0,7.5,8), 0.5) };
~a.removeAt(30);
~a.stop(10);
~a.clear;

