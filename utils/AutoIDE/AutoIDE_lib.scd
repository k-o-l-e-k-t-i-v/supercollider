AutoIDE.prStore(\proxy,{p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(120/60);});
AutoIDE.prStore(\setlpf,{~nodeName.set(\lpf_freq, 800);});
AutoIDE.prStore(\pbamp,{~nodeIndex = \set -> Pbind(\args, [\amp], \amp, Pseq([0.3, 0.7], inf), \dur, 8);});
AutoIDE.prStore(\varaenv,{var aEnv = EnvGen.ar(Env([0,1,0], [0.95,0.05], [\sin, \welch]), \aTrig.tr);});
AutoIDE.prStore(\ndsaw,{~nodeName[0] = { Pan2.ar( LFSaw.ar( \freq.kr(60,0.125), 0, 1 ), \pan.kr(0,0.125) );}});
AutoIDE.prStore(\varfill,{var num = 8;
var osc = Mix.fill(num, {|i| SinOsc.ar(60,0.05*i,1/num)});});
AutoIDE.prStore(\ndflat,{~nodeIndex = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };});
AutoIDE.prStore(\ndsin,{~nodeName[0] = { Pan2.ar( SinOsc.ar( \freq.kr(60,0.125), 0, 1 ), \pan.kr(0,0.125) );}});
AutoIDE.prStore(\setamp,{~nodeName.set(\amp, 0.3);});
AutoIDE.prStore(\pbpan,{~nodeIndex = \set -> Pbind(\args, [\pan], \pan, Pseq([-0.7,0.7], inf), \dur, 0.5);});
AutoIDE.prStore(\ndlpf,{~nodeIndex = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };});
AutoIDE.prStore(\envg,{EnvGen.ar( Env( [0,1,0], [0.15,0.85]), \aTrig.tr )});
AutoIDE.prStore(\setgverb,{~nodeName.set(\gverb_size, 60);
~nodeName.set(\gverb_time, 4);});
AutoIDE.prStore(\ndgverb,{~nodeIndex = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(60, 4), \gverb_time.kr(4, 1)) };});
AutoIDE.prStore(\pbfreq,{~nodeIndex = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,4,3,7], inf), \dur, 4);});
AutoIDE.prStore(\ndlimiter,{~nodeIndex = \filter -> {|in| Limiter.ar(in, 0.95) };});
AutoIDE.prStore(\pbselect,{~nodeIndex = \set -> Pbind(\args, [\sel], \sel, Pseq([0,0,1], inf), \dur, 2);});
AutoIDE.prStore(\setfreq,{~nodeName.set(\freq, 80);});
AutoIDE.prStore(\setpan,{~nodeName.set(\pan, 0);});
AutoIDE.prStore(\ndstart,{~nodeName.play(vol: 0.0, fadeTime: 8).quant_(2);});
AutoIDE.prStore(\jenv,{~nodeIndex = \set -> Jenv(\namekey, [0.001,1,0.001], [0.85, 0.15], \exp, inf);});
AutoIDE.prStore(\varfenv,{var fEnv = EnvGen.ar(Env([\freq.kr(60,1),14000,\freq.kr(60,1)], [0.03,0.14], \exp), \aTrig.tr);});
AutoIDE.prStore(\ndamp,{~nodeIndex = \filter -> {|in| in * \amp.kr(0.3, 1) };});
AutoIDE.prStore(\pbaenv,{~nodeIndex = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 1);});
AutoIDE.prStore(\varselect,{var select = Select.ar(\aEnvSel.kr(0),
[
	EnvGen.ar(Env([0,1,0], [0.05,0.45], [\sin, \welch]), \aTrig.tr),
	EnvGen.ar(Env([0,0.8,0.2,1,0], [0.2,0.05,0.2,0.05], [\sin, \lin]), \aTrig.tr);
]
);});
AutoIDE.prStore(\ndstop,{~nodeName.stop(16);});
AutoIDE.prStore(\ndaenv,{~nodeIndex = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [0.75,0.25]), \aTrig.tr) };});
AutoIDE.prStore(\ndscope,{~nodeName.scope;});
AutoIDE.prStore(\pblpf,{~nodeIndex = \set -> Pbind(\args, [\lpf_freq], \lpf_freq, Pseq([600, 1200, 800, 2400], inf), \dur, 8);});
