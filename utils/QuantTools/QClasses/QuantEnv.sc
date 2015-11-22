QuantEnv {
	classvar version = 0.10;
	var <>key, <>quant, <envelope;
	// var qNode;

	*new {|key = \amp, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2]|
		^super.newCopyArgs(key, quant).init(levels, times, curves).add2Map;
	}

	init {|levels, times, curves|
		"\nQuantEnv init".postln;

		envelope = Env(levels, times, curves);
		// envelope.plot;
		this.print;
	}

	add2Map {
		"\nQuantEnv add2Map".postln;
		QuantMap.add(\default, \phase1, this); //QuantNode(QuantMap.currentProxy, QuantMap.currentSlot, 1, this));
		// QuantMap.print;
	}

	cycle {|stage, phase|
		"\nQuantEnv cycle [%, %]".format(stage, phase).postln;
		QuantMap.edit(stage, phase, this);
	}

	/*
	env { |env|
	var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);
	var synthDef, synth;

	node.group = proxy.group;

	synthDef = SynthDef(
	"qNode [ %, q%, c% ]".format(key, node.quant, node.index),
	{
	Out.kr(node.index, EnvGen.kr(env, doneAction:2))
	}
	).add;


	this.stop;

	"time2quant [%]".format(this.time2quant(node.quant)).postln;

	// t = TempoClock.default.sched(time2quant, {
	clock.sched(this.time2quant(node.quant), {

	node.source = synthDef;
	// "objects[index].synthDef.func: %".format(node.objects[0].synthDef.func).postln;
	// "\ntick quant [%]".format(node.quant).postln;
	// "\t-cBusIndex [%]".format(node.index).postln;
	// "\t-nodeNameDef [%]".format(synthDef.name).postln;
	// "\t-cBusChannels [%]".format(node.numChannels).postln;
	// "\t-nodeID [%]".format(node.nodeID).postln;
	// "\t-envDuration [%]".format(env.duration).postln;

	proxy.set(key.asSymbol, node);

	node.quant;
	});

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
	*/
	print{
		// var txt;
		"\nQuantEnv |%| - (ver%)".format(super.copy.key, version).postln;
		"\t-envDuration [%]".format(envelope.duration).postln;
		"\t-envLevels [%]".format(envelope.levels).postln;
		"\t-envTimes [%]".format(envelope.times).postln;
		"\t-envCurves [%]".format(envelope.curves).postln;
		/*
		super.copy.cycles.asSortedArray.do({|oneCycle|
		txt = txt + "\n %".format(oneCycle[1].print);
		});
		*/
		// txt.postln;
	}

}