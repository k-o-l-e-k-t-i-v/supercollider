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
AutoIDE.prStore(\aplay, {~n1.play(vol:0.7, fadeTime:2, numChannels:2).quant_(2);});

//env
AutoIDE.prStore(\aenv, {var env=EnvGen.kr(Env([0,1,0],[0.01,0.4],\welch),\trig.tr);});

//fenv
AutoIDE.prStore(\afenv, {var fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(4),\freq.kr],[0.01,0.04],\welch),\trig.tr);});

//trig
AutoIDE.prStore(\atrig, {~n1[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);});

//set freq
AutoIDE.prStore(\afreq, {~n1[2]=\set->Pbind(\args, [\freq], \dur,1, \freq, Pseq([65],inf));});

//Gverb
AutoIDE.prStore(\agverb, {~n1[30]=\filter->{arg in; GVerb.ar(in,roomsize:40)};});

///comb
AutoIDE.prStore(\acomb, {~n1[32]=\filter->{arg in; CombN.ar(in,2,0.5)};});

//LPF
AutoIDE.prStore(\alpf, {~n1[33]=\filter->{arg in; LPF.ar(in,\lpf.kr(400,2))};});

//limiter
AutoIDE.prStore(\alimit, {~n1[36]=\filter-> {arg in; Limiter.ar(in,0.9)}});


//node pattern
AutoIDE.prStore(\atum, {~tum.clear;
	~tum.stop(freeTime:10);
	~tum.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
	~tum[0]=Pbind(
		\instrument, \tum,
		\amp, 1,
		\legato, 1,
		\pan, 0,
		\octave, [2,3],
		\degree, [3,6],
		\dur, 0.5,
		\rq,0.2,
	);
	~tum[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(120,2)),0.7)};
	~tum[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.2)+in,0.7)};

});

AutoIDE.prStore(\akick, {~kick.clear;
	~kick.stop(freeTime:10);
	~kick.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
	~kick[0]=Pbind(
		\instrument, \kick,
		\amp, 1,
		\legato, 1,
		\pan, Pseq([-1,01],inf),
		\freq, [45,47],
		\dur, 0.5,
	);
	~kick[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(120,2)),0.7)};
	~kick[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,80,[2,1],mul:0.2)+in,0.7)};

});

AutoIDE.prStore(\aaural, {~aural.clear;
	~aural.stop(freeTime:10);
	~aural.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
	~aural[0]=Pbind(
		\instrument, \aural,
		\amp,Prand([0.8,0.4,0.6],inf)/4,
		\legato, 1.5,
		\octave, Prand([[5,6],[4,2],[5,4],[3,6]],inf)-1,
		\degree, Prand([[1,5],[4,7],[7,2],[2,4],[2,6],[4,2]],inf),
		\dur, 4
	);
	~aural[5]=\filter->{arg in; GVerb.ar(in,[40,60],[8,4],mul:0.2)+in};
	~aural[6]=\filter->{arg in; LPF.ar(in,\lpf3.kr(2000,4))};
	// ~aural[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, 1000);


});

AutoIDE.prStore(\azit, {~zit.clear;
	~zit.stop(freeTime:10);
	~zit.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
	~zit[0]=Pbind(
		\instrument, \zit,
		\amp, 1,
		\legato, 1,
		\pan, Pseq([1,0,-1,-1,1,-1],inf),
		\octave, [4,8,6]-1,
		\degree, [3,6],
		\dur, 0.5,
		\hpf, 1000,
		\noise, 0.5,
		\rq,0.2,
	);
	~zit[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(120,2)),0.7)};
	~zit[4]=\filter->{arg in; Limiter.ar(GVerb.ar(Splay.ar(in),20,[2,1],mul:0.2)+in,0.7)};
	~zit[5]=\filter->{arg in; AllpassN.ar(Splay.ar(in),0.02)};
	~zit[6]=\filter->{arg in; GVerb.ar(in,20,[4,6],mul:0.2,add:in)};
	~zit[7]=\filter->{arg in; LPF.ar(in, \lpf2.kr(400,4))};

});

AutoIDE.prStore(\azzz, {
	~zzz1.clear;
	~zzz1.stop(freeTime:10);
	~zzz1.play(vol:0.5, fadeTime:4, numChannels:2).quant_(4);
	(~zzz1[0]=Pbind(
		\instrument, \zzz,
		\amp, 1,
		\sustain, 1.2,
		\dur, Prand([4,6,8],inf),
		\freq, Pseq([60,200,90,80, Prand([800,1000,900],1)],inf),
	);)
	~zzz1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(220,2)),0.7)};
	~zzz1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in!2,80,[2,1],mul:0.2)+in,0.7)};
});


AutoIDE.prStore(\abegin,{
	currentEnvironment.free;
	p=ProxySpace.push(s);
	p.makeTempoClock;
	ProxySynthDef.sampleAccurate = true;

	p.clock.tempo = 128/60;
	p.gui;

});