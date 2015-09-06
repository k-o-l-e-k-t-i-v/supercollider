QuantCycle{
	classvar version = 0.063;

	var <>index, <>key, <>quant, <>levels, <>times, <>curves, <>offset, <>repeats;
	var <beat2quant, <basicDur, <totalDur, <numLoop;
	var <syncBeat_levels, <syncBeat_times, <syncBeat_curves;

	*new {|index = 0, key = \amp, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[-2,2], offset = 0, repeats = 1|
		^super.newCopyArgs(index, key, quant, levels, times, curves, offset, repeats).init;
	}

	print{
		var txt;
		txt = "[%] --> QuantCycle - (ver%)".format(index, version);
		txt = txt + "\n\t\t - beat2quant : %".format(super.copy.beat2quant);
		txt = txt + "\n\t\t - quant % [subLoops: %]".format(super.copy.quant, super.copy.numLoop);
		txt = txt + "\n\t\t - duration % [loopDur: %]".format(super.copy.totalDur, super.copy.basicDur);
		txt = txt + "\n\t\t - levels %".format(super.copy.levels);
		txt = txt + "\n\t\t - times %".format(super.copy.times);
		txt = txt + "\n\t\t - curves %".format(super.copy.curves);
		txt = txt + "\n\t\t - offset %".format(super.copy.offset);
		txt = txt + "\n\t\t - repeats %".format(super.copy.repeats);

				^txt;
	}

	asPbind{|syncPbind|
		var newPbind;
		var penv;
		syncPbind.if(
			{ penv = Pn(Penv(super.copy.syncBeat_levels, super.copy.syncBeat_times, super.copy.syncBeat_curves), 1)},
			{ penv = Pn(Penv(super.copy.levels, super.copy.times, super.copy.curves), super.copy.repeats)}
		);
		newPbind = Pbind(
			\type, \set,
			\args, [super.copy.key.asSymbol],
			\dur, 1/Server.local.options.blockSize,
			super.copy.key.asSymbol, penv
		);

		^newPbind;
	}

	init{
		beat2quant = this.time2quant(quant).floor;

		this.initLevels;
		this.initTimes;
		this.initCurves;

		// set offset
		if(offset != 0) {
			levels = this.insert(levels, nil, \firstDup);
			times = this.insert(times, offset, \firstIns);
			curves = this.insert(curves, 0, \firstIns);
		};
		// set rest2quant
		if(quant > basicDur) {
			levels = this.insert(levels, nil, \lastDup);
			// "((quant - basicDur)/numLoop) : % ".format((quant / numLoop) - basicDur).postln;
			times = this.insert(times, ((quant / numLoop) - basicDur) , \lastIns);
			curves = this.insert(curves, 0, \lastIns);
		};
		// set step between loop
		if(levels.size > 1)	{
			times = this.insert(times, 0, \lastIns);
			curves = this.insert(curves, 0, \lastIns);
		};

		// this.setPrintArrays;

		levels = levels.flat;
		times = times.flat;
		curves = curves.flat;

		syncBeat_levels = levels.copy;
		syncBeat_times = times.copy;
		syncBeat_curves = curves.copy;

		// first loop cut by dur to sync quant
		syncBeat_levels = syncBeat_levels.insert(0,levels[0]);
		syncBeat_times = syncBeat_times.insert(0, beat2quant);
		syncBeat_curves = syncBeat_curves.insert(0,0);
			}

	insert{|array, value, action|
		var tempList;
		var answ = List.newClear;

		array.do({ |oneArray|
			tempList = List.newClear;

			switch (action,

				\firstIns, {
					tempList.add(value);
					tempList.add(oneArray);
				},

				\lastIns, {
					tempList.add(oneArray);
					tempList.add(value);
				},

				\firstDup,   {
					tempList.add(oneArray[0]);
					tempList.add(oneArray);
				},

				\lastDup, {
					tempList.add(oneArray);
					tempList.add(oneArray[array[0].size - 1]);
				}
			);

			answ.add(tempList.flat);
		});
		^answ.asArray;
	}

	initCurves{
		var temp = List.newClear;
		levels.containsSeqColl.if(
			{ curves = curves.asArray.wrapExtend(levels[0].size-1);	},
			{ curves = curves.asArray.wrapExtend(levels.size-1); }
		);
		numLoop.do({ temp.add(curves.asArray); });
		curves = temp.asArray;
	}

	initTimes{
		var temp = List.newClear;
		levels.containsSeqColl.if(
			{ times = times.wrapExtend(levels[0].size-1); },
			{ times = times.wrapExtend(levels.size-1); }
		);
		numLoop.do({ temp.add(times); });
		times = temp.asArray;

		basicDur = times[0].sum + offset;
		totalDur = basicDur * numLoop;
		if(quant < totalDur) {	while ( {quant-totalDur < 0} , {quant = quant * 2}) };
	}

	initLevels{
		var result;
		var maxSubArraySize = 0;

		levels.containsSeqColl.if(
			{
				var subArray = List.newClear;
				levels.do({|oneLevel|
					var deepArray = List.newClear;
					oneLevel.isArray.if(
						{
							(maxSubArraySize < oneLevel.flatSize).if({	maxSubArraySize = oneLevel.flatSize; });
							oneLevel.deepCollect(2, {|item|
								deepArray.add(item);
							});
						},
						{
							(maxSubArraySize < 1).if({ maxSubArraySize = 1 });
							deepArray.add(oneLevel);
						}
					);
					subArray.add(deepArray.asArray);

				});

				result = subArray.asArray.lace((levels.size)*(maxSubArraySize));
				levels = result.reshape((result.size / levels.size).asInteger, levels.size.asInteger);
				numLoop = (levels.size).asInteger;

			},
			{
				result = levels.asArray.reshape(1,levels.size.asInteger);
				levels = result.asArray;
				numLoop = 1;
			}
		);
	}

	time2quant{|quant|
		if(currentEnvironment === topEnvironment)
		{ ^TempoClock.default.timeToNextBeat(quant); }
		{ ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); };

		/* // if pro pripad kdy neni nastaveno clock pro proxyspace - chyba
		if(currentEnvironment.at(\tempo).notNil)
		{^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant);}
		{
		"hodiny".warn;
		^TempoClock.default.timeToNextBeat(quant);
		}
		*/
	}


}