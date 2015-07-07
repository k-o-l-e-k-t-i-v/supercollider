AutoIDE.add(\newExample,{"...some script"}); //example - text inside of function will be add to your document

AutoIDE.add(\nodebasic,{
	~node.quant = 2;
	(
		~node[0] = {
			var aEnv = EnvGen.ar( Env( [0,1,0], [0.05,0.75]), \aTrig.tr);
			var osc = LFSaw.ar(\freq.kr(60,0.125));
			Pan2.ar( osc * aEnv, \pan.kr(0,0.25) );
		};
		~node[10] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 0.5);
	);

	~node.play(vol:0.4, fadeTime:4);
	~node.stop(8);
	~node.set(\freq, 60);
	~node.set(\pan, 0);
});

AutoIDE.add(\test, {Ndef(\sin, { SinOsc.ar(60!2, 0, 0.3) }).play;});

AutoIDE.add(\envg, {EnvGen.ar( Env( [0,1,0], [0.15,0.85]), \aTrig.tr )});

AutoIDE.add(\setbind, {\set -> Pbind(\args, [\pan], \pan, Pseq([0.7,-0.7], inf), \dur, 0.25);});

AutoIDE.add(\lpff,{
	\filter -> {|in| LPF.ar(in, \freq_lpf.kr(600, 8)) };
	~node.set(\freq_lpf, 400);}
);

AutoIDE.add(\proxysp,{p = ProxySpace.push(s);});

AutoIDE.add(\tempo, {t = TempoClock(1).pernament_(true);});