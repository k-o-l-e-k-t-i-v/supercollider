QuantEnv {
	classvar <version = 0.02;
	classvar >print = true;
	classvar >plot = true;
	classvar >plotTime = 4;

	*new{|key, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = \exp, offset = 0, repeats = inf|
		times = times.asArray.wrapExtend(levels.size - 1);
		curves = curves.asArray.wrapExtend(levels.size - 1);

		^super.new.init(key, quant , levels , times , curves , offset , repeats);
	}

	init{|key, quant , levels , times , curves , offset , repeats |
		var pbind;
		var lev, t, cur;
		var dur;

		dur = offset;
		times.size.do({|i| dur = dur + times[i] });

		if(offset != 0) {t = t.add(offset)};
		times.size.do({|i| t = t.add((times[i])) });
		if(quant != dur) {
			while ( {quant-dur < 0} , {quant = quant * 2});
			if(quant != dur) {
				t = t.add((quant-dur))
			};
		};

		if (offset != 0) {lev = lev.add(levels[0])};
		levels.size.do({|i|
			if((curves[i] == \exp) && (levels[i] == 0), {
				lev = lev.add(0.0001)
			}, {
				if((i == (levels.size-1)) && (curves[i-1] == \exp) && (levels[i] == 0), {
					lev = lev.add(0.0001)
				}, {
					lev = lev.add(levels[i])
				});
			});

		});
		if(quant != dur) {lev = lev.add(lev[lev.size-1])};


		if(offset != 0) {cur = cur.add(\lin)};
		times.size.do({|i| cur = cur.add(curves[i]) });
		if(quant != dur) { cur = cur.add(\lin) };

		if(print) {this.initPrint(quant, dur, lev, t, cur)};
		if(plot) {this.initPlot(key, lev , t , cur, quant)};

		pbind = Pbind(
			\type, \set,
			\args, [key.asSymbol],
			\dur, 1/Server.local.options.blockSize,
			key.asSymbol, Pn(Penv(lev, t, cur), repeats)
		);

		^pbind;
	}
	/*
	pattern2array{|pattern|
	var arr;
	pattern.do({|i|	arr.add(i) });
	^arr;
	}
	*/
	initPrint{|quant, dur, lev, t, cur|
		"QuantEnv (v%) \n\t - quant %\n\t - dur %\n\t - levels %\n\t - times %\n\t - curves %"
		.format(version, quant, dur, lev.asString, t.asString, cur.asString).postln;
	}

	initPlot{|key, val, tim, crv, dur|

		var activeDoc = Document.current;
		var rect = Rect(1200, 530, 400, 300);
		var win = Window(key, rect);
		var routine;
		var plotter;
		var sample = 400;
		var env = Env(val, tim, crv);

		Plotter(parent: win)
		.value_([env.asMultichannelSignal(400).flop])
		.setProperties(
			\fontColor, Color.new255(160,160,160),
			\plotColor, Color.new255(255,255,255),
			\backgroundColor, Color.new255(30,30,30),
		)
		.plotMode_(\linear)
		// .specs_(ControlSpec(0,val.max))
		.domainSpecs_(ControlSpec(0,dur));

		win.front;
		win.alpha_(0.95);
		win.alwaysOnTop_(true);

		activeDoc.front;

		Routine {
			var fps = 12;
			(plotTime*fps).do({ |t|
				win.alpha_(1-(t*1/(plotTime*fps)));
				(1/fps).wait;
			});
			win.close;
		}.play(AppClock);
	}
}
