AutoIDE.print;
AutoIDE.remove(\varfenv);
AutoIDE.code(\nodepan);

AutoIDE.add(\ndstart, {~nodeName.play(vol: 0.0, fadeTime: 8).quant_(2);})
AutoIDE.add(\ndstop, {~nodeName.stop(16);})
AutoIDE.add(\ndscope, {~nodeName.scope;})
AutoIDE.add(\ndsaw, {~nodeName[0] = { Pan2.ar( LFSaw.ar( \freq.kr(60,0.125), 0, 1 ), \pan.kr(0,0.125) );}})
AutoIDE.add(\ndsin, {~nodeName[0] = { Pan2.ar( SinOsc.ar( \freq.kr(60,0.125), 0, 1 ), \pan.kr(0,0.125) );}})
AutoIDE.add(\ndaenv, {~nodeIndex = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [0.75,0.25]), \aTrig.tr) };});
AutoIDE.add(\ndamp, {~nodeIndex = \filter -> {|in| in * \amp.kr(0.3, 1) };});
AutoIDE.add(\ndlpf, {~nodeIndex = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };});
AutoIDE.add(\ndgverb, {~nodeIndex = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(60, 4), \gverb_time.kr(4, 1)) };});
AutoIDE.add(\ndlimiter, {~nodeIndex = \filter -> {|in| Limiter.ar(in, 0.95) };});
AutoIDE.add(\ndflat, {~nodeIndex = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), -1) };});

AutoIDE.add(\pbpan, {~nodeIndex = \set -> Pbind(\args, [\pan], \pan, Pseq([-0.7,0.7], inf), \dur, 0.5);})
AutoIDE.add(\pbaenv, {~nodeIndex = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 1);});
AutoIDE.add(\pbamp, {~nodeIndex = \set -> Pbind(\args, [\amp], \amp, Pseq([0.3, 0.7], inf), \dur, 8);});
AutoIDE.add(\pbfreq, {~nodeIndex = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,4,3,7], inf), \dur, 4);})
AutoIDE.add(\pblpf, {~nodeIndex = \set -> Pbind(\args, [\lpf_freq], \lpf_freq, Pseq([600, 1200, 800, 2400], inf), \dur, 8);})
AutoIDE.add(\pbselect, {~nodeIndex = \set -> Pbind(\args, [\sel], \sel, Pseq([0,0,1], inf), \dur, 2);})

AutoIDE.add(\setamp, {~nodeName.set(\amp, 0.3);})
AutoIDE.add(\setpan, {~nodeName.set(\pan, 0);})
AutoIDE.add(\setfreq, {~nodeName.set(\freq, 80);})
AutoIDE.add(\setlpf, {~nodeName.set(\lpf_freq, 800);})
(
AutoIDE.add(\setgverb, {~nodeName.set(\gverb_size, 60);
	~nodeName.set(\gverb_time, 4);})
)

AutoIDE.add(\varfenv, {var fEnv = EnvGen.ar(Env([\freq.kr(60,1),14000,\freq.kr(60,1)], [0.03,0.14], \exp), \aTrig.tr);})
AutoIDE.add(\varaenv, {var aEnv = EnvGen.ar(Env([0,1,0], [0.95,0.05], [\sin, \welch]), \aTrig.tr);})
(
AutoIDE.add(\varfill, {var num = 8;
	var osc = Mix.fill(num, {|i| SinOsc.ar(60,0.05*i,1/num)});})
)
(
AutoIDE.add(\varselect, {var select = Select.ar(\aEnvSel.kr(0),
[
	EnvGen.ar(Env([0,1,0], [0.05,0.45], [\sin, \welch]), \aTrig.tr),
	EnvGen.ar(Env([0,0.8,0.2,1,0], [0.2,0.05,0.2,0.05], [\sin, \lin]), \aTrig.tr);
]
);})
)

AutoIDE.add(\jenv, {~nodeIndex = \set -> Jenv(\namekey, [0.001,1,0.001], [0.85, 0.15], \exp, inf);});

AutoIDE.add(\quantenv, {~nodeIndex = QuantEnv(\nameKey, 1, [0,1,0], [0.05, 0.95], [\exp, \sin], 0, inf);});

AutoIDE.run;


AutoIDE.end;



