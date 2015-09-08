QuantEnv {
	classvar version = 0.064;
	var <>key, <>quant;
	var <>cycles;
	var <>index;

	*new {|key = \amp, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2], offset = 0, repeats = inf|
		^super.newCopyArgs(key, quant).phase(1,levels, times, curves, offset, repeats);
	}

	phase{ | index = 0, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2], offset = 0, repeats = 1 |

		cycles.isNil.if(
			{ cycles = Dictionary.new },
			{ this.cycles = super.copy.cycles }
		);

		this.key = super.copy.key;
		this.quant = super.copy.quant;
		this.index = index.copy;

		cycles.add(index -> QuantCycle(index, key, quant, levels, times, curves, offset, repeats));
	}

	plot{ super.copy.cycles.at(super.copy.index).isPloted_(true); ^this;}
	callPlotter{ QuantPlot().plot(super.copy.key, super.copy.cycles.at(super.copy.index)); }

	print{
		var txt;
		txt = "\nQuantEnv |%| - (ver%)".format(super.copy.key, version);

		super.copy.cycles.asSortedArray.do({|oneCycle|
			txt = txt + "\n %".format(oneCycle[1].print);
		});

		txt.postln;
	}

	play{|which = #[0], repeats = inf|

		var pbinds = List.newClear;
		var syncPbind = super.copy.cycles.asSortedArray[0][1].asPbind(true);

		this.print;
		super.copy.cycles.asSortedArray.do({|oneCycle|
			oneCycle.postln;
			QuantPlot().plot(super.copy.key, oneCycle[1].index, oneCycle[1]);
		});

		pbinds.add(super.copy.cycles.asSortedArray[0][1].asPbind(true));
		super.copy.cycles.asSortedArray.do({|oneCycle|
			pbinds.add(oneCycle[1].asPbind(false));
		});

		pbinds = Pswitch(pbinds.asArray, Pseq([0, Pseq(which.asArray,repeats)]));

		^pbinds;
	}
}