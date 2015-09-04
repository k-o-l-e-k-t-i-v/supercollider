QuantEnv {
	classvar version = 0.06;
	classvar >win = nil;
	classvar <>openWin = false;
classvar <>plotter;

	var <>key;
	var <>quant, <>levels, <>times, <>curves, <>offset, <>repeats;
	var syncBeat_levels, syncBeat_times, syncBeat_curves;
	var <printLevels, <printTimes, <printCurves, <displayQuant;
	var <beat2quant, <basicDur, <totalDur, <numLoop;
	var pbind;

	*new {|key = \amp, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[-2,2], offset = 0, repeats = inf|

		^super.newCopyArgs(key, quant , levels , times , curves , offset , repeats).init;
	}

	duration { ^super.copy.times.flat.sum }

	print{
		var txt;
		txt = "\nQuantEnv |%| - (ver%)".format(super.copy.key, version);
		txt = txt + "\n\t - beat2quant : %".format(super.copy.beat2quant);
		txt = txt + "\n\t - quant % [subLoops: %]".format(super.copy.quant, super.copy.numLoop);
		txt = txt + "\n\t - duration % [loopDur: %]".format(super.copy.totalDur, super.copy.basicDur);
		txt = txt + "\n\t - levels %".format(super.copy.printLevels);
		txt = txt + "\n\t - times %".format(super.copy.printTimes);
		txt = txt + "\n\t - curves %".format(super.copy.printCurves);

		txt.postln;
	}

	plot{
		var env;

		(openWin == false).if({
			env = Env(super.copy.printLevels.flat, super.copy.printTimes.flat, super.copy.printCurves.flat);
			/*
			win.front;
			win.alpha_(0.85);
			win.alwaysOnTop_(true);
			win.name_(super.copy.key);
			win.onClose = ({ QuantEnv.win_(nil); });
			*/
			// Plotter(parent: win)
			plotter = Plotter()
			.value_([env.asMultichannelSignal(2000).flop])
			.setProperties(
				\fontColor, Color.new255(160,160,160),
				\plotColor, Color.new255(255,255,255),
				\backgroundColor, Color.new255(30,30,30),
			)
			.plotMode_(\linear)
			// .specs_(ControlSpec(0,val.max))
			.domainSpecs_(ControlSpec(0,super.copy.quant))
			.parent.alwaysOnTop_(true).front.alpha_(0.85).name_(super.copy.key)
			.bounds_(Rect(1200, 750, 400, 300))
			.onClose = ({ QuantEnv.openWin_(false); });

			openWin = true;
		},{
			env = Env(super.copy.printLevels.flat, super.copy.printTimes.flat, super.copy.printCurves.flat);
			// plotter.value_([env.asMultichannelSignal(2000).flop])
			"problem s refresh Plotter".postln;
		}
		);
	}

	init{


		// win.isNil.if({"jsem tu".postln;});
		// win.isNil.if({ win = Window(key, Rect(1200, 750, 400, 200)); });

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

		this.setPrintArrays;

		levels = levels.flat;
		times = times.flat;
		curves = curves.flat;

		syncBeat_levels = levels.copy;
		syncBeat_times = times.copy;
		syncBeat_curves = curves.copy;

		// first loop sync quant - pswitch index 0
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

	play{|stage|
		// play{|stage, phase|

		pbind = Pswitch(
			[
				Pbind(
					\type, \set,
					\args, [key.asSymbol],
					\dur, 1/Server.local.options.blockSize,
					key.asSymbol, Penv(syncBeat_levels, syncBeat_times, syncBeat_curves)
				),
				Pbind(
					\type, \set,
					\args, [key.asSymbol],
					\dur, 1/Server.local.options.blockSize,
					key.asSymbol, Penv(levels, times, curves)
				),
			], Pseq([0,Pn(1,(repeats-1))])
		);

		^pbind;
	}

	setPrintArrays{
		printLevels = levels.copy;
		printTimes = times.copy;
		printCurves = curves.copy;
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
		// if(offset != 0) { times.insert(0, offset) };

		/*
		if(quant != basicDur) {
		while ( {quant-basicDur < 0} , {quant = quant * 2});
		if(quant != basicDur) {
		times.insert(times.size,(quant-basicDur));
		};
		}
		{ times.insert(times.size,(0)); };
		*/

		// times = times.reshape((times.size / (levels.size+1)).asInteger, levels.size.asInteger+1);
		// "levels.size : % ".format(levels.size).postln;
		levels.containsSeqColl.if(
			{ times = times.wrapExtend(levels[0].size-1); },
			{ times = times.wrapExtend(levels.size-1); }
		);
		numLoop.do({ temp.add(times); });
		times = temp.asArray;


		basicDur = times[0].sum + offset;
		// basicDur = times.flat.sum + offset;
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
					// "oneLevel : %".format(oneLevel).postln;

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



	stage{
		// jako stage v pdfsm
	}


}