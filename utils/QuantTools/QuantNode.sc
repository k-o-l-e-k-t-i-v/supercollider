QuantNode {

	var <>key;
	var >levels, >times, >curves;
	var <node, <prewNode;
	var group, bus;
	var clock;

	*new {|key, quant, fadeTime| ^super.new.init(key, quant, fadeTime);	}

	init{|key, quant, fadeTime|
		var instance;
		this.key = key;

		instance = QuantMap.currentNode;
		"instance: %".format(instance).postln;
		instance.isNil.if(
			{
				var defValue = QuantMap.currentProxy.getDefaultVal(key.asSymbol);
				// "% defValue: %".format(QuantMap.currentProxy.envirKey, defValue).postln;

				instance = this;
				node = NodeProxy.control(Server.local, 1);
				node.set(key.asSymbol, defValue); // ?? jak udelat fade z tyhle hodnoty

				clock = TempoClock.new();
				clock.permanent = true;
			},
			{
				node = instance.node;
			}
		);

		node.fadeTime = fadeTime;
		node.quant = quant;

		QuantMap.add(instance);
		^instance;
	}

	print{
		"init QuantNode %".format(QuantMap.findProxy(this)).postln;
		"\t - key : %".format(key).postln;
		"\t - quant : %".format(node.quant).postln;
		"\t - fadeTime : %".format(node.fadeTime).postln;
		"\t - levels : %".format(levels).postln;
		"\t - times : %".format(times).postln;
		"\t - curves : %".format(curves).postln;
		"\t - bus : %".format(node.bus).postln;

		^nil;
	}

	stop { clock.clear; }

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

	time2quant{|quant|
		if(currentEnvironment === topEnvironment)
		{ ^TempoClock.default.timeToNextBeat(quant); }
		{ ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); };
	}



}
