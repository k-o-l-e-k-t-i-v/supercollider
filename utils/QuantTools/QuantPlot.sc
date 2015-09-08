QuantPlot{
	classvar version = 0.064;
	classvar >win = nil;
	classvar ghraps;
	classvar resolution = 5000;

	var <>index, <>key, <>quant, <>levels, <>times, <>curves, <>offset, <>repeats;
	var <printLevels, <printTimes, <printCurves;

	*new{ ^super.new(); }
	*clear{ ghraps = Dictionary.new; super.plot; }

	plot{|key, index, cycle|
		AppClock.sched(0.0, {

			var env = nil;

			win.isNil.if({
				cycle.isPloted.if({
					win = Window(bounds: Rect(1200, 750, 400, 200));
				});
			});
			ghraps.isNil.if({ ghraps = Dictionary.new; });

			win.isNil.not.if({

				win.front;
				win.alpha_(0.85);
				win.alwaysOnTop_(true);
				win.name_(key);
				win.onClose = ({ QuantPlot_WIP.win_(nil); });

				cycle.isPloted.if({
					var maxNum = 0;
					"QuantPlot - (ver%) - %_%".format(version, key, index).postln;

					this.quant = cycle.quant;
					this.key = cycle.key;
					this.levels = cycle.levels;
					this.times = cycle.times;
					this.curves = cycle.curves;

					levels.flat.do({|num| (maxNum < num).if({maxNum = num}); });
					(maxNum >= 1).if(
						{ env = Env(levels.flat.normalize(0,1), times.flat, curves.flat).asMultichannelSignal(resolution).flop; },
						{ env = Env(levels.flat.normalize(0,maxNum), times.flat, curves.flat).asMultichannelSignal(resolution).flop; }
					);

					ghraps.add("%_%".format(key, index) -> env.flat);

				},{
					ghraps.removeAt("%_%".format(key, index));
				});

				(ghraps.size <= 0).if(
					{
						Plotter(parent: win).value_([0,0])
						.setProperties(
							\fontColor, Color.new255(160,160,160),
							\plotColor, Color.new255(255,255,255),
							\backgroundColor, Color.new255(30,30,30),
						)
						.refresh;
					},
					{
						Plotter(parent: win)
						.value_(ghraps.values.asArray)
						.setProperties(
							\fontColor, Color.new255(160,160,160),
							\plotColor, Color.new255(255,255,255),
							\backgroundColor, Color.new255(30,30,30),
						)
						.plotMode_(\linear)
						.specs_(ControlSpec(0,1))
						.domainSpecs_(ControlSpec(0,quant))
						.superpose_(true)
						.refresh;
					}
				);
			});

			nil;
		}).play;
	}
}