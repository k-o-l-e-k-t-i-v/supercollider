QuantBind {
	classvar <version = 0.065;
	classvar >stage;

	var <>key, <>quant;
	var <>slots, <>cycles;
	var currentSlot, currentCycle;

	*new {|key = \amp, quant = 1, dur = nil, levels = #[0,1,0], repeats = inf|
		dur.isNil.if(
			{^super.newCopyArgs(key, quant).init },
			{^super.newCopyArgs(key, quant).init.phase(dur, levels, repeats); }
		);
	}

	init {
		"Init".warn;
		slots = Dictionary.new;
		cycles = Dictionary.new;
		currentSlot = nil;
		currentCycle = 0;
	}

	stage {|name|
		currentSlot = name.asSymbol;
		cycles = Dictionary.new;
		currentCycle = 0;
	}

	phase { | dur, levels = #[0,1,0], repeats = 1 |
		("currentSlot : %".format(currentSlot)).warn;
		("currentCycle : %".format(currentCycle)).warn;
		("repeats : %".format(repeats)).warn;
		currentSlot.isNil.if({ currentSlot = \default; });

		repeats.do({
			cycles.put(currentCycle.asSymbol, "object");
			currentCycle = currentCycle + 1;
		});
		slots.put(currentSlot.asSymbol, cycles);
	}

	print{

		var txt = "\nQntBind | % | q% | - (ver%)".format(super.copy.key, super.copy.quant, version);

		slots.asSortedArray.do({ |oneSlot|
			("oneSlot : %".format(oneSlot)).warn;
			txt = txt + "\n %".format(oneSlot[0]);
		});

		txt.postln;
	}
	/*
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
	*/


	pattern2array{|pattern|
		var arr;
		pattern.do({|i|	arr.add(i);	})
		^arr;
	}



}
