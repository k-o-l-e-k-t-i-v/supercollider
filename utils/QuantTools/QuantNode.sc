QuantNode {

	var <>key;
	var >levels, >times, >curves;
	var <node, <prewNode;
	var group, bus;

	*new {|key, quant, fadeTime| ^super.new.init(key, quant, fadeTime);	}

	init{|key, quant, fadeTime|
		var instance;
		this.key = key;

		instance = QuantMap.currentNode;
		"instance: %".format(instance).postln;
		instance.isNil.if(
			{
				var defValue = QuantMap.currentProxy.getDefaultVal(key.asSymbol);
				"% defValue: %".format(QuantMap.currentProxy.envirKey, defValue).postln;

				instance = this;
				node = NodeProxy.control(Server.local, 1);
				node.set(key.asSymbol, defValue); // ?? jak udelat fade z tyhle hodnoty
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

	env { |levels = #[0,1,0], times = #[0.05,0.95], curves = #[5,-5]|

		var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);

		levels = levels.add(levels[levels.size-1]);
		times = times.add(node.quant - times.sum);
		times = times.add(0);

		this.levels = levels;
		this.times = times;

		node.group = proxy.group;

		node[0] = {
			DemandEnvGen.kr(
				Dseq(levels, inf),
				Dseq(times, inf),
				1, 5, 1, 1,
				doneAction:0
			)
		};


		/*
		node[0] = {
		EnvGen.kr(
		Env(levels,times),
		gate:\trigEnv.tr,
		timeScale: (1/currentEnvironment.clock.tempo)
		);
		};
		node[1] = \set -> Pbind(\type, \set, \args, [\trigEnv], \trigEnv, 1, \dur, times.sum);
		// .play(currentEnvironment.clock,quant:times.sum);
		*/
		TempoClock.default.sched(this.time2quant(node.quant), { proxy.set(key.asSymbol, node); nil;});

		// "\t - node.CODE %".format(node.asCode).postln;
	}

	time2quant{|quant|
		if(currentEnvironment === topEnvironment)
		{ ^TempoClock.default.timeToNextBeat(quant); }
		{ ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); };
	}

}
