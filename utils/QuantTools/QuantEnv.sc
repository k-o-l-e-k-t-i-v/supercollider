QuantEnv {
	classvar <version = 0.03;
	classvar >print = true;
	classvar >plot = false;
	classvar >plotTime = 4;

	*new{|key, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = \exp, offset = 0, repeats = inf|

		times = times.asArray.wrapExtend(levels.size - 1);
		curves = curves.asArray.wrapExtend(levels.size - 1);

		^super.new.init(key, quant , levels , times , curves , offset , repeats);
	}

	init{|key, quant , levels , times , curves , offset , repeats |
		var pbind, pbind_rest2quant;
		var lev, t, cur;
		var dur;
		var node;
		var beat2quant = this.time2quant(quant).floor;
		// "beat2quant : %".format(beat2quant).postln;

		dur = offset + beat2quant;
		times.size.do({|i| dur = dur + times[i] });

		t = t.add(beat2quant);
		if(offset != 0) {t = t.add(offset)};
		times.size.do({|i| t = t.add((times[i])) });
		if(quant != dur) {
			while ( {quant-dur < 0} , {quant = quant * 2});
			if(quant != dur) {
				t = t.add((quant-dur))
			};
		};

		lev = lev.add(levels[0]);
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

		cur = cur.add(\lin);
		if(offset != 0) {cur = cur.add(\lin)};
		times.size.do({|i| cur = cur.add(curves[i]) });
		if(quant != dur) { cur = cur.add(\lin) };

		if(print) {this.initPrint(quant, dur, lev, t, cur)};

		pbind = Pbind(
			\type, \set,
			\args, [key.asSymbol],
			\dur, 1/Server.local.options.blockSize,
			key.asSymbol, Pn(Penv(lev, t, cur), repeats) ,
		);
		^pbind;
	}

	time2quant{|quant| ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); }

	initPrint{|quant, dur, lev, t, cur|
		"QuantEnv (v%) \n\t - quant %\n\t - dur %\n\t - levels %\n\t - times %\n\t - curves %"
		.format(version, quant, dur, lev.asString, t.asString, cur.asString).postln;
	}
	}