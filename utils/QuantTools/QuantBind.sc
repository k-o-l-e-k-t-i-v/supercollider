QuantBind {
	classvar <version = 0.065;

	*new{|key, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[\sin], offset = 0, repeats = inf|
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



		pbind = Pbind(
			\type, \set,
			\args, [key.asSymbol],
			\dur, 1/Server.local.options.blockSize,
			key.asSymbol, Pn(Penv(lev, t, cur), repeats)
		);

		^pbind;
	}



	pattern2array{|pattern|
		var arr;
		pattern.do({|i|	arr.add(i);	})
		^arr;
	}



}
