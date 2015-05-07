q = ();
q.envelope = {|q, generalTrig| EnvGen.ar(Env.perc(0.05, 1.95), generalTrig.tr) };

~osc.play;
~osc = { Pan2.ar(SinOsc.ar(60, 0, 0.3), 0) * q.envelope(\eTrig) };
~osc.set(\eTrig, 1);

~osc2.play;
~osc2 = { Pan2.ar(LFSaw.ar(120, 0, 0.1), 0) * q.envelope(\eTrig2) };
~osc2.set(\eTrig2, 1);

Pbind(\type, \set, \args, [\eTrig], \dur, 2, \eTrig, 1).play;
Pbind(\type, \set, \args, [\eTrig2], \dur, 0.5, \eTrig2, 1).play;
