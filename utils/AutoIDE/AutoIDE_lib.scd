AutoIDE.prStore(\envg,{EnvGen.ar( Env( [0,1,0], [0.15,0.85]), \aTrig.tr )});
AutoIDE.prStore(\nodeosc,{~nodeName[0] = { LFSaw.ar(\freq.kr(60,0.125));}});
AutoIDE.prStore(\proxy,{p = ProxySpace.push(s);});
AutoIDE.prStore(\nodestart,{~nodeName.play(vol:0.3, fadeTime:8).quant_(2);});
AutoIDE.prStore(\lpff,{
	~nodeIndex = \filter -> {|in| LPF.ar(in, \freq_lpf.kr(600, 8)) };
	~nodeName.set(\freq_lpf, 400);
});
AutoIDE.prStore(\tempo,{t = TempoClock(1).pernament_(true);});
AutoIDE.prStore(\nodeenv,{~nodeIndex = \filter -> {|in| in * EnvGen.ar( Env( [0,1,0], [0.05,0.75]), \aTrig.tr) };});
AutoIDE.prStore(\setfreq,{~nodeIndex = \set -> Pbind(\args, [\freq], \octave, 3, \degree, Pseq([3,3,3,7], inf), \dur, 4);});
AutoIDE.prStore(\setpan,{~nodeIndex = \set -> Pbind(\args, [\pan], \pan, Pseq([0.7,-0.7], inf), \dur, 0.5);});
AutoIDE.prStore(\setbind,{~nodeIndex = \set -> Pbind(\args, [\pan], \pan, Pseq([0.7,-0.7], inf), \dur, 0.25);});
AutoIDE.prStore(\setenv,{~nodeIndex = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 1);});
AutoIDE.prStore(\nodepan,{~nodeIndex = \filter -> {|in| Pan2.ar(in, \pan.kr(0,0.25)) };});
AutoIDE.prStore(\nodepan,{~nodeIndex = \filter -> {|in| Balance2.ar(in[0], in[1], \pan.kr(0,0.25)) };});
AutoIDE.prStore(\nodedrum,{
	(
		~drum[0] = {
			var f = [60,82,84,98];
			var aEnv = EnvGen.kr(Env([0, 1, 0.45, 0],[[0.01,0.05],[0.29,0.27], [1.5, 0.29, 0.35, 1.57]], \welch), \aTrig.tr);
			var fEnv = EnvGen.kr(Env([f, 18000, f*1.4, f], [0.003, 0.011, 0.15], \exp), \aTrig.tr);
			var num = 8;
			var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.05*i,1/num) * BrownNoise.ar(0.3, SinOsc.kr([8, 16.01], 0, 0.7))});
			Splay.ar( osc * aEnv, 0);
		};
		~drum[1] = \filter -> {|in|
			var lpfEnv = EnvGen.kr(Env([250, \lpfFreq.kr(lag: 6), 800, 50],[0.03, 0.37, 1.2], \exp), \drumTrig.tr);
			LPF.ar(in, lpfEnv)
		};
		~drum[10] = \filter -> {|in| AllpassC.ar(in,0.06,0.001,4.75) };
		~drum[12] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
	);
	~drum.set(\lpfFreq, 260);
	~drum.play(vol:0.8, fadeTime:4).quant_(4);
	~drum.set(\aTrig, Pbind(\args, [\aTrig, \fTrig], \aTrig, 1, \fTrig, \dur, 0.5));
	~drum.set(\lpfFreq, 800);
	~drum.stop(20);
	~drum.free;
});
AutoIDE.prStore(\nodebasic,{
	(
		~nodeName[0] = {
			var aEnv = EnvGen.ar( Env( [0,1,0], [0.05,0.75]), \aTrig.tr);
			var osc = LFSaw.ar(\freq.kr(60,0.125));
			Pan2.ar( osc * aEnv, \pan.kr(0,0.25) );
		};
		~nodeName[10] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 0.5);
	);

	~nodeName.play(vol:0.4, fadeTime:4).quant_(2);
	~nodeName.stop(8);
	~nodeName.set(\freq, 60);
	~nodeName.set(\pan, 0);
});
