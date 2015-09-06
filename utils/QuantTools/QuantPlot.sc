QuantPlot{
	classvar version = 0.063;
	classvar >win = nil;

	var <>index, <>key, <>quant, <>levels, <>times, <>curves, <>offset, <>repeats;
	var <printLevels, <printTimes, <printCurves;

	*new{ ^super.new(); }

	plot{|key, cycle|
		var env;
		win.isNil.if({ win = Window("aaa", Rect(1200, 750, 400, 200)); });

		"QuantPlot - (ver%)".format(version).postln;

		this.quant = cycle.quant;
		this.key = cycle.key;
		this.levels = cycle.levels;
		this.times = cycle.times;
		this.curves = cycle.curves;

		env = Env(levels.flat, times.flat, curves.flat);

		win.front;
		win.alpha_(0.85);
		win.alwaysOnTop_(true);
		win.name_(key);
		win.onClose = ({ QuantPlot_WIP.win_(nil); });

		Plotter(parent: win)
		.value_([env.asMultichannelSignal(2000).flop])
		.setProperties(
			\fontColor, Color.new255(160,160,160),
			\plotColor, Color.new255(255,255,255),
			\backgroundColor, Color.new255(30,30,30),
		)
		.plotMode_(\linear)
		// .specs_(ControlSpec(0,val.max))
		.domainSpecs_(ControlSpec(0,quant));
	}
}