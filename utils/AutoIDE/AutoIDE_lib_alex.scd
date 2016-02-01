AutoIDE.prStore(\ndstop,{~nodeName.stop(16);});
AutoIDE.prStore(\pbselect,{~nodeIndex = \set -> Pbind(\args, [\sel], \sel, Pseq([0,0,1], inf), \dur, 2);});
AutoIDE.prStore(\setlpf,{~nodeName.set(\lpf_freq, 800);});
AutoIDE.prStore(\ndflat,{~nodeIndex = \filter -> {|in| Balance2.ar( Mix.ar(in), Mix.ar(in), 1) };});
AutoIDE.prStore(\setgverb,{~nodeName.set(\gverb_size, 60);
~nodeName.set(\gverb_time, 4);});
AutoIDE.prStore(\ndlimiter,{~nodeIndex = \filter -> {|in| Limiter.ar(in, 0.95) };});
AutoIDE.prStore(\ndscope,{~nodeName.scope;});
AutoIDE.prStore(\ndgverb,{~nodeIndex = \filter -> {|in| GVerb.ar(in, \gverb_size.kr(12), \gverb_time.kr(1), 0.9, mul:\mulgverb.kr(1)) };});
AutoIDE.prStore(\qenv,{(
~nodeIndex = \set -> QuantEnv(\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)});
AutoIDE.prStore(\ndsin,{(
	~nodeName[0] = {
		var osc = SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
		var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
		var sig = osc * noise;
		Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
	};
)});
AutoIDE.prStore(\pbamp,{~nodeIndex = \set -> Pbind(\args, [\amp], \amp, Pseq([0.3, 0.7], inf), \dur, 8);});
AutoIDE.prStore(\ndlpf,{~nodeIndex = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(800,8)) };});
AutoIDE.prStore(\setfreq,{~nodeName.set(\freq, 80);});
AutoIDE.prStore(\varaenv,{var aEnv = EnvGen.ar(Env([0,1,0], [0.95,0.05], [\sin, \welch]), \aTrig.tr);});
AutoIDE.prStore(\varfill,{var num = 8;
var osc = Mix.fill(num, {|i| SinOsc.ar(60,0.05*i,1/num)});});
AutoIDE.prStore(\proxy,{p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(240/60);});
AutoIDE.prStore(\envg,{EnvGen.ar( Env( [0,1,0], [0.15,0.85]), \aTrig.tr )});
AutoIDE.prStore(\pbtrig,{~nodeIndex = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 1);});
AutoIDE.prStore(\pbpan,{~nodeIndex = \set -> Pbind(\args, [\pan], \pan, Pseq([-0.7,0.7], inf), \dur, 0.5);});
AutoIDE.prStore(\setpan,{~nodeName.set(\pan, 0);});
AutoIDE.prStore(\ndfverb,{~nodeIndex = \filter -> {|in| FreeVerb.ar(in, \fverb_mix.kr(0), \fverb_room.kr(0.5)) };});
AutoIDE.prStore(\varselect,{var select = Select.ar(\sel.kr(0),
	[
		SinOsc.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0),
		LFSaw.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0),
	]
);});
AutoIDE.prStore(\kolektiv,{Kolektiv(\joach);
	Kolektiv.print;
	Kolektiv.historySave;
	Kolektiv.free;
});
AutoIDE.prStore(\setamp,{~nodeName.set(\amp, 0.3);});
AutoIDE.prStore(\pbfreq,{~nodeIndex = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,4,3,7], inf), \dur, 4);});
AutoIDE.prStore(\ndswitch,{(
~nodeIndex = \set-> Pswitch(
[
QuantEnv(\amp, 1, [0,1,0], [0.05, 0.45], \exp, 0, 7),
QuantEnv(\amp, 1, [0,1,0], [0.95, 0.05], \exp, 0, 1),
], Pseq([0,1], inf)
))});
AutoIDE.prStore(\ndsaw,{(
	~nodeName[0] = {
		var osc = LFSaw.ar(( \freq.kr(60) + \fplus.kr(0) ), mul: 1, add: 0);
		var noise = BrownNoise.ar(\noise.kr(0), (1 - \noise.kr(0)));
		var sig = osc * noise;
		Pan2.ar( sig * \amp.kr(0), \pan.kr(0) );
	};
)});
AutoIDE.prStore(\ndcomb,{~nodeIndex = \filter -> {|in| CombC.ar(in, 0.5, 0.125, 2) };});
AutoIDE.prStore(\ndstart,{~nodeName.play(vol: 0.0, fadeTime: 8);});
AutoIDE.prStore(\pblpf,{~nodeIndex = \set -> Pbind(\args, [\lpf_freq], \lpf_freq, Pseq([600, 1200, 800, 2400], inf), \dur, 8);});
AutoIDE.prStore(\quantplot,{QuantEnv.plot_(true).plotTime_(2);});
AutoIDE.prStore(\varfenv,{var fEnv = EnvGen.ar(Env([\freq.kr(60,1),14000,\freq.kr(60,1)], [0.03,0.14], \exp), \aTrig.tr);});



/////alex

//play
AutoIDE.prStore(\play, {~n1.play(vol:0.7, fadeTime:2).quant_(2);});

//env
AutoIDE.prStore(\env, {var env=EnvGen.kr(Env([0,1,0],[0.01,0.4],\welch),\trig.tr);});

//fenv
AutoIDE.prStore(\fenv, {var fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);});

//trig
AutoIDE.prStore(\trig, {~n1[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);});

//set freq
AutoIDE.prStore(\freq, {~n1[1]=\set->Pbind(\args, [\freq], \dur, \freq, Pseq([65],inf));});

//Gverb
AutoIDE.prStore(\fgverb, {~n1[30]=\filter->{arg in; GVerb.ar(in,roomsize:40)};});

//LPF
AutoIDE.prStore(\flpf, {~n1[33]=\filter->{arg in; LPF.ar(in,\lpf.kr(400,2))};});